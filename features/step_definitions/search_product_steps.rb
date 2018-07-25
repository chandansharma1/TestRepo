Given(/^I launch amazon$/) do
  visit AmazonHomePage do |page|
    page.verifyPageTitle(page.title)
  end
end

When(/^I search for "(.*?)"$/) do |product|
  on AmazonHomePage do |page|
    page.search(product)
  end
end

Then(/^I can sort results based on price and display them with Name and link to product$/) do
  on SearchResultPage do |page|
    page.fetch_all_results
  end
end
