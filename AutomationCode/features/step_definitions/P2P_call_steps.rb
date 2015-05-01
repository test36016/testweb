When /^I perform a p(\d+)p call to "(.*?)"$/ do |arg1, arg2|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I tap on \"Audio Call\" button"
	step "I tap on \"Free Call\" button"
end

When /^I receive a p(\d+)p call from "(.*?)"$/ do |arg1, arg2|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I tap on \"Audio Call\" button"
	step "I tap on \"Free Call\" button"
	step "I Select Second device"
end

Then /^I should see the call screen$/ do
	sleep(9)
	waitForElementPresent("* id:'call_top_layout'")
	check_element_exists("* id:'call_top_layout'")
end

Then /^I should see the ringing animation$/ do
	sleep(5)
	waitForElementPresent("* id:'conference_call_ringing_imageview'")
	check_element_exists("* id:'conference_call_ringing_imageview'")
end

Then /^I should see the back button arrow$/ do
	sleep(5)
	waitForElementPresent("* id:'call_back_button'")
	check_element_exists("* id:'call_back_button'")
end

Then /^I should see the Name of the contact I am calling$/ do
	sleep(5)
	waitForElementPresent("* id:'conference_call_title_textview' text:'test5 automation'")
	check_element_exists("* id:'conference_call_title_textview' text:'test5 automation'")
end

Then /^I should see the connecting status$/ do
	sleep(4)
	waitForElementPresent("* id:'call_status_textview'")
	check_element_exists("* id:'call_status_textview'")
end

Then /^I Should see the contacts avatar$/ do
	sleep(8)
	waitForElementPresent("* id:'conference_call_participant_avatar_layout'")
	check_element_exists("* id:'conference_call_participant_avatar_layout'")
end

Then /^I should see the video button$/ do
	sleep(4)
	waitForElementPresent("* id:'call_camera_button'")
	check_element_exists("* id:'call_camera_button'")
end

Then /^I should see the speaker button$/ do
	sleep(4)
	waitForElementPresent("* id:'call_speaker_togglebutton'")
	check_element_exists("* id:'call_speaker_togglebutton'")
end

Then /^I should see the dialpad button$/ do
	sleep(4)
	waitForElementPresent("* id:'call_dialpad_button'")
	check_element_exists("* id:'call_dialpad_button'")
end

Then /^I should see the end call button$/ do
	sleep(6)
	waitForElementPresent("* id:'call_end_call_button'")
	check_element_exists("* id:'call_end_call_button'")
end

Then /^I should see the incoming call status$/ do
	sleep(4)
	waitForElementPresent("* id:'call_status_textview'")
	check_element_exists("* id:'call_status_textview' text:'Incoming call'")
end

Then /^I should see the answer with video button$/ do
	sleep(3)
	waitForElementPresent("* id:'call_respond_with_video_button'")
	check_element_exists("* id:'call_respond_with_video_button'")
end

Then /^I should see the answer with audio button$/ do
	sleep(3)
	waitForElementPresent("* id:'call_respond_button'")
	check_element_exists("* id:'call_respond_button'")
end

Then /^I should see the reject call button$/ do
	sleep(3)
	waitForElementPresent("* id:'call_reject_button'")
	check_element_exists("* id:'call_reject_button'")
end

Then /^I should see the Name of the contact which is calling me$/ do
	sleep(3)
	waitForElementPresent("* id:'conference_call_title_textview' text:'test1 automation'")
	check_element_exists("* id:'conference_call_title_textview' text:'test1 automation'")
end

When /^I tap on video call$/ do
	sleep(3)
	waitForElementPresent("* text:'Video Call'")
	touch(query("* text:'Video Call'"))
	step"I mute the call"
end

When /^I perform a p(\d+)p video call to "(.*?)"$/ do |arg1, arg2|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I tap on video call"
end

Then /^I should see my local feed to the right$/ do
	sleep(5)
	waitForElementPresent("* id:'local_render_layout'")
	check_element_exists("* id:'local_render_layout'")
end

