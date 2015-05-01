When(/^I tap on Audio call$/) do
  waitForElementPresent("name", "Audio Call")
  @driver.find_element(:name,"Audio Call").click
end

When(/^I tap on Free call button$/) do
  waitForElementPresent("name", "Free Call")
  @driver.find_element(:name,"Free Call").click
end

Then(/^I should see the call screen$/) do
	sleep(2)
  	waitForElementPresent("name", "hangup")
  	assertElementPresent(@driver.find_element(:name,"hangup"))
end

When(/^I perform a p2p call to second user$/) do
    #step "I am logged in with \"pl.ios.automation2\" account on second device"
    secondDeviceLaunch
    step "I set First device"
	step "I am in chat window with \"pl.ios.automation2\""
	step "I tap \"+\" menu button"
	step "I tap on Audio call"
	step "I tap on Ok button"
	step "I tap on Free call button"
end

When(/^I receive a p(\d+)p call from first user$/) do |arg1|
  	#step "I am logged in with \"pl.ios.automation2\" account on second device"
	step "I perform a p2p call to second user"
	step "I select Second device"
end

Then(/^I should see the Name of the contact I am calling$/) do
  	sleep(1)
  	waitForElementPresent("name", "Automation Two")
  	assertElementPresent(@driver.find_element(:name,"Automation Two"))
end

Then(/^I should see the video button$/) do
  	sleep(1)
  	waitForElementPresent("name", "videoAnnotation")
  	assertElementPresent(@driver.find_element(:name,"videoAnnotation"))
end

Then(/^I should see the speaker button$/) do
  	sleep(1)
  	waitForElementPresent("name", "speakerAnnotation")
  	assertElementPresent(@driver.find_element(:name,"speakerAnnotation"))
end

Then(/^I should see the mute button$/) do
  	sleep(1)
  	waitForElementPresent("name", "microphoneAnnotation")
  	assertElementPresent(@driver.find_element(:name,"microphoneAnnotation"))
end

Then(/^I should see the end call button$/) do
  	sleep(1)
  	waitForElementPresent("name", "hangup")
  	assertElementPresent(@driver.find_element(:name,"hangup"))
end

Then(/^I should see the incoming call screen$/) do
  	sleep(1)
  	waitForElementPresent("name", "subtitle")
  	assertElementPresent(@driver.find_element(:name,"subtitle"))
end

Then(/^I should see the answer with video button$/) do
  	sleep(1)
  	waitForElementPresent("name", "videoAnswer")
  	assertElementPresent(@driver.find_element(:name,"videoAnswer"))
end

Then(/^I should see the answer with audio button$/) do
 	 sleep(1)
  	waitForElementPresent("name", "audioAnswer")
  	assertElementPresent(@driver.find_element(:name,"audioAnswer"))
end

Then(/^I should see the reject call button$/) do
  	sleep(1)
  	waitForElementPresent("name", "endCall")
  	assertElementPresent(@driver.find_element(:name,"endCall"))
end

When(/^I tap on Video call$/) do
  waitForElementPresent("name", "Video Call")
  @driver.find_element(:name,"Video Call").click
end

When(/^I perform a p(\d+)p video call to second user$/) do |arg1|
	#step "I am logged in with \"pl.ios.automation2\" account on second device"
    secondDeviceLaunch
    step "I set First device"
	step "I am in chat window with \"pl.ios.automation2\""
	step "I tap \"+\" menu button"
	step "I tap on Video call"
	step "I tap on Ok button"
end

When(/^I answer the call$/) do
  waitForElementPresent("name", "audioAnswer")
  @driver.find_element(:name,"audioAnswer").click
end

Then(/^call should be established$/) do
  	sleep(2)
  	waitForElementPresent("name", "hangup")
  	assertElementPresent(@driver.find_element(:name,"hangup"))
end

When(/^I end the call$/) do
	#step "I set First device"
  	waitForElementPresent("name", "hangup")
  	@driver.find_element(:name,"hangup").click
end

Then(/^call should not be established$/) do
  	sleep(2)
  	waitForElementPresent("xpath", "//*[contains(@label,'Chats')]")
 	isElementNotPresent("name", "hangup")
end

Then(/^User should see more options$/) do
  	sleep(1)
  	 waitForElementPresent("name", "menuAnnotation")
  	assertElementPresent(@driver.find_element(:name,"menuAnnotation"))
end

Given(/^I am in the roster$/) do
  	#step "I am logged in with \"pl.ios.automation2\" account on second device"
    secondDeviceLaunch
    step "I set First device"
end

When(/^I select a contact from the Wow roster$/) do
 	step "I am in chat window with \"pl.ios.automation2\""
end

When(/^I press the Plus button$/) do
  	step "I tap \"+\" menu button"
end

When(/^I press the Call button$/) do
  	step "I tap on Audio call"
	step "I tap on Ok button"
	step "I tap on Free call button"
end

Then(/^I want to get connected with the contact$/) do
  step "I should see the call screen"
end

When(/^the peer answers$/) do
	step "I select Second device"
  	step "I answer the call"
end

Then(/^the call should stop$/) do
	sleep(2)
  	waitForElementPresent("xpath", "//UIAStaticText[contains(@label,'Incoming Call')]")
 	isElementNotPresent("name", "endCall")
end

When(/^I end the call before the contact answers$/) do
  step "I end the call"
end

Then(/^the call should stop on both devices$/) do
  step "I set First device"
  step "call should not be established"
  step "I select Second device"
  sleep(2)
  isElementNotPresent("name", "hangup")
end

When(/^the contact rejects the call$/) do
  step "I select Second device"
  waitForElementPresent("name", "endCall")
  @driver.find_element(:name,"endCall").click
end

When(/^the peer ends the call$/) do
  step "I select Second device"
  step "I end the call"
end

Given(/^I tap on View profile$/) do
	step "I select a contact from the Wow roster"
	step "I press the Contact option"
  	step "I press the View Profile"
end

Given(/^I press the Call button on contact profile$/) do
 	waitForElementPresent("name", "audioCallButton")
  	@driver.find_element(:name,"audioCallButton").click
  	step "I tap on Ok button"
  	step "I tap on Free call button"
end

Given(/^I start my video stream$/) do
  	waitForElementPresent("name", "videoToggle")
  	@driver.find_element(:name,"videoToggle").click
end

Then(/^I should see my video stream active on the screen$/) do
  	waitForElementPresent("name", "localVideoView")
  	assertElementPresent(@driver.find_element(:name,"localVideoView"))
end

Given(/^peer starts his video stream$/) do
  step "I select Second device"
  step "I start my video stream"
end

Then(/^I should see peer's video stream active on the screen$/) do
  step "I should see my video stream active on the screen"
end

When(/^I press the Video button$/) do
  waitForElementPresent("name", "Video Call")
  @driver.find_element(:name,"Video Call").click
end

Then(/^I want to get connected with the other contact$/) do
  step"call should be established"
end

When(/^the peer answers with video$/) do
  step "I select Second device"
  sleep(1)
  waitForElementPresent("name", "videoAnswer")
  @driver.find_element(:name,"videoAnswer").click
end

When(/^the peer answers without video$/) do
  step "the peer answers"
end