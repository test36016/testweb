require 'test/unit/assertions'
require 'test/unit/assertions.rb'
#require 'rubygems'
#require 'appium_lib'

World(::Test::Unit::Assertions)

When(/^I click on contact icon$/) do
  	#waitForElementPresent("xpath", "//UIAApplication[1]//UIATabBar[1]/UIAButton[3]")
  	#@driver.find_element(:xpath,"//UIAApplication[1]//UIATabBar[1]/UIAButton[3]").click
	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[3]")
  	@driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[3]").click
end


Given(/^I am in chat window with "(.*?)"$/) do |arg1|
	close_pop_up
	step "I click on contact icon"
	waitForElementPresent("name", "Automation Two")
	@driver.find_element(:name,"Automation Two").click
end

Given(/^I am in chat window with "(.*?)" user$/) do |arg1|
  step "I set First device"
  step "I am in chat window with \"pl.ios.automation2\""
end

When(/^I press the back button$/) do
 	
 	#waitForElementPresent("name", "Chats")
 	#@driver.find_element(:name,"Chats").click
 	#waitForElementPresent("xpath", "//UIAApplication[1]//UIANavigationBar[1]/UIAButton[2]")
	#@driver.find_element(:xpath,"//UIAApplication[1]//UIANavigationBar[1]/UIAButton[2]").click
	waitForElementPresent("xpath", "//*[contains(@label,'Chats')]")
	@driver.find_element(:xpath,"//*[contains(@label,'Chats')]").click
end

Then(/^I should see the My Contacts list$/) do
  	#waitForElementPresent("xpath", "//UIAApplication[1]//UIATabBar[1]/UIAButton[3]")
  	#@driver.find_element(:xpath,"//UIAApplication[1]//UIATabBar[1]/UIAButton[3]").click
  	step "I click on contact icon"
  	waitForElementPresent("name", "Contacts")
  	assertElementPresent(@driver.find_element(:name,"Contacts"))
end

When(/^I tap "(.*?)" menu button$/) do |arg1|
  	waitForElementPresent("name", "chatPlus")
	@driver.find_element(:name,"chatPlus").click
end

Then(/^I should see the Call button$/) do
  waitForElementPresent("name", "Audio Call")
  assertElementPresent(@driver.find_element(:name,"Audio Call"))
end

Then(/^I should see the Video button$/) do
  waitForElementPresent("name", "Video Call")
  assertElementPresent(@driver.find_element(:name,"Video Call"))
end

Then(/^I should see the Camera button$/) do
  waitForElementPresent("name", "Take Photo")
  assertElementPresent(@driver.find_element(:name,"Take Photo"))
end

Then(/^I should see the Gallery button$/) do
  waitForElementPresent("name", "Gallery")
  assertElementPresent(@driver.find_element(:name,"Gallery"))
end

Then(/^I should see the Send Location button$/) do
  waitForElementPresent("name", "Share Location")
  assertElementPresent(@driver.find_element(:name,"Share Location"))
end

Then(/^I press the "(.*?)" button at Chat screen$/) do |arg1|
  	waitForElementPresent("name", "chatPlus")
	@driver.find_element(:name,"chatPlus").click
end

Then(/^I should not see the Call button$/) do
  waitForElementPresent("name", "Chats")
  isElementNotPresent("name", "Audio Call")
end

Given(/^I press the Emoticon icon$/) do
  	waitForElementPresent("name", "chatEmoticones")
	@driver.find_element(:name,"chatEmoticones").click
end

