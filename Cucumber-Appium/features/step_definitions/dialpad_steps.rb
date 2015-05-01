When(/^I tap info icon on profile screen$/) do
	waitForElementPresent("name", "infoButton")
  	@driver.find_element(:name,"infoButton").click
end

When(/^I tap view profile on profile screen$/) do
	waitForElementPresent("name", "View Profile")
  	@driver.find_element(:name,"View Profile").click
end

When(/^I go to the edit profile screen$/) do
  if $closePopUps
      close_pop_up
  end
  step "I tap on profile icon"
  step "I tap info icon on profile screen"
  step "I tap view profile on profile screen"
  step "I tap on edit button"
end

When(/^I am on the edit profile screen$/) do
  step "I set First device"
  if $closePopUps
      close_pop_up
  end
  step "I tap on profile icon"
  step "I tap info icon on profile screen"
  step "I tap view profile on profile screen"
  step "I tap on edit button"
end

When(/^I add new phone number$/) do
	step "I delete existing number"
	waitForElementPresent("name", "Insert Add Phone")
  	@driver.find_element(:name,"Insert Add Phone").click	
end

When(/^I enter a new number$/) do
	step "I type a valid phone number"
end

When(/^I delete existing number$/) do
	waitForElementPresent("xpath", "//UIATableCell[8]/UIAButton[1]")
	del = isElementPresent("xpath", "//UIATableCell[9]/UIATextField[1]")
	if del==true
		@driver.find_element(:xpath,"//UIATableCell[9]/UIAButton[1]").click
		waitForElementPresent("xpath", "//UIATableCell[9]/UIAButton[3]")
		@driver.find_element(:xpath,"//UIATableCell[9]/UIAButton[3]").click
		puts "Added number is deleted"
	end
end

When(/^I enter the number "([^"]*)"$/) do |arg1|
  	waitForElementPresent("xpath", "//UIATableCell[9]/UIATextField[1]")
  	step "I clear text of number field"
  	@driver.find_element(:xpath,"//UIATableCell[9]/UIATextField[1]").send_keys arg1
end

When(/^I click the Done button$/) do
  step "I tap on done button"
end

Then(/^I should see the number change to "([^"]*)"$/) do |arg1|
  waitForElementPresent("xpath", "//UIATableCell[9]/UIATextField[1]")
  text = @driver.find_element(:xpath,"//UIATableCell[9]/UIATextField[1]").text
  puts text
  assert_send([text, :include?, arg1]) 
end

Then(/^I should see the number is saved in the format "([^"]*)"$/) do |arg1|
  sleep(20)
  waitForElementPresent("xpath", "//UIATableCell[11]/UIATextField[1]")
  text = @driver.find_element(:xpath,"//UIATableCell[11]/UIATextField[1]").text
  puts text
  assert_send([text, :include?, arg1]) 
end

When(/^I clear text of number field$/) do
  	waitForElementPresent("xpath", "//UIATableCell[9]/UIATextField[1]")
  	@driver.find_element(:xpath,"//UIATableCell[9]/UIATextField[1]").clear
end

When(/^I clear textfield$/) do
  	waitForElementPresent("xpath", "//UIAKeyboard[1]/UIAKey[12]")
  	@driver.find_element(:xpath,"//UIAKeyboard[1]/UIAKey[12]").click
end

Then(/^a message is displayed saying 'Invalid Phone Number'$/) do
  sleep(2)
  waitForElementPresent("name", "At least one phone number is not valid! Please check the numbers")
  assertElementPresent(@driver.find_element(:name,"At least one phone number is not valid! Please check the numbers"))
end

When(/^I paste the number "([^"]*)"$/) do |arg1|
 	waitForElementPresent("xpath", "//UIATableCell[9]/UIATextField[1]")
  	step "I clear text of number field"
  	@driver.find_element(:xpath,"//UIATableCell[9]/UIATextField[1]").send_keys arg1
end

When(/^I am on the contact info screen$/) do
	step "I am on chat window with \"Automation One\" user"
	step "I press the Contact option"
	step "I press the View Profile"
	step "I press contactMenu info icon"
	step "I press edit profile on contactMenu info icon"
end

When(/^I press contactMenu info icon$/) do
	waitForElementPresent("name", "contactMenu info")
	@driver.find_element(:name,"contactMenu info").click
end

When(/^I press edit profile on contactMenu info icon$/) do
	waitForElementPresent("name", "Edit Profile")
	@driver.find_element(:name,"Edit Profile").click
end

When(/^I add new phone number on contact info screen$/) do
	step "I delete existing number on contact info screen"
	waitForElementPresent("name", "Insert phoneCell")
  	@driver.find_element(:name,"Insert phoneCell").click	
end

When(/^I delete existing number on contact info screen$/) do
	waitForElementPresent("xpath", "//UIATableCell[5]/UIATextField[1]")
	del = isElementPresent("xpath", "//UIATableCell[5]/UIATextField[1]")
	if del==true
		@driver.find_element(:xpath,"//UIATableCell[5]/UIAButton[1]").click
		waitForElementPresent("xpath", "//UIATableCell[5]/UIAButton[4]")
		@driver.find_element(:xpath,"//UIATableCell[5]/UIAButton[4]").click
		puts "Added number is deleted"
	end
end

When(/^I enter the number "([^"]*)" on contact info screen$/) do |arg1|
  	waitForElementPresent("xpath", "//UIATableCell[5]/UIATextField[1]")
  	step "I clear textfield"
  	@driver.find_element(:xpath,"//UIATableCell[5]/UIATextField[1]").send_keys arg1
end

Then(/^I should see the number change to "([^"]*)" on contact info screen$/) do |arg1|
  waitForElementPresent("xpath", "//UIATableCell[5]/UIATextField[1]")
  text = @driver.find_element(:xpath,"//UIATableCell[5]/UIATextField[1]").text
  puts text
  assert_send([text, :include?, arg1]) 
end

When(/^I paste the number "([^"]*)" on contact info screen$/) do |arg1|
  	waitForElementPresent("xpath", "//UIATableCell[5]/UIATextField[1]")
  	step "I clear textfield"
  	@driver.find_element(:xpath,"//UIATableCell[5]/UIATextField[1]").send_keys arg1
end