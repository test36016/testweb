Given(/^I have App running with appium$/) do
 # Make sure you have started appium server 
end

Then(/^second user should see message sent to group (\d+)$/) do |arg1|
  	step "I am logged in with \"pl.ios.automation2\" account on second device"
  	close_pop_up
  	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").text
	assert_send([text, :include?, @message]) 
end

When(/^I tap on the Gallery button in group chat$/) do
	sleep(2)
  	waitForElementPresent("name", "Gallery")
  	@driver.find_element(:name,"Gallery").click
end

Then(/^user should see the file in group chat$/) do
	sleep(3)
  	step "I press the back button"
	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").text
  	assert_send([text, :include?, "File Transfer"])
end

Then(/^user should see the shared contact in group chat$/) do
  	sleep(3)
  	step "I press the back button"
	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").text
  	assert_send([text, :include?, "Shared contact"])
end

When(/^I tap on the Share Contact button in group chat$/) do
	sleep(2)
  	waitForElementPresent("name", "Share Contact")
  	@driver.find_element(:name,"Share Contact").click
end

When(/^I tap on the Share location button in group chat$/) do
	sleep(2)
  	waitForElementPresent("name", "Share Location")
  	@driver.find_element(:name,"Share Location").click
end

When(/^"pl.ios.automation5" writes "(.*?)"$/) do |arg1|
  	step "I am logged in with \"pl.ios.automation5\" account on Third device"
  	step "I am in the group 1 chat window"
  	@message4 = arg1
	puts @message4
	waitForElementPresent("xpath", "//UIAApplication[1]//UIATextView[1]")
	@driver.find_element(:xpath, "//UIAApplication[1]//UIATextView[1]").send_keys @message4
	step "I tap \"Send\" button"
end

Then(/^the message should be sent to group (\d+) from third user$/) do |arg1|
  	step "I press the back button"
  	waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[2]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[2]").text
	assert_send([text, :include?, @message4]) 
end

When(/^First user send the emoticons/) do
	step "I select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"group 1\" group"
	step "I press the Emoticon icon"
	step "I select an emoticon"
	step "I tap \"Send\" button"
	#step "I should see that emoticon in the group chat screen"
end

When(/^Second user send the emoticons/) do
	step "I am on second device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"group 1\" group"
	step "I press the Emoticon icon"
	step "I select an emoticon"
	step "I tap \"Send\" button"
	#step "I should see that emoticon in the group chat screen"
end

When(/^Third user send the emoticons/) do
	step "I am on third device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"group 1\" group"
	step "I press the Emoticon icon"
	step "I select an emoticon"
	step "I tap \"Send\" button"
	#step "I should see that emoticon in the group chat screen"
end

When(/^I tap setting icon in group chat$/) do
	sleep(2)
  	waitForElementPresent("name", "groupchatEditGroupChat")
  	@driver.find_element(:name,"groupchatEditGroupChat").click
end

Then(/^I should see the Group Info screen$/) do
 	sleep(1)
 	waitForElementPresent("name", "Group Info")
	assertElementPresent(@driver.find_element(:name, "Group Info"))
end
