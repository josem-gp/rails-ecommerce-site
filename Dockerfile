# Start from the official ruby image
FROM ruby:3.1.2

# Install Node.js 14.x
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get update && apt-get install -y nodejs

# Install PostgreSQL client
RUN apt-get install -y postgresql-client

# Install additional dependencies for nokogiri gem
RUN apt-get install -y libxml2-dev libxslt-dev

# Create a directory for the application and use it
RUN mkdir /myapp
WORKDIR /myapp

# Copy Gemfile and lock file to the container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gem dependencies
RUN echo "gem: --no-document > ~/.gemrc"
RUN gem install bundler:2.2.32
RUN gem install nokogiri --platform=ruby
RUN bundle install
RUN bundle config set force_ruby_platform true

# Install Yarn
RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn

# Copy the rest of the application code
COPY . /myapp

# Copy the entrypoint script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint script as the default command
ENTRYPOINT ["entrypoint.sh"]

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

