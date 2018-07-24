Feature: Search for a product on amazon and sort the search results

Scenario: User can search a product from the amazon home page and sort the search results by Price 
  Given I open "https://www.amazon.in"
  When I search for "iphone"
  Then I can sort results based on price and display them with Name and link to product
