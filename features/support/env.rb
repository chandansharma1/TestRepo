require 'cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'rspec/expectations'
require 'report_builder'
#require 'page-object/page_factory'

require File.join(File.dirname(__FILE__), 'helpers', 'webdriver_helper.rb')

World WebDriverHelper
World PageObject::PageFactory
World RSpec::Matchers

Before do |scenario|
  @browser = Selenium::WebDriver.for :chrome
  @browser.manage.timeouts.implicit_wait = 30
  @browser.manage.timeouts.page_load = 30
  @assert = SoftAssertion.new
  @base_page = BasePage.new(@browser)
  @amazonHomePage = AmazonHomePage.new(@browser)
end

After do |scenario|
  @browser.quit
end