Then /^above the local feed should be the flip camera button$/ do
	sleep(5)
	waitForElementPresent("* id:'call_rotate_camera'")
	check_element_exists("* id:'call_rotate_camera'")
end

Then /^I should see the video button with the blue active bar enabled$/ do
	sleep(5)
	waitForElementPresent("* id:'call_buttons_layout' enabled:'true'")
	check_element_exists("* id:'call_buttons_layout' enabled:'true'")
end

When /^I perform a p(\d+)p call to "(.*?)" in Landscape mode$/ do |arg1, arg2|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I rotate the device to landscape"
	step "I tap on \"Audio Call\" button"
	step "I tap on \"Free Call\" button"
end

When /^I receive a p(\d+)p call from "(.*?)" in Landscape mode$/ do |arg1, arg2|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I rotate the device to landscape"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I tap on \"Audio Call\" button"
	step "I tap on \"Free Call\" button"
	step "I Select Second device"
end

When /^I perform a p(\d+)p video call to "(.*?)" in Landscape mode$/ do |arg1, arg2|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I rotate the device to landscape"
	step "I tap on video call"
end

When /I am in a call with "(.*?)"$/ do |arg1|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I tap on \"Audio Call\" button"
	step "I tap on \"Free Call\" button"
	step "\"pl.automation5\" answers my call with \"Audio\""
	step "I Select First device"
end

When /^I tap a button from the bottom bar$/ do
	waitForElementPresent("* id:'call_camera_button'")
	touch(query("* id:'call_camera_button'"))
end

Then /^it should activate$/ do
	sleep(3)
	waitForElementPresent("* id:'call_rotate_camera'")
	check_element_exists("* id:'call_rotate_camera'")
end

When /^I have button in their active state and I tap them again$/ do
	sleep(3)
	waitForElementPresent("* id:'call_camera_button'")
	touch(query("* id:'call_camera_button'"))
end

Then /^they should deactivate$/ do
	sleep(3)
	waitForElementPresent("* id:'call_camera_button'")
	check_element_does_not_exist("* id:'call_rotate_camera'")
end

When /^I tap the back button that is next to the contact name$/ do
	sleep(3)
	waitForElementPresent("* id:'call_back_button'")
	touch(query("* id:'call_back_button'"))
end

Then /^I should be taken to the chat screen with the contact$/ do
	sleep(3)
	waitForElementPresent("* id:'topbar_chat_title'")
	check_element_exists("* id:'topbar_chat_title'")
end

Then /^the call should continue without any issues$/ do
	sleep(3)
	waitForElementPresent("* id:'active_call_bar'")
	check_element_exists("* id:'active_call_bar'")
end

When /^I am in a video call with "(.*?)" in Portrait to Portrait$/ do |arg1|
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I rotate the device to Portrait"
	step "I Select First device"
	step "I rotate the device to Portrait"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
	step "I tap \"+\" menu button"
	step "I tap on video call"
	step "I Select Second device"
	step "User accepts a video call"
end

When /^User accepts a video call$/ do
	sleep(10)
	waitForElementPresent("* id:'call_respond_with_video_button'")
	touch(query("* id:'call_respond_with_video_button'"))
	step"I mute the call"
end

When /^I rotate the device to Portrait$/ do
	perform_action('set_activity_orientation', 'portrait')
end

Given /^I am in the roster$/ do
	step "I am logged in with \"pl.automation5\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
end

When /^I select a contact from the Wow roster$/ do
	step "I tap on \"pl.automation5\" friend"
end

When /^I press the Plus button$/ do
	step "I tap \"+\" menu button"
end

When /^I press the Call button$/ do
	step "I tap on \"Audio Call\" button"
	step "I tap on \"Free Call\" button"
end

Then /^I want to get connected with the contact$/ do
	step "I should see the call screen"
end

When /^I lock the device$/ do
		sleep(2)
		cmd1 = "adb -s "+$firstDevice+" shell input keyevent 6"	
		system(cmd1)
		step "I Select First device"
end

