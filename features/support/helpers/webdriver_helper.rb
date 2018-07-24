require 'selenium-webdriver'

module WebDriverHelper

  def get_child_elements(parent_element, selector, value, check_displayed = true)
    if check_displayed
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until{parent_element.find_elements(selector, value)[0].displayed?}
    end
    parent_element.find_elements(selector, value)
  end

  def get_element(selector, value, check_displayed = true)
    if check_displayed
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until{@browser.find_element(selector, value).displayed?}
    end
    @browser.find_element(selector, value)
  end

end
