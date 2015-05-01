require 'calabash-android/calabash_steps'
require 'test/unit/assertions'
World(::Test::Unit::Assertions)

Then /^I should be in "Chats" Screen$/ do 
	wait_for(:timeout => 60) { element_exists("* id:'new_chat_Button'") }	
	begin
		check_element_exists("* id:'new_chat_Button'") 
		wait_for(:timeout => 60) { element_exists("* id:'activity_list'") }	
		check_element_exists("* id:'activity_list'") 
	rescue
		check_element_exists("* id:'no_activity_textview'") 
	end
end

When /^I go to "Contacts" screen$/ do
	sleep (10)
	#wait_for(:timeout => 30) { element_exists("* id:'icon'") }	
	waitForElementPresent("* id:'icon'")	
	touch(query("* id:'icon'")[2])
end

When /^I go to Profile screen$/ do
	sleep (10)
	#wait_for(:timeout => 30) { element_exists("* id:'icon'") }	
	waitForElementPresent("* id:'icon'")
	touch(query("* id:'icon'")[0])
end

When /^I write a message$/ do
	#wait_for(:timeout => 20) { element_exists("* id:'temp_editText1'") }
	sleep (4)
	waitForElementPresent("* id:'temp_editText1'")
	@timeStamp = Time.now.strftime("%H:%M")
	@chatMSG= "Test"+@timeStamp	
	puts @chatMSG
	query("* id:'temp_editText1'",{:setText => @chatMSG})
end

When /^I tap "Send" button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'temp_sendButton'") }
	sleep(2)
	waitForElementPresent("* id:'temp_sendButton'")
	touch(query("* id:'temp_sendButton'"))
end

Then /^the message should be displayed in the chat screen$/ do
	wait_for_text(@chatMSG, timeout: 10)	
end

When /^I am in the "group 1" chat window$/ do
	step "I go to \"Contacts\" screen"
	step "I tap on \"group 1\" group"	
end

When /^I write "([^\"]*)" message$/ do |arg1|
	@userOneMsg=arg1
	#wait_for(:timeout => 20) { element_exists("* id:'temp_editText1'") }	
	waitForElementPresent("* id:'temp_editText1'")
	query("* id:'temp_editText1'",{:setText => arg1})
	step "I tap \"Send\" button"
	
end

When /^"pl.automation5" writes "([^\"]*)"$/ do |arg1|
	@userTwoMsg=arg1
	@userMsg=@userOneMsg
	step "I set Second device"
	step "I am logged in with \"pl.automation5\" account"
	step "I go to \"Contacts\" screen"
	step "I tap on group"
	
	#wait_for(:timeout => 20) { element_exists("* id:'temp_editText1'") }	
	sleep(2)
	waitForElementPresent("* id:'temp_editText1'")
	query("* id:'temp_editText1'",{:setText => arg1})
	step "I tap \"Send\" button"	
end

When /^"pl.automation4" writes "([^\"]*)"$/ do |arg1|
	@userThirdMsg=arg1
	step "I set Third device"
	step "I am logged in with \"pl.automation4\" account"
	step "I go to \"Contacts\" screen"
	step "I tap on group"
	
	#wait_for(:timeout => 20) { element_exists("* id:'temp_editText1'") }	
	waitForElementPresent("* id:'temp_editText1'")
	query("* id:'temp_editText1'",{:setText => arg1})
	step "I tap \"Send\" button"	
end

Then /^all messages should be displayed in the chat screen$/ do
	step "I Select First device"
	wait_for_text(@userOneMsg, timeout: 10)
	wait_for_text(@userTwoMsg, timeout: 10)
	wait_for_text(@userMsg, timeout: 10)
	wait_for_text(@userThirdMsg, timeout: 10)	
end

When(/^I tap "(.*?)" menu button$/) do |arg1|
	#wait_for(:timeout => 30) { element_exists("* id:'temp_menuButton'") }
	sleep(8)
	waitForElementPresent("* id:'temp_menuButton'")
	sleep(1)
	touch(query("* id:'temp_menuButton'"))
end

When /^I tap on "Audio Call" button$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'") }
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'")
	touch(query("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'"))
end

When /^I tap on "Free Call" button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'dialog_button_choice_choice' text:'Free call'") }
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Free call'")
	touch(query("* id:'dialog_button_choice_choice' text:'Free call'"))
	step "I mute the call"
end