Then(/^I should see the emoticons, emoji picker$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[1]/UIAImage[1]")
  assertElementPresent(@driver.find_element(:xpath,"//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[1]/UIAImage[1]"))
end

When(/^I select an emoticon$/) do
	waitForElementPresent("name", "sticker_5_0_picker")
  	@driver.find_element(:name,"sticker_5_0_picker").click
end

When(/^I tap "(.*?)" button$/) do |arg1|
 	waitForElementPresent("name", "Send")
	@driver.find_element(:name,"Send").click
end

When(/^I write a "(.*?)" message$/) do |arg1|
	@message = arg1
	puts @message
	waitForElementPresent("xpath", "//UIAApplication[1]//UIATextView[1]")
	@driver.find_element(:xpath, "//UIAApplication[1]//UIATextView[1]").send_keys @message
end

When(/^Peer click on contact icon$/) do
	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[3]")
  	@driverSecond.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATabBar[1]/UIAButton[3]").click
end

Then(/^friend should see the sent message$/) do
  	text = @driverSecond.find_element(:name,"pl.ios.automation2@woow.com").text
	assert_send([text, :include?, @message])
end

Then(/^the message should be sent to Automation Two$/) do
  	step "I press the back button"
  	waitForElementPresent("name", "pl.ios.automation2@woow.com")
  	text = @driver.find_element(:name,"pl.ios.automation2@woow.com").text
	assert_send([text, :include?, @message])  	
end

When(/^I go to "(.*?)" screen$/) do |arg1|
	close_pop_up
    step "I click on contact icon"
end

When(/^I tap on "(.*?)" group$/) do |arg1|
  	waitForElementPresent("name", "group 1")
	@driver.find_element(:name,"group 1").click
end

Given(/^I am in group chat$/) do
	step "I set First device"
  	close_pop_up
    step "I click on contact icon"
	step "I tap on \"group 1\" group"
end

Then(/^the message should be sent to group (\d+)$/) do |arg1|
	step "I press the back button"
  	#waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[2]")
  	#text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[2]").text		
	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").text
	assert_send([text, :include?, @message])  	
end

Then(/^the message should be sent to group (\d+) from other user$/) do |arg1|
	step "I press the back button"
  	waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[2]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[2]").text
	assert_send([text, :include?, @message2])  	
end

When(/^I am in the group 1 chat window$/) do
	close_pop_up
	step "I click on contact icon"
	waitForElementPresent("name", "group 1")
	@driver.find_element(:name,"group 1").click
end

When(/^"pl.ios.automation2" writes "(.*?)"$/) do |arg1|
  	#step "I am logged in with \"pl.ios.automation2\" account on second device"
  	step "I am on second device"
  	step "I am in the group 1 chat window"
  	@message2 = arg1
	puts @message2
	waitForElementPresent("xpath", "//UIAApplication[1]//UIATextView[1]")
	@driverSecond.find_element(:xpath, "//UIAApplication[1]//UIATextView[1]").send_keys @message2
	step "I tap \"Send\" button"
end

When(/^"pl.ios.automation2" user writes "(.*?)"$/) do |arg1|
  	step "I am logged in with \"pl.ios.automation2\" account on second device"
  	#step "I am on second device"
  	step "I am in the group 1 chat window"
  	@message2 = arg1
	puts @message2
	waitForElementPresent("xpath", "//UIAApplication[1]//UIATextView[1]")
	@driverSecond.find_element(:xpath, "//UIAApplication[1]//UIATextView[1]").send_keys @message2
	step "I tap \"Send\" button"
end

Then(/^I should see that emoticon in the chat screen$/) do
  	step "I press the back button"
  	waitForElementPresent("name", "pl.ios.automation2@woow.com")
  	text = @driver.find_element(:name,"pl.ios.automation2@woow.com").text
	assert_send([text, :include?, "Sticker sent"]) 
end

When(/^I press the Contact option$/) do
  	waitForElementPresent("name", "Contact")
	@driver.find_element(:name,"Contact").click
end

When(/^I press the View Profile$/) do
	waitForElementPresent("name", "Profile")
	@driver.find_element(:name,"Profile").click
end

Then(/^I should see that contacts profile screen$/) do
  	waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[3]/UIATextField[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[3]/UIATextField[1]").text
	puts text
	assert_send([text, :include?, "pl.ios.automation2"]) 
end

Then(/^I should see the Chat screen$/) do
  waitForElementPresent("name", "Contact")
  assertElementPresent(@driver.find_element(:name, "Contact"))
end

Given(/^Peer in chat window with "pl\.ios\.automation(\d+)”$/) do |arg1|
	close_pop_up
	sleep(2)
	step "I click on contact icon"
	waitForElementPresent("name", "Automation One")
	@driver.find_element(:name,"Automation One").click
end

Given(/^Peer in chat window with first user$/) do
  step "I am on second device"
  step "Peer in chat window with \"pl\.ios\.automation(\d+)”"
end

When(/^Peer press the Emoticon icon$/) do
  	waitForElementPresent("name", "chatEmoticones")
	@driver.find_element(:name,"chatEmoticones").click
end

When(/^Peer select an emoticon$/) do
  	waitForElementPresent("name", "sticker_5_0_picker")
  	@driver.find_element(:name,"sticker_5_0_picker").click
end

When(/^Peer tap "(.*?)" button$/) do |arg1|
  	waitForElementPresent("name", "Send")
	@driver.find_element(:name,"Send").click
end

Then(/^Peer should see that emoticon in the chat screen$/) do
  	step "I press the back button"
  	waitForElementPresent("name", "pl.ios.automation1@woow.com")
  	text = @driver.find_element(:name,"pl.ios.automation1@woow.com").text
	assert_send([text, :include?, "Sticker sent"]) 
end

Then(/^Peer should see sent message in the chat screen$/) do
	step "I set Second device"
	step "I press the back button"
  	waitForElementPresent("name", "pl.ios.automation1@woow.com")
  	text = @driver.find_element(:name,"pl.ios.automation1@woow.com").text
	assert_send([text, :include?, @message])
end

Then(/^friend should see sent message in the chat screen$/) do
	step "I set Second device"
	close_pop_up
	#step "I press the back button"
  	waitForElementPresent("name", "pl.ios.automation1@woow.com")
  	text = @driver.find_element(:name,"pl.ios.automation1@woow.com").text
	assert_send([text, :include?, @message])  	
end

Given(/^I am in chat window with "(.*?)" when friend is online$/) do |arg1|
	step "I set First device"
	close_pop_up
	step "I click on contact icon"
	waitForElementPresent("name", "Automation Two")
	@driver.find_element(:name,"Automation Two").click
end

When(/^I tap on the Gallery button$/) do
	sleep(2)
	waitForElementPresent("name", "Gallery")
	@driver.find_element(:name,"Gallery").click
  	#waitForElementPresent("xpath", "//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[6]/UIAStaticText[1]")
  	#@driver.find_element(:xpath,"//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[6]/UIAStaticText[1]").click
end

When(/^I tap on the Photos button$/) do
  waitForElementPresent("name", "Send Photo")
  @driver.find_element(:name,"Send Photo").click
end

When(/^I Select file from gallery$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]")
  @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").click
  #sleep(2)
  #Appium.promote_appium_methods Object	
  #Appium::TouchAction.new :x => 36, :y => 91, :fingers => 1, :tapCount => 1, :duration => 0.5
  #Appium::TouchAction.new.press(x: 207, y: 566).wait(1)
  waitForElementPresent("xpath", "//UIACollectionCell[1]")
  @driver.find_element(:xpath,"//UIACollectionCell[1]").click
  end

When(/^I send file from gallery$/) do
  waitForElementPresent("name", "Send")
  @driver.find_element(:name,"Send").click
end

Then(/^the file should be displayed in the chat screen$/) do
  sleep(3)
  step "I press the back button"
  step "I see the file in the chat screen"
end

Then(/^Peer should see the file in the chat screen$/) do
  sleep(2)
  step "I press the back button"
  step "I see the file in the chat screen"
end

When(/^I see the file in the chat screen$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  text = @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").text
  assert_send([text, :include?, "File Transfer"]) 
end

Then(/^friend should see sent photo in the chat screen/) do
	step "I set Second device"
	close_pop_up
	#step "I press the back button"
  	step "I see the file in the chat screen"
end

Then(/^User should see sent photo in the chat screen/) do
	step "I set First device"
	close_pop_up
	#waitForElementPresent("name", "pl.automation5@woow.com")
  	#text = @driver.find_element(:name,"pl.automation5@woow.com").text
	#assert_send([text, :include?, "File Transfer"])  	
	step "I see the file in the chat screen"
end

When(/^I tap on the video button$/) do
  waitForElementPresent("name", "Send Video")
  @driver.find_element(:name,"Send Video").click
end

When(/^I Select video file from gallery$/) do
  sleep(2)
  waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIACollectionView[1]/UIACollectionCell[1]")
  @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIACollectionView[1]/UIACollectionCell[1]").click
end

When(/^I send video file from gallery$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIAButton[3]")
  @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIAButton[3]").click
  waitForElementNotPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIAStaticText[1]")
  sleep(10)
end

When(/^I tap on the Share Contact button$/) do
  #waitForElementPresent("xpath", "//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[8]/UIAStaticText[1]")
  #@driver.find_element(:xpath,"//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[8]/UIAStaticText[1]").click
  waitForElementPresent("name", "Share Contact")
  @driver.find_element(:name,"Share Contact").click
end

When(/^I select on the Contact$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]")
  @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]").click
end

Then(/^the shared contact should be displayed in the chat screen$/) do
  	step "I press the back button"
  	step "I see the share contact in the chat screen"
end

When(/^I see the share contact in the chat screen$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]")
  text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]").text
  assert_send([text, :include?, "Shared contact"]) 
end

Then(/^friend should see share Contact in the chat screen/) do
	step "I set Second device"
	close_pop_up
	#step "I press the back button"
  	step "I see the share contact in the chat screen"
end

Then(/^Peer should see share Contact in the chat screen$/) do
  sleep(2)
  step "I press the back button"
  step "I see the share contact in the chat screen"
end

When(/^I tap on the Share location button$/) do
  #waitForElementPresent("xpath", "//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[7]/UIAStaticText[1]")
  #@driver.find_element(:xpath,"//UIAApplication[1]//UIACollectionView[1]/UIACollectionCell[7]/UIAStaticText[1]").click
  waitForElementPresent("name", "Share Location")
  @driver.find_element(:name,"Share Location").click	
end

When(/^I send the location$/) do
  begin
  		sleep(2)
    	#waitForElementPresent("xpath", "//UIAApplication[1]//UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]")
  		@driver.find_element(:xpath,"//UIAApplication[1]//UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]").click
    rescue
    end
  waitForElementPresent("name", "buttonSendLocation")
  @driver.find_element(:name,"buttonSendLocation").click
end

Then(/^the shared location should be displayed in the chat screen$/) do
  	step "I press the back button"
  	sleep(1)
  	step "I see the share location in the chat screen"
end

When(/^I see the share location in the chat screen$/) do
  waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIATableCell[1]")
  text = @driver.find_element(:xpath,"//UIAApplication[1]//UIATableView[1]/UIATableCell[1]").text
  assert_send([text, :include?, "Shared location"]) 
end

Then(/^friend should see share location in the chat screen/) do
	step "I set Second device"
	close_pop_up
	#step "I press the back button"
  	step "I see the share location in the chat screen"
end

Then(/^Peer should see share location in the chat screen$/) do
  sleep(2)
  step "I press the back button"
  step "I see the share location in the chat screen"
end

When(/^I press more button on profile$/) do
	waitForElementPresent("xpath", "//UIAApplication[1]//UIATableView[1]/UIAButton[4]")
  @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIAButton[4]").click
end

When(/^I tap on the Gallery button from user profile$/) do
	step "I tap on the Gallery button"
	#waitForElementPresent("xpath", "//UIAApplication[1]//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[3]/UIAButton[1]")
  	#@driver.find_element(:xpath,"//UIAApplication[1]//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[3]/UIAButton[1]").click
end

When(/^I tap on the Share Contact button from user profile$/) do
	#waitForElementPresent("xpath", "//UIAApplication[1]//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[5]")
  	#@driver.find_element(:xpath,"//UIAApplication[1]//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[5]").click
	step "I tap on the Share Contact button"
end

When(/^I tap on the Share location button from user profile$/) do
	#waitForElementPresent("xpath", "//UIAApplication[1]//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[4]")
  	#@driver.find_element(:xpath,"//UIAApplication[1]//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[4]").click
	step "I tap on the Share location button"
end

Then(/^I should see that emoticon in the group chat screen$/) do
  	step "I press the back button"
  	waitForElementPresent("xpath", "//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]")
  	text = @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]").text
	assert_send([text, :include?, "Sticker sent"]) 
end

Given(/^I am in chat with other user$/) do
	step "I set First device"
	step "I am in chat window with \"pl.ios.automation2\""
end