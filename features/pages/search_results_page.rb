class SearchResultPage < BasePage

  def initialize(browser)
    super(browser)
  end

  def fetch_all_results
    parent = findElementBy(:id,'atfResults')
    price = "span.a-size-base.a-color-price.s-price.a-text-bold"
    name_link = "div.a-row.a-spacing-small > div:nth-child(1) > a"
    result = get_child_elements(parent, :css, price)
    price_list = result.map{|item| item.text.strip.gsub(',','').to_i}
    result = get_child_elements(parent, :css, name_link)
    title_list = result.map{|item| item.attribute('title')}
    link_list = result.map{|item| item.attribute('href')}
    hash = price_list.zip(title_list.zip(link_list)).to_h
    sorted_price = Array.new
    sorted_price = hash.keys
    sorted_price = my_sort2(sorted_price)
    sorted_price.each do |item|
      puts "#{item} => #{hash[item]}"
    end
  end

  # def search_results_displayed?
  #   search_results?
  # end

  def my_sort(arr)
    flag = true
    len = arr.length
    while flag do
      flag = false
      (len-1).times do |i|
        if arr[i] > arr[i+1]
          arr[i],arr[i+1] = arr[i+1], arr[i]
          flag = true
        end
      end
      break unless flag
    end
    arr
  end


  def my_sort2(arr)
    flag = true
    len = arr.length
    for i in (0..len-2)
      for j in (i+1..len-1)
        if arr[i] > arr[j]
          arr[i], arr[j] = arr[j], arr[i]
        end
      end
    end
    arr
  end

end