When /^I tap on "Hangup" button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'call_end_call_button'") }
	waitForElementPresent("* id:'call_end_call_button'")
	sleep (3)
	touch(query("* id:'call_end_call_button'"))	
end

Then /^the call should not be established$/ do
	#wait_for(:timeout => 5) { element_exists("* id:'temp_sendButton'") }
	waitForElementPresent("* id:'temp_sendButton'")
	check_element_does_not_exist("* id:'call_end_call_button'")
end

Then /^the "Outgoing call" message should be displayed in the chat screen$/ do	
	sleep(8)
	check_element_exists("* id:'chat_call_type_text_right' text:'Outgoing Call'") 
end

When /^"pl.automation5" answers my call with "Audio"$/ do
	step "I Select Second device"
	#wait_for(:timeout => 30) { element_exists("* id:'call_respond_button'") }
	sleep (12)
	waitForElementPresent("* id:'call_respond_button'")
	sleep (5)
	touch(query("* id:'call_respond_button'"))
	step "I mute the call"
	sleep (2)
end

Then /^the call should be established$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'call_end_call_button'") }	
	sleep(1)
	waitForElementPresent("* id:'call_end_call_button'")
	check_element_exists("* id:'call_end_call_button'") 
end

Then /^the call timer should be displayed$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'call_status_textview'") }	
	waitForElementPresent("* id:'call_status_textview'")
	check_element_exists("* id:'call_status_textview'") 
	step "I close the app on Second device"
end

When /^"pl.automation5" taps "Hangup" button$/ do
	step "I Select Second device"
	sleep (15)
	#wait_for(:timeout => 30) { element_exists("* id:'call_reject_button'") }
	waitForElementPresent("* id:'call_reject_button'")
	touch(query("* id:'call_reject_button'"))	
end

Then /^the call should Not be established$/ do
	#wait_for(:timeout => 5) { element_exists("* id:'temp_sendButton'") }
	waitForElementPresent("* id:'temp_sendButton'")
	check_element_does_not_exist("* id:'call_status_textview'")
end

Then /^I should see the check mark for successful sending$/ do
	#wait_for(:timeout => 5) { element_exists("* id:'chat_seen_bubble_layout'") }
	sleep(3)
	waitForElementPresent("* id:'chat_seen_bubble_layout'")
	check_element_exists("* id:'chat_seen_bubble_layout'")
end

Then /^I should see the check mark for successful sending and receiving for the last message$/ do
	waitForElementPresent("* id:'chat_seen_bubble_layout'")
	check_element_exists("* id:'chat_seen_bubble_layout'")
end	

Then /^I should see "Call declined" popup$/ do
	wait_for(:timeout =>10) { element_exists("* id:'message'") }
	check_element_exists("* id:'message'")
end	

When /^I press the back button$/ do
	waitForElementPresent("* id:'topbar_chat_title'")
	touch(query("* id:'topbar_chat_title'"))	
end

Then /^I should see the My Contacts list$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'roster_listview_contacts'") }
		waitForElementPresent("* id:'roster_listview_contacts'")
	check_element_exists("* id:'roster_listview_contacts'")
end

Then /^I should see the Call button$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'") }
	sleep(8)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'")
	check_element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'")
end

Then /^I should see the Video button$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Video Call'") }
	sleep(2)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Video Call'")
	check_element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Video Call'")
end

Then /^I should see the Camera button$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Take Photo'") }
	sleep(2)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Take Photo'")
	check_element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Take Photo'")
end

Then /^I should see the Gallery button$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'") }
	sleep(2)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'")
	check_element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'")
end

Then /^I should see the Send Location button$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Location'") }
	sleep(2)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Location'")
	check_element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Location'")
end

Then /^I press the "(.*?)" button at Chat screen$/ do |arg1|
	sleep(1)
	#wait_for(:timeout => 30) { element_exists("* id:'temp_menuButton'") }
		waitForElementPresent("* id:'temp_menuButton'")
	#touch(query("* id:'chat_seen_bubble_layout'"))
	touch(query("* id:'temp_menuButton'"))
end

Then /^I should not see the Call button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'temp_menuButton'") }
		waitForElementPresent("* id:'temp_menuButton'")
	check_element_does_not_exist("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Audio Call'")
end

When /^I press the Emoticon icon$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'temp_emotiButton'") }
	sleep(8)
	waitForElementPresent("* id:'temp_emotiButton'")
	sleep(2)
	touch(query("* id:'temp_emotiButton'"))
