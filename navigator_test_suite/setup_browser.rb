require 'yaml'
require 'capybara/rspec'
require "chromedriver/helper"
require 'selenium-webdriver'
require './lib/homepage.rb'
require './lib/main.rb'
Dir["./lib/*.rb"].each {|file| require file }

class SetupBrowser

  attr_accessor :web, :url

  def initialize
    config = YAML.load(File.open('./config/environment.yaml'))['environment']
    self.web = config['web']
    self.url = config['url']
  end

  def load_browser
    browser = self.web['driver']

    Capybara.register_driver(browser.to_sym) do |app|
      Capybara::Selenium::Driver.new(app, :browser => browser.to_sym)
    end

    # Set default values for Capybara
    Capybara.default_selector = :xpath
    Capybara.default_max_wait_time = 30
    Capybara.default_driver = browser.to_sym

    # Start Capybara session
    @session = Capybara::Session.new(browser.to_sym)
    @homepage = HomePage.new(@session)

    @session.driver.browser.manage.window.move_to(0,0)
    @session.driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(1440,821)
    @session.driver.browser.manage.window.maximize()
    @homepage.goto_homepage(self.url)
    @homepage
  end
end
