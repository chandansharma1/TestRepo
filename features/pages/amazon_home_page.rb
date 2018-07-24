require File.join(File.dirname(__FILE__),'base_page.rb')

class AmazonHomePage < BasePage

  page_url "https://www.amazon.in"
  expected_title("Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in")
  text_field(:searchBox, :id => 'twotabsearchtextbox')
  button(:searchButton, :class => 'nav-input')

  def search(searchTerm)
    self.searchBox = searchTerm
    searchButton
  end

end
