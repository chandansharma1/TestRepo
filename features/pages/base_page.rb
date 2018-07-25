class BasePage

  include WebDriverHelper

  def initialize(browser)
    @browser = browser
  end

end