When /^I lock the second device$/ do
		sleep(2)
		cmd1 = "adb -s "+$secondDevice+" shell input keyevent 6"	
		system(cmd1)
end

When /^I Unlock the device$/ do
		wake_up
end

Then /^the call should run normally$/ do
	step "I Unlock the device"
	sleep(3)
	step "I should see the call screen"
end

When /^the peer locks the device$/ do
	step "I lock the second device"
	step "I Select Second device"
end

When /^the peer answer$/ do
	step "\"pl.automation5\" answers my call with \"Audio\""
end

When /^the peer answers$/ do
	step "\"pl.automation5\" answers my call with \"Audio\""
end

When /^I end the call$/ do
	step "I Select First device"
	waitForElementPresent("* id:'call_end_call_button'")
	touch(query("* id:'call_end_call_button'"))	
end

Then /^the call should stop$/ do
	sleep(1)
	waitForElementPresent("* id:'topbar_chat_title'")
	check_element_does_not_exist("* id:'call_top_layout'")
end

When /^I end the call before the contact answers$/ do
	step "I end the call"
end

Then /^the call should stop on both devices/ do
	step "I Select First device"
	sleep(15)
	waitForElementPresent("* id:'topbar_chat_title'")
	check_element_does_not_exist("* id:'call_top_layout'")
	step "I Select Second device"
	sleep(2)
	check_element_does_not_exist("* id:'call_top_layout'")
end

When /^the contact rejects the call$/ do
	step "I Select Second device"
	waitForElementPresent("* id:'call_reject_button'")
	touch(query("* id:'call_reject_button'"))
end

When /^the peer ends the call$/ do
	step "I Select Second device"
	sleep(2)
	waitForElementPresent("* id:'call_end_call_button'")
	touch(query("* id:'call_end_call_button'"))	
end

When /^I tap on View profile$/ do
	step "I select a contact from the Wow roster"
	step "I press the more options"
	step "I press the View Profile"
end

When /^I press the Call button on contact profile$/ do
	step "I tap on Audio Call button on contacts profile"
	step "I tap on \"Free Call\" button"
end

Given /^the contact becomes offline and not reachable \(switches off the device\)$/ do
	step "I Select Second device"
	sleep(5)
	step"I am signed out"
end

Then /^the call should stop when contact becomes offline$/ do
	check_element_does_not_exist("* id:'call_top_layout'")
end

Given /^I start my video stream$/ do
	step "I Select First device"
	waitForElementPresent("* id:'call_camera_button'")
	touch(query("* id:'call_camera_button'"))
	step"I mute the call"
end

Then /^I should see my video stream active on the screen$/ do
	step "I Select First device"
	step "it should activate"
end

Given /^peer starts his video stream$/ do
	step "I Select Second device"
	sleep(5)
	waitForElementPresent("* id:'call_camera_button'")
	touch(query("* id:'call_camera_button'"))
	#step"I mute the call"
end

Then(/^I should see peer's video stream active on the screen$/) do
	step "I Select First device"
	sleep(3)
	waitForElementPresent("org.webrtc.videoengine.ViEAndroidGLES20")
	check_element_exists("org.webrtc.videoengine.ViEAndroidGLES20")
end

When /^I press the Video button$/ do
	step "I tap on video call"
end

Then /^I want to get connected with the other contact$/ do
	step"I should see the call screen"
end

Then /^I want to see my video stream$/ do
	step"above the local feed should be the flip camera button"
end

When /^that contact is offline and not reachable$/ do
	step "I Select Second device"
	sleep(2)
	step"I am signed out"
	sleep(2)
	step "I Select First device"
end

When /^the peer answers with video$/ do
	step "I Select Second device"
	step"User accepts a video call"
end

When /^the peer answers without video$/ do
	sleep(2)
	step "\"pl.automation5\" answers my call with \"Audio\""
end

When /^I close the video stream$/ do
	step "I Select First device"
	step "I tap a button from the bottom bar"
end

When /^I mute the call$/ do
	waitForElementPresent("* id:'call_microphone_togglebutton'")
	touch(query("* id:'call_microphone_togglebutton'"))
end