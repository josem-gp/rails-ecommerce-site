# Start from the official ruby image, then update and install JS & DB
FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create a directory for the application and use it
RUN mkdir /myapp
WORKDIR /myapp

# Gemfile and lock file need to be present, they'll be overwritten immediately
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gem dependencies
RUN gem install bundler:2.2.32
RUN bundle install
RUN curl https://deb.nodesource.com/setup_12.x | bash
ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn  && apt-get install -y npm
RUN yarn install
RUN yarn add bootstrap jquery popper.js
COPY . /myapp

# This script runs every time the container is created, necessary for rails
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start rails
CMD ["rails", "server", "-b", "0.0.0.0"]