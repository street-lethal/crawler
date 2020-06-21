require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--window-size=2560,1600')

driver = Selenium::WebDriver.for :chrome, options: options
driver.navigate.to 'https://example.com/'

# sleep 1 # 安定しない場合

driver.save_screenshot 'io/output.png'

driver.quit

puts 'Done!'
