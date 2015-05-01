When(/^I tap on profile icon$/) do
  	waitForElementPresent("xpath", "//UIATabBar[1]/UIAButton[1]")
  	@driver.find_element(:xpath,"//UIATabBar[1]/UIAButton[1]").click
end

When(/^I tap on activity icon$/) do
  	waitForElementPresent("xpath", "//UIATabBar[1]/UIAButton[2]")
  	@driver.find_element(:xpath,"//UIATabBar[1]/UIAButton[2]").click
end

When(/^I press on profile icon$/) do
  if $closePopUps
  	close_pop_up
  end
  	waitForElementPresent("xpath", "//UIATabBar[1]/UIAButton[1]")
  	@driver.find_element(:xpath,"//UIATabBar[1]/UIAButton[1]").click
end
#Test DailPad
When(/^I am in the dial pad$/) do
  step "I set First device"
  if $closePopUps
      close_pop_up
  end
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
  	waitForElementPresent("xpath", "//UIASearchBar[1]")
  	@driver.find_element(:xpath,"//UIASearchBar[1]").send_keys arg1
  	waitForElementPresent("xpath", "//UIATableCell[1]")
  	@driver.find_element(:xpath,"//UIATableCell[1]").click  	
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
  	waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  	text = @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").text
	assert_send([text, :include?, "+91 97112 41126"])
end

When(/^I am in the activity screen$/) do
  step "I set First device"
  if $closePopUps
      close_pop_up
  end
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

Then(/^User should see typed number on keypad$/) do
  	step "I press call button on keypad"
  	step "I end the call"
  	step "I tap on Ok button"
  	step "I tap on back button"
  	step "I tap on activity icon"
  	waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  	text = @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").text
	assert_send([text, :include?, "+91 97112 41126"])
end

When(/^I tap on keypad button from contact$/) do
  	step "I click on contact icon"
  	waitForElementPresent("xpath", "//UIATableGroup[1]/UIAButton[1]")
  	@driver.find_element(:xpath,"//UIATableGroup[1]/UIAButton[1]").click
end

When(/^I tap on backspace button$/) do
	waitForElementPresent("name", "buttonDeleteLastCharacter")
  	@driver.find_element(:name,"buttonDeleteLastCharacter").click
end

When(/^I clear the number$/) do
	step "I tap on backspace button"
	step "I tap on backspace button"
	step "I tap on backspace button"
end

Then(/^user should see message for invalid number$/) do
  	waitForElementPresent("name", "Error")
  	assertElementPresent(@driver.find_element(:name,"Error"))
end

When(/^I tap contact icon on keypad screen$/) do
  	waitForElementPresent("name", "DialpadScreenAddressBook")
  	@driver.find_element(:name,"DialpadScreenAddressBook").click
end

Then(/^user should see all contact screen$/) do
  	waitForElementPresent("name", "All Contacts")
  	assertElementPresent(@driver.find_element(:name,"All Contacts"))
end

When(/^I tap on Add number on key pad$/) do
  	waitForElementPresent("name", "buttonSaveNumber")
  	@driver.find_element(:name,"buttonSaveNumber").click
end

When(/^I tap on create new contact option$/) do
  	waitForElementPresent("name", "Create new contact")
  	@driver.find_element(:name,"Create new contact").click
end

Then(/^user should see edit profile screen$/) do
  	waitForElementPresent("name", "Edit Profile")
  	assertElementPresent(@driver.find_element(:name,"Edit Profile"))
end

When(/^I tap on add to existing option$/) do
  	waitForElementPresent("name", "Add to existing")
  	@driver.find_element(:name,"Add to existing").click
end

Then(/^user should see Address book contacts screen$/) do
  	waitForElementPresent("name", "Addressbook Contacts")
  	assertElementPresent(@driver.find_element(:name,"Addressbook Contacts"))
end