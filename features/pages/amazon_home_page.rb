require File.join(File.dirname(__FILE__),'base_page.rb')

class AmazonHomePage < BasePage

 attr_reader :url, :title
  # expected_title("Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in")
  # text_field(:searchBox, :id => 'twotabsearchtextbox')
  # button(:searchButton, :class => 'nav-input')

  def initialize(browser)
    super(browser)
    @url = "https://www.amazon.in"
    @title = "Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in"
  end

  def search(search_term)
    search_box = findElementBy(:id,'twotabsearchtextbox')
    enterText(search_box,search_term)
    clickElement(:class, 'nav-input')
  end

end
