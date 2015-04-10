Given(/^I have App running with appium$/) do
 # Make sure you have started appium server 
end

Given /^I am on the login window$/ do
		step "I set First device"
		wait = Selenium::WebDriver::Wait.new(:timeout => 180) # seconds
    	wait.until { @driver.find_element(:name, "Prelive") }
    	@driver.find_element(:name, "Prelive").click
end

Given /^I am on the login window for second device$/ do
		#secondDeviceLaunch
		#step "I set Second device"
		step "I am on second device"
		wait = Selenium::WebDriver::Wait.new(:timeout => 180) # seconds
    	wait.until { @driver.find_element(:name, "Prelive") }
    	@driver.find_element(:name, "Prelive").click
end

Given /^I am on the login window for third device$/ do
		#thridDeviceLaunch
		#step "I set Third device"
		step "I am on third device"
		wait = Selenium::WebDriver::Wait.new(:timeout => 180) # seconds
    	wait.until { @driver.find_element(:name, "Prelive") }
    	@driver.find_element(:name, "Prelive").click
end

Given /^I am on the login window on simulator device$/ do
		step "I am on simulator device"
		wait = Selenium::WebDriver::Wait.new(:timeout => 180) # seconds
    	wait.until { @driver.find_element(:name, "Prelive") }
    	@driver.find_element(:name, "Prelive").click
end

When /^I enter "(.*?)" in username field$/ do |arg1|
	sleep(1)
	username  = read_config(arg1)
	puts username
	waitForElementPresent("xpath", "//UIATextField[1]")
	@driver.find_element(:xpath, "//UIATextField[1]").send_keys username
	
end

When(/^I enter the usual password in password field$/) do
  	password = read_config('usualPassword')
  	waitForElementPresent("xpath", "//UIASecureTextField[1]")
  	@driver.find_element(:xpath, "//UIASecureTextField[1]").send_keys password
end

When(/^I click on login Button$/) do
	waitForElementPresent("xpath", "//UIAElement[1]//UIAButton[contains(@name,'signInButton')]")
	@driver.find_element(:xpath, "//UIAElement[1]//UIAButton[contains(@name,'signInButton')]").click
end

Then(/^I should be in "(.*?)" Screen$/) do |arg1|
  	close_pop_up
	waitForElementPresent("xpath", "//UIAApplication[1]//UIATabBar[1]/UIAButton[3]")
	assertElementPresent(@driver.find_element(:xpath, "//UIAApplication[1]//UIATabBar[1]/UIAButton[3]"))
end

Then /^I should see Phone number validation screen$/ do
	waitForElementPresent("name", "textFieldPhoneNumber")
	assertElementPresent(@driver.find_element(:name, "textFieldPhoneNumber"))
end

Given(/^I am logged in with "(.*?)" account$/) do |arg1|
  	step "I am on the login window"
  	username  = read_config(arg1)
	puts username
	waitForElementPresent("xpath", "//UIATextField[1]")
	@driver.find_element(:xpath, "//UIATextField[1]").send_keys username
	step "I enter the usual password in password field"
	step "I click on login Button"
end

Given(/^I am logged in with "(.*?)" account on second device$/) do |arg1|
  	step "I am on the login window for second device"
  	username  = read_config(arg1)
	puts username
	waitForElementPresent("xpath", "//UIATextField[1]")
	@driver.find_element(:xpath, "//UIATextField[1]").send_keys username
	step "I enter the usual password in password field"
	step "I click on login Button"
end

Given(/^I am logged in with "(.*?)" account on Third device$/) do |arg1|
  	step "I am on the login window for third device"
  	username  = read_config(arg1)
	puts username
	waitForElementPresent("xpath", "//UIATextField[1]")
	@driver.find_element(:xpath, "//UIATextField[1]").send_keys username
	step "I enter the usual password in password field"
	step "I click on login Button"
end

Given(/^I am logged with "([^"]*)" account$/) do |arg1|
  	step "I am on the login window"
  	username  = read_config(arg1)
	puts username
	waitForElementPresent("xpath", "//UIATextField[1]")
	@driver.find_element(:xpath, "//UIATextField[1]").send_keys username
	password = read_config('paidAccountPassword')
  	waitForElementPresent("xpath", "//UIASecureTextField[1]")
  	@driver.find_element(:xpath, "//UIASecureTextField[1]").send_keys password
  	step "I click on login Button"
  	close_pop_up
end