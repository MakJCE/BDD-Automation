begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'watir'

#PTravel Settings
ENV['USER']="john.doe.ucbcba@gmail.com"
ENV['PSW']="calidad2021"

Capybara.default_driver = :selenium

# Set the host the Capybara tests should be run against
Capybara.app_host = ENV["CAPYBARA_HOST"]

# Set the time (in seconds) Capybara should wait for elements to appear on the page
Capybara.default_max_wait_time = 15
Capybara.default_driver = :selenium
Capybara.app_host = "http://nahual-argentina-develop.vercel.app/"

class CapybaraDriverRegistrar
  # register a Selenium driver for the given browser to run on the localhost
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      args = ['--disable-web-security','--user-data-dir=C:\Users\ABC\AppData\Local\Google\Chrome\User Data','--allow-running-insecure-content']

      options = Selenium::WebDriver::Chrome::Options.new(args: args)
      Capybara::Selenium::Driver.new(app, :browser => browser, capabilities: [options])
    end
  end

end



CapybaraDriverRegistrar.register_selenium_driver(:chrome)
#CapybaraDriverRegistrar.register_selenium_driver(:chrome)
Capybara.run_server = false
#World(Capybara)

