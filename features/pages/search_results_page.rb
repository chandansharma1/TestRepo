class SearchResultPage < BasePage

  element(:search_results, :id => 'atfResults')

  def fetch_all_results
    parent = find_element(:id,'atfResults')
    price = "span.a-size-base.a-color-price.s-price.a-text-bold"
    name_link = "div.a-row.a-spacing-small > div:nth-child(1) > a"
    result = get_child_elements(parent, :css, price)
    price_list = result.map{|item| item.text.strip.gsub(',','').to_i}
    result = get_child_elements(parent, :css, name_link)
    title_list = result.map{|item| item.attribute('title')}
    link_list = result.map{|item| item.attribute('href')}
    hash = price_list.zip(title_list.zip(link_list)).to_h
    sorted_price = Array.new
    sorted_price = hash.keys.sort
    sorted_price.each do |item|
      puts "#{item} => #{hash[item]}"
    end
  end

  def search_results_displayed?
    search_results?
  end 

end
