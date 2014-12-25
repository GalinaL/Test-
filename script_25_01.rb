# script_25_01.rb
=begin
	01	Navigate to Bing.com 
	02	Display the title of the Bing.com page
	03	Search for the word "What is Selenium?"
	04	Display the title and url of the page
	05	Create snapshot of the Bing.com result page
	06	Click on Selenium - Wikipedia, the free encyclopedia
	07	Display the title and url of the page
	08	Create snapshot of the page
	09	Click on About Wikipedia link
	10	Display the title and url of the page
	11	Create snapshot of the page About Wikipedia
	12	Navigate back
	13	Create snapshot of the page 
	14	Close the browser
=end

#==========================================================================
require 'watir-webdriver'
browser = Watir::Browser.new :firefox
#==========================================================================
#browser = Watir::Browser.new :ie
#browser = Watir::Browser.new :chrome
#browser = Watir::Browser.new :safari
#==========================================================================
browser.driver.manage.timeouts.implicit_wait = 5
#==========================================================================
url = "http://www.bing.com"

query = "What is Selenium?"
#==========================================================================
browser.goto url
puts "========================================"
puts "Title of bing.com: #{browser.title}"
puts "URL of bing.com: #{browser.url}"
#==========================================================================
browser.screenshot.save "hw_25_01.png"
browser.text_field(:id, "sb_form_q").set query
browser.button(:id, "sb_form_go").click
#==========================================================================
browser.screenshot.save "hw_25_02.png"
puts "========================================"
puts "Title of result page: #{browser.title}"
puts "URL of result page: #{browser.url}"
#==========================================================================
#browser.link(:text => "Selenium - Wikipedia, the free encyclopedia").click
browser.link(:text => /Selenium - Wikipedia/).click
browser.screenshot.save "hw_25_03.png"
puts "========================================"
puts "Title of Selenium - Wikipedia page: #{browser.title}"
puts "URL of Selenium - Wikipedia page: #{browser.url}"
#==========================================================================
browser.link(:text => /About /).click
browser.screenshot.save "hw_25_04.png"
puts "========================================"
puts "Title of About page: #{browser.title}"
puts "URL of About page: #{browser.url}"
#==========================================================================
browser.back
browser.screenshot.save "hw_25_05.png"
puts "========================================"
puts "Title of Blog page: #{browser.title}"
puts "URL of Blog page: #{browser.url}"
#==========================================================================
browser.close
#==========================================================================



