require 'selenium-webdriver'

module WebDriverHelper

  def findElementBy(type, value, check_displayed = true)
    if check_displayed
      wait = Selenium::WebDriver::Wait.new(:timeout =>10)
      wait.until { @browser.find_element(type, value).displayed? }
    end
    @browser.find_element(type,value)
  end

  def enterText(element, term)
    element.clear
    element.send_keys term
  end

  def clickElement(type, value, check_displayed = true)
    element = findElementBy(type, value, check_displayed)
    element.click
  end

  def verifyPageTitle(expected)
    @browser.title.include? expected
  end

  def get_child_elements(parent, selector, value)
    parent.find_elements(selector,value)
  end

  def visit(pagename, &block)
    page = pagename.new(@browser)
    @browser.get(page.url)
    block.call(page)
    page
  end

  def on(pagename, &block)
    page = pagename.new(@browser)
    block.call(page)
    page
  end
end
