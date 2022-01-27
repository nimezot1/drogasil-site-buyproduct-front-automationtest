require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'cpf_cnpj'
require 'faker'
require 'pry'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper'
require 'yaml'
require 'httparty'
require 'securerandom'

World(PageObjects)
World(Capybara::DSL)
World(Capybara::RSpecMatchers)
Faker::Config.locale = 'pt-BR'

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")
BROWSER = ENV['BROWSER']

$browser = BROWSER
$ambiente = ENVIRONMENT_TYPE
$responsivo = BROWSER == 'mobile'

case BROWSER
when 'local', 'mobile'
  Selenium::WebDriver::Chrome::Service.driver_path = './chromedriver.exe'
when 'linux'
  Selenium::WebDriver::Chrome::Service.driver_path = '/usr/bin/chromedriver'
end

class Machine_downtime
  include Capybara::DSL

  def machine_stop_start (machine_stop)
      find('input[id="datetimefield-1312-inputEl"]').click
  end
end

Capybara.register_driver :chrome do |app|
  case BROWSER
  # when 'remote_chrome'
  #   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { 'args' => ['disable-infobars'] })
  #   Capybara::Selenium::Driver.new(app,
  #                                  browser: :remote, url: 'http://10.1.155.5:4444/wd/hub',
  #                                  desired_capabilities: capabilities)
  when 'local', 'linux', 'mobile'
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      case BROWSER
      when 'mobile'
        options.add_emulation(device_name: 'iPhone 6')
      when 'linux'
        options.add_argument '--headless'
      end
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
      options.add_argument '--start-maximized'
      options.add_argument 'user-agent="like RD-AUTOMATION-TESTING"'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.app_host = CONFIG['url_base']
  config.default_max_wait_time = 5
  Capybara.page.driver.browser.manage.window.maximize
end

def take_screenshot(file_name, result)
  file_path = "./evidencias/#{result}"
  screenshot = "#{file_path}/#{file_name}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Click here')
end

def embed(x,y=nil,z=nil)
end

