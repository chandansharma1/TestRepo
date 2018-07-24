module BrowserHelper

  def kill_any_previous_instance
    puts "Killing previous chrome, if already open"
    system("killall chrome")
    sleep 2
  end

  def kill_any_previous_chromedriver
    begin
      Process::wait(spawn('TaskKill /F /IM chromedriver.exe'))
    rescue
    end
  end

  def start_chromedriver
    spawn("chromedriver")
  end

  def setting_browser(browser)
    browser.manage.timeouts.page_load = 120
    browser.manage.timeouts.implicit_wait = 5
    delete_browser_cookies(browser)
    browser.manage.window.maximize
  end

  def delete_browser_cookies(browser)
    browser.manager.delete_all_cookies
    sleep ONE_SECOND
  end

  def create_chrome_profile
    profile = Selenium::WebDriver::Chrome::Profile.new
    profile["intl.accept_languages"] = "en-US"
    profile
  end

  def create_browser_instance(scenario_name)
    browser = create_local_browser
    setting_browser(browser)
    browser
  end

  def create_local_browser
    max_try = 2
    kill_any_previous_instance
    profile = create_chrome_profile
    begin
      puts "Starting chrome locally"
      browser = Selenium::WebDriver.for :chrome,:profile =>profile
    rescue Exception => e
      max_try -= 1
      if max_try > 0
        puts "Trying to start chrome again"
        retry
      else
        raise e.message
      end
    end
  end

end 
