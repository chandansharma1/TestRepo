Given(/^I open "(.*?)"$/) do |site|
  visit AmazonHomePage do |page|
    page.has_expected_title?
  end
end

When(/^I search for "(.*?)"$/) do |product|
  on AmazonHomePage do |page|
    page.search(product)
  end
end

Then(/^I can sort results based on price and display them with Name and link to product$/) do
  on SearchResultPage do |page|
    @assert.equals page.search_results_displayed?, true, "Search Results not displayed"
    raise "#{@assert.messages}" if @assert.status == :failed
    page.fetch_all_results
  end
end