end

Then /^I should see the emoticons, emoji picker$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'emoticon_image_button'") }
		waitForElementPresent("* id:'emoticon_image_button'")
	check_element_exists("* id:'emoticon_image_button'")
end

When /^I select an emoticon$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'emoticon_image_button'") }
	waitForElementPresent("* id:'emoticon_image_button'")
	touch(query("* id:'emoticon_image_button'"))[0]
end

Then /^I should see that emoticon in the chat screen$/ do
	sleep(2)
	#wait_for(:timeout => 20) { element_exists("* id:'chat_list_item_right_message_text'")}
		waitForElementPresent("* id:'chat_list_item_right_message_text'")
	total_SentMsg=query("* id:'chat_list_item_right_message_text'").count
	emoji=query("* id:'chat_list_item_right_message_text' index:#{total_SentMsg-1}",'text')
	emoji=emoji[0]
	if(emoji.include? ":)")
		flag=true
	end
	assert(flag == true, "Failed due to emoticons not displayed")
end

When /^I press the more options$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'topbar_chat_MoreButton'") }
	sleep(8)
	waitForElementPresent("* id:'topbar_chat_MoreButton'")
	touch(query("* id:'topbar_chat_MoreButton'"))
end

When /^I press the View Profile$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowButtonRegular text:'View Profile'") }
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowButtonRegular text:'View Profile'")
	touch(query("com.woow.talk.views.customwidgets.WoowButtonRegular text:'View Profile'"))
end

Then /^I should see that contacts profile screen$/ do
	sleep (5)
	#wait_for(:timeout => 30) { element_exists("* id:'text_section_title'") }
	waitForElementPresent("* id:'text_section_title'")
	check_element_exists("* id:'text_section_title' text:'PERSONAL INFO'")
end

When /^I press the back button from contact$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'top_bar_btn_back'") }
	waitForElementPresent("* id:'top_bar_btn_back'")
	touch(query("* id:'top_bar_btn_back'"))
end

Then /^I should see the Chat screen$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'topbar_chat_MoreButton'") }
	waitForElementPresent("* id:'topbar_chat_MoreButton'")
	check_element_exists("* id:'topbar_chat_MoreButton'")
end

When /^I am signed out$/ do
	shutdown_test_server
	clear_app_data
	start_test_server_in_background
end

When /^I select the text field$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'temp_editText1'") }
	sleep(8)
	waitForElementPresent("* id:'temp_editText1'")
	touch(query("* id:'temp_editText1'"))
end

When /^I press Space button$/ do
	keyboard_enter_char " "
end

Then /^the Send button should be disabled$/ do
	a=element_exists("* id:'temp_sendButton' enabled:true")
	puts a
	flag = false
	#wait_for(:timeout => 50) { element_exists("* id:'temp_sendButton'") }
	waitForElementPresent("* id:'temp_sendButton'")
	touch(query("* id:'temp_sendButton'"))
	sleep(1)
	a=element_exists("* id:'temp_sendButton' enabled:true")
	puts a
	if(a==false)
		flag=true
	end
	assert(flag == true, "Failed due send button enabled")
end

Then /^I should not see a new message appear in the chat screen\.$/ do
	#wait_for(:timeout => 20) { element_exists("* id:'temp_editText1'")}
	waitForElementPresent("* id:'temp_editText1'")
	check_element_does_not_exist("* id:'chat_list_item_right_message_text'")
end

When /^I write a long message$/ do
	#wait_for(:timeout => 20) { element_exists("* id:'temp_editText1'") }
	waitForElementPresent("* id:'temp_editText1'")	
	@timeStamp = Time.now.strftime("%H:%M")
	@longMSG= "Hi I am testing a long message which has 60 characters or more in it."+@timeStamp	
	puts @longMSG
	query("* id:'temp_editText1'",{:setText => @longMSG})
end

Then /^I should see my long chat message in the chat screen$/ do
	wait_for_text(@longMSG, timeout: 10)
end

When /^I tap on the Gallery button$/ do
	sleep(2)
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'") }
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'")	
	touch(query("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'"))
end

When /^I tap on the Photos button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'dialog_button_choice_choice'") }
	waitForElementPresent("* id:'dialog_button_choice_choice'")	
	touch(query("* id:'dialog_button_choice_choice'"))[0]
end

When /^I Select file from gallery$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'gallery_bucket_name_text'") }
	waitForElementPresent("* id:'gallery_bucket_name_text'")	
	touch(query("* id:'gallery_bucket_name_text'"))[0]
	sleep(2)
	#wait_for(:timeout => 30) { element_exists("* id:'gallery_file_thumb'") }
	waitForElementPresent("* id:'gallery_file_thumb'")
	touch(query("* id:'gallery_file_thumb'"))[0]
end

When /^I send file from gallery$/ do
	sleep(2)	
	waitForElementPresent("* text:'Send'")
	touch(query("* text:'Send'"))
end

Then /^the photo file should be displayed in the chat screen$/ do
	sleep(8)	
	waitForElementPresent("* id:'chat_cloud_share_file_right_thumb'")
	check_element_exists("* id:'chat_cloud_share_file_right_thumb'")
end

When /^I tap on the Videos button$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Videos'")
	touch(query("* id:'dialog_button_choice_choice' text:'Videos'"))
end

Then /^the video file should be displayed in the chat screen$/ do
	sleep(8)
	waitForElementPresent("* id:'chat_cloud_send_file_ic_video_right'")
	check_element_exists("* id:'chat_cloud_send_file_ic_video_right'")
end

When /^I click on More option on contact profile$/ do
	waitForElementPresent("* id:'ll_more'")
	touch(query("* id:'ll_more'"))
end

Then /^I should see the Send Location button in contact profile$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Share Location'")
	check_element_exists("* id:'dialog_button_choice_choice' text:'Share Location'")
end

When /^I clear chat history$/ do
	step "I press the more options"
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowButtonRegular text:'Delete Conversation'")
	touch(query("com.woow.talk.views.customwidgets.WoowButtonRegular text:'Delete Conversation'"))
	waitForElementPresent("* id:'first_button_dialog'")
	touch(query("* id:'first_button_dialog'"))
	sleep(2)
	step "I go to \"Contacts\" screen"
end

When /^I tap on share location option$/ do
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Location'")
	touch(query("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Location'"))
end

Then /^I should see the Send Location in chat screen$/ do
	sleep(10)
	waitForElementPresent("* id:'chat_location_icon_right'")
	check_element_exists("* id:'chat_location_icon_right'")	
end

When /^I click on send location on contact profile$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Share Location'")
	touch(query("* id:'dialog_button_choice_choice' text:'Share Location'"))
end
#rotate
When /^I rotate the device to landscape$/ do
	perform_action('set_activity_orientation', 'landscape')
end

Then /^I should see the Send Location in chat screen in landscape mode$/ do
	sleep(1)
	if(element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Contact'"))
		waitForElementPresent("* id:'temp_menuButton'")
		touch(query("* id:'temp_menuButton'"))  
	end
	sleep(5)
 	waitForElementPresent("* id:'chat_location_icon_right'")
	check_element_exists("* id:'chat_location_icon_right'")
	perform_action('set_activity_orientation', 'portrait')
end

Then /^I should see the Send contact button in contact profile$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Share Contact'")
	check_element_exists("* id:'dialog_button_choice_choice' text:'Share Contact'")
end

When /^I click on Send contact on contact profile$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Share Contact'")
	touch(query("* id:'dialog_button_choice_choice' text:'Share Contact'"))
end

When /^I select contact name$/ do
	sleep(2)
	waitForElementPresent("* id:'share_contact_list_item_text_contact_name'")
	touch(query("* id:'share_contact_list_item_text_contact_name'"))[0]
end

Then /^I should see the send contact in chat screen$/ do
	waitForElementPresent("* id:'chat_send_contact_name_right'")
	check_element_exists("* id:'chat_send_contact_name_right'")
end

Then /^I should see the Share Contact button$/ do
	sleep(2)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Contact'")
	check_element_exists("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Contact'")
end

When /^I tap on Share Contact option$/ do
	sleep(2)
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Contact'")
	touch(query("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Share Contact'"))
end

When /^I click on shared contact$/ do
	sleep(5)
	waitForElementPresent("* id:'chat_send_contact_name_right'")
	touch(query("* id:'chat_send_contact_name_right'"))
end

When /^I select second contact name$/ do
	waitForElementPresent("* id:'share_contact_list_item_text_contact_name'")
	touch(query("* id:'share_contact_list_item_text_contact_name' text:'test2 automation'"))
end

Then /^I should see the second send contact in chat screen$/ do
	sleep(1)
	waitForElementPresent("* id:'chat_send_contact_name_right'")
	check_element_exists("* id:'chat_send_contact_name_right' text:'test2 automation'")
end

Then /^I should see the receives contact in chat screen$/ do
	waitForElementPresent("* id:'chat_send_contact_location_left'")
	check_element_exists("* id:'chat_send_contact_location_left'")
	end

When /^I select existing contact name$/ do
	waitForElementPresent("* id:'share_contact_list_item_text_contact_name'")
	touch(query("* id:'share_contact_list_item_text_contact_name' text:'test4 automation'"))
end	

Then /^the message Already in your list is displayed in the contact card$/ do
	#wait_for(:timeout => 20) { element_exists("* id:'chat_send_conatct_already_friend'")}
	waitForElementPresent("* id:'chat_send_conatct_already_friend'")
	total_SentMsg=query("* id:'chat_send_conatct_already_friend'").count
	emoji=query("* id:'chat_send_conatct_already_friend' index:#{total_SentMsg-1}",'text')
	emoji=emoji[0]
	if(emoji.include? "Already in your list")
		flag=true
	end
	assert(flag == true, "Failed due to message is not displayed")
	end
When /^I press the View participants$/ do
	#wait_for(:timeout => 30) { element_exists("com.woow.talk.views.customwidgets.WoowButtonRegular text:'View participants'") }
	waitForElementPresent("com.woow.talk.views.customwidgets.WoowButtonRegular text:'View participants'")
	touch(query("com.woow.talk.views.customwidgets.WoowButtonRegular text:'View participants'"))
end

Then /^I should see View participants in Group chat$/ do
	#wait_for(:timeout => 60) { element_exists("* id:'groupchat_participants_list_item_text_contact_name'")}
	waitForElementPresent("* id:'groupchat_participants_list_item_text_contact_name'")
	check_element_exists("* id:'groupchat_participants_list_item_text_contact_name'")
end

Then /^I should not see the Gallery button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'temp_menuButton'") }
	waitForElementPresent("* id:'temp_menuButton'")
	check_element_does_not_exist("com.woow.talk.views.customwidgets.WoowTextViewMedium text:'Gallery'")
end

Then /^the photo file should be displayed in the group chat screen$/ do
	#wait_for(:timeout => 40) { element_exists("* id:'chat_cloud_share_file_right_thumb'")}
	waitForElementPresent("* id:'chat_cloud_share_file_right_thumb'")
	total_SentMsg=query("* id:'chat_cloud_share_file_right_thumb'").count
	check_element_exists("* id:'chat_cloud_share_file_right_thumb' index:#{total_SentMsg-1}" 'id')
end

Then /^I should see the send contact in the group chat screen$/ do
	#wait_for(:timeout => 40) { element_exists("* id:'chat_send_contact_name_right'")}
	sleep(8)
	waitForElementPresent("* id:'chat_send_contact_name_right'")
	total_SentMsg=query("* id:'chat_send_contact_name_right'").count
	check_element_exists("* id:'chat_send_contact_name_right' index:#{total_SentMsg-1}" 'id')
end

Then /^the video file should be displayed in the group chat screen$/ do
	sleep(15)
	#wait_for(:timeout => 40) { element_exists("* id:'chat_cloud_send_file_ic_video_right'")}
	waitForElementPresent("* id:'chat_cloud_send_file_ic_video_right'")
	total_SentMsg=query("* id:'chat_cloud_send_file_ic_video_right'").count
	check_element_exists("* id:'chat_cloud_send_file_ic_video_right' index:#{total_SentMsg-1}" 'id')
end

Then /^I should see that Audio Call option on contacts profile$/ do
	#wait_for(:timeout => 60) { element_exists("* id:'ll_audio_call'")}
	waitForElementPresent("* id:'ll_audio_call'")
	check_element_exists("* id:'ll_audio_call'")
end

When /^I tap on Audio Call button on contacts profile$/ do
	#wait_for(:timeout => 60) { element_exists("* id:'ll_audio_call'")}
	waitForElementPresent("* id:'ll_audio_call'")
	touch(query("* id:'ll_audio_call'"))
end

When /^I tap on call icon at the top on the screen$/ do
	#wait_for(:timeout => 60) { element_exists("* id:'topbar_chat_CallButton'")}
	waitForElementPresent("* id:'topbar_chat_CallButton'")
	touch(query("* id:'topbar_chat_CallButton'"))
end