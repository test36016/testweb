When(/^I tap on profile icon$/) do
  	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[1]")
  	@driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[1]").click
end

When(/^I press on profile icon$/) do
  	close_pop_up
  	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[1]")
  	@driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[1]").click
end

When(/^I am in the dial pad$/) do
  step "I set First device"
  close_pop_up
  step "I tap on profile icon"
  step "I tap on keypad option"
end

When(/^I tap on keypad option$/) do
  	waitForElementPresent("name", "Keypad")
  	@driver.find_element(:name,"Keypad").click
end

When(/^I tap on keypad button$/) do
  	waitForElementPresent("name", "dialpadButton")
  	@driver.find_element(:name,"dialpadButton").click
end

Then(/^user should see Keypad screen$/) do
  	waitForElementPresent("name", "DialpadScreenAddressBook")
	assertElementPresent(@driver.find_element(:name,"DialpadScreenAddressBook"))
end

When(/^I select "([^"]*)" country$/) do |arg1|
  	waitForElementPresent("name", "buttonSelectCountry")
  	@driver.find_element(:name,"buttonSelectCountry").click
  	puts arg1
  	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIASearchBar[1]")
  	@driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIASearchBar[1]").send_keys arg1
  	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  	@driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").click  	
end

When(/^I type one number$/) do
  	waitForElementPresent("name", "1")
  	@driver.find_element(:name,"1").click
end

When(/^I type two number$/) do
  waitForElementPresent("name", "2")
  	@driver.find_element(:name,"2").click
end

When(/^I type three number$/) do
  waitForElementPresent("name", "3")
  	@driver.find_element(:name,"3").click
end

When(/^I type four number$/) do
  waitForElementPresent("name", "4")
  	@driver.find_element(:name,"4").click
end

When(/^I type five number$/) do
  waitForElementPresent("name", "5")
  	@driver.find_element(:name,"5").click
end

When(/^I type six number$/) do
  waitForElementPresent("name", "6")
  	@driver.find_element(:name,"6").click
end

When(/^I type seven number$/) do
  waitForElementPresent("name", "7")
  	@driver.find_element(:name,"7").click
end

When(/^I type eight number$/) do
  waitForElementPresent("name", "8")
  	@driver.find_element(:name,"8").click
end

When(/^I type nine number$/) do
  waitForElementPresent("name", "9")
  	@driver.find_element(:name,"9").click
end

When(/^I type zero number$/) do
  	waitForElementPresent("name", "0")
  	@driver.find_element(:name,"0").click 
end

When(/^I type star number$/) do
  	waitForElementPresent("name", "✱")
  	@driver.find_element(:name,"✱").click
end

When(/^I type symbol number$/) do
  	waitForElementPresent("name", "#")
  	@driver.find_element(:name,"#").click
end

When(/^I type a valid phone number$/) do
  step "I type nine number"
  step "I type seven number"
  step "I type one number"
  step "I type one number"
  step "I type two number"
  step "I type four number"
  step "I type one number"
  step "I type one number"
  step "I type two number"
  step "I type six number"		
end

Then(/^User should see typed number$/) do
  	step "I press call button on keypad"
  	step "I end the call"
  	step "I tap on Ok button"
  	step "I tap on back button"
  	waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").text
	assert_send([text, :include?, "+91 97112 41126"])
end

When(/^I am in the activity screen$/) do
  step "I set First device"
  close_pop_up
end

Then(/^User should see the selected country$/) do
 	waitForElementPresent("name", "IN")
  	assertElementPresent(@driver.find_element(:name,"IN"))
end

When(/^I press call button on keypad$/) do
  	waitForElementPresent("name", "buttonCall")
  	@driver.find_element(:name,"buttonCall").click
end

When(/^I type a Invalid phone number$/) do
  step "I type nine number"
  step "I type seven number"
  step "I type one number"
  step "I type one number"
  step "I type two number"
  step "I type four number"
  step "I type one number"
  step "I type one number"
  step "I type two number"	
end

Then(/^Call should not be started$/) do
  	sleep(1)
  	step "user should see Keypad screen"
end

When(/^I type a Invalid phone number with special characters$/) do
  step "I type nine number"
  step "I type seven number"
  step "I type one number"
  step "I type one number"
  step "I type two number"
  step "I type four number"
  step "I type one number"
  step "I type one number"
  step "I type star number"
  step "I type two number"	
end

Then(/^the call should be established from dial pad$/) do
  	waitForElementPresent("name", "hangup")
  	assertElementPresent(@driver.find_element(:name,"hangup"))
end

When(/^I cancel the call$/) do
  	step "I end the call"
end

Then(/^I should NOT see the call quality feedback popup$/) do
  	step "Call should not be started"
end
