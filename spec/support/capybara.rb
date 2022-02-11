require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    clear_session_storage: true,
    clear_local_storage: true,
    capabilities: [Selenium::WebDriver::Chrome::Options.new(
      args: %w[headless disable-gpu no-sandbox window-size=1024,768],
    )]
end

Capybara.javascript_driver = :selenium_chrome_headless