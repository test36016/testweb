When /^I modify the default message$/ do
	waitForElementPresent("* id:'send_invite_personal_message'")
	query("* id:'send_invite_personal_message'",{:setText => ""})
	query("* id:'send_invite_personal_message'",{:setText => "Hello friend"})
end

Then /^User should see change message$/ do
	sleep(1)
	waitForElementPresent("* id:'send_invite_personal_message' text:'Hello friend'")
	check_element_exists("* id:'send_invite_personal_message' text:'Hello friend'")
end

When /^I tap on send contact request$/ do
	waitForElementPresent("* id:'send_invite_send_request'")
	touch(query("* id:'send_invite_send_request'"))
end

Given /^I have pending friend requests$/ do
	step "I am logged in with \"pl.automation7\" account"
	step "I go to \"Contacts\" screen"
	step "I declined a friend request which I have already"
	gotoHomeScreen()
	shutdown_test_server
	clear_app_data
	start_test_server_in_background
	step "I am logged in with \"pl.automation4\" account"
	step "I go to \"Contacts\" screen"
	#step "I tap on \"pl.automation7\" friend"
	step "I tap on \"pl.automation7\""
	#step "I tap on Add to Contacts"
end

When /^I declined a friend request without blocking him$/ do
	waitForElementPresent("* id:'roster_list_item_image_decline_request'")
	touch(query("* id:'roster_list_item_image_decline_request'"))
# Click on No for without blocking
	waitForElementPresent("* id:'second_button_dialog'")
	touch(query("* id:'second_button_dialog'"))
end

Then /^friend request should be declined$/ do
	sleep(5)
	waitForElementPresent("* id:'roster_list_item_text_contact_name'")
	check_element_does_not_exist("* id:'roster_list_item_image_decline_request'")
end

Then /^User should receive friend request$/ do
	waitForElementPresent("* id:'roster_list_item_image_decline_request'")
	check_element_exists("* id:'roster_list_item_image_decline_request'")
end

When /^I accept a friend request$/ do
	waitForElementPresent("* id:'roster_list_item_image_accept_request'")
	touch(query("* id:'roster_list_item_image_accept_request'"))
end

When /^I delete friend from contact list$/ do
	begin
		wait_for(:timeout => 30) { element_exists("* id:'roster_list_item_text_contact_name' text:'test7 automation'") }
		if (element_exists("* id:'roster_list_item_text_contact_name' text:'test7 automation'"))
			touch(query("* id:'roster_list_item_text_contact_name' text:'test7 automation'"))
			step "I press the more options"
			step "I press the View Profile"
			waitForElementPresent("* id:'top_bar_btn_more'")
			touch(query("* id:'top_bar_btn_more'"))
			waitForElementPresent("* text:'Remove from Contacts'")
			touch(query("* text:'Remove from Contacts'"))
			waitForElementPresent("* id:'first_button_dialog'")
			touch(query("* id:'first_button_dialog'"))
			puts "Added friend is deleted"
		else
		end
	rescue
		puts "No Friend displays"
	end
end

Given /^I have sent a friend requests$/ do
	step "I am logged in with \"pl.automation8\" account"
	step "I go to \"Contacts\" screen"
	step "I delete friend from contact list"
	step "I logged in with \"pl.automation7\" account"
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation8\" friend"
	step "I tap on Add to Contacts"
end

When /^I tap on Add to Contacts$/ do
	waitForElementPresent("* text:'Add to contacts'")
	touch(query("* text:'Add to contacts'"))
end

When /^I tap on friend request$/ do
	waitForElementPresent("* id:'roster_list_item_text_contact_status_message'")
	touch(query("* id:'roster_list_item_text_contact_status_message'"))
end

When /^I tap on View Full Profile on friend request$/ do
	waitForElementPresent("* text:'View Full Profile'")
	touch(query("* text:'View Full Profile'"))
end

Then /^User should see full profile from receive friend request$/ do
	waitForElementPresent("* id:'top_bar_title'")
	check_element_exists("* id:'top_bar_title'")
end

Then /^User should see Accept and Decline buttons$/ do
	waitForElementPresent("* id:'text_accept'")
	check_element_exists("* id:'text_accept'")
	waitForElementPresent("* id:'text_decline'")
	check_element_exists("* id:'text_decline'")
end

Then /^User should see modify default message$/ do
	waitForElementPresent("* id:'contact_request_message'")
	check_element_exists("* id:'contact_request_message' text:'Hi, please add me as a friend!'")
end

When /^I declined a friend request without blocking him after tapping it$/ do
	sleep(3)
	waitForElementPresent("* id:'text_decline'")
	touch(query("* id:'text_decline'"))
# Click on No for without blocking
	waitForElementPresent("* id:'second_button_dialog'")
	touch(query("* id:'second_button_dialog'"))
end

Then /^User should be in My contact list$/ do
	sleep(4)
	waitForElementPresent("* id:'roster_list_item_text_contact_name' text:'test7 automation'")
	touch(query("* id:'roster_list_item_text_contact_name' text:'test7 automation'"))
	step "I press the more options"
	step "I press the View Profile"
	waitForElementPresent("* id:'top_bar_btn_more'")
	touch(query("* id:'top_bar_btn_more'"))
	waitForElementPresent("* text:'Remove from Contacts'")
	check_element_exists("* text:'Remove from Contacts'")
end

When /^I accept a friend request after tapping it$/ do
	waitForElementPresent("* id:'text_accept'")
	touch(query("* id:'text_accept'"))
end

When /^I tap on send contact request on friend profile$/ do
	waitForElementPresent("* id:'txt_add_contact'")
	touch(query("* id:'txt_add_contact'"))
end

Then /^user should see contact sent message on user profile$/ do
	waitForElementPresent("* text:'Contact Request Sent'")
	check_element_exists("* text:'Contact Request Sent'")
end

When /^I declined a friend request which I have already$/ do
	begin
		wait_for(:timeout => 20) { element_exists("* id:'roster_list_item_image_decline_request'") }
		if (element_exists("* id:'roster_list_item_image_decline_request'"))
			step "I declined a friend request without blocking him"
			puts "Previously request is declined"
		else
		end
	rescue
		puts "No request displays"
	end
end

Given /^I have no pending friend requests$/ do
	step "I am logged in with \"pl.automation7\" account"
	step "I am logged in with \"pl.automation4\" account on second device"
	step "I Select First device"
	step "I go to \"Contacts\" screen"
	step "I declined a friend request which I have already"	
end

Given /^I tap on "(.*?)"$/ do |arg1|
begin
	wait_for(:timeout => 30) { element_exists("* id:'roster_list_item_text_contact_name' text:'test7 automation'") }
	if (element_exists("* id:'roster_list_item_text_contact_name' text:'test7 automation'"))
		touch(query("* id:'roster_list_item_text_contact_name' text:'test7 automation'"))
		step "I tap on Add to Contacts"
		else
		end
	rescue
		step "I tap on Add Contact option"
		step "I tap on Search on WowApp option"
		step "I enter \"test7 automation\" on Search field"
		step "I tap on search icon"
		step "I tap on searched user on find people"
		step "I tap on send contact request"
		step "User should see Contact request sent message"
		puts "Searched by wow search"
	end
end

Given /^I have pending friend requests without blocking$/ do
	step "I am logged in with \"pl.automation8\" account"
	step "I go to Profile screen"
	step "I tap on setting option"
	step "I tap on Account option"
	waitForElementPresent("* id:'settings_account_blocked_contacts_layout'")
	touch(query("* id:'settings_account_blocked_contacts_layout'"))
	begin
		wait_for(:timeout => 20) { element_exists("* id:'blocked_contact_list_item_name_text'") }
		if (element_exists("* id:'blocked_contact_list_item_name_text'"))
			waitForElementPresent("* id:'blocked_contact_list_item_unblock_button'")
			touch(query("* id:'blocked_contact_list_item_unblock_button'"))
			# Click on Yes on confirm message
			waitForElementPresent("* id:'first_button_dialog'")
			touch(query("* id:'first_button_dialog'"))
			# Click on No to add contact in friend list
			waitForElementPresent("* id:'second_button_dialog'")
			touch(query("* id:'second_button_dialog'"))
			puts "Previous contact is unblocked"
		else
		end
	rescue
		puts "No contact displays in blocked list"
	end
end

When /^I declined a friend request with blocking him$/ do
	waitForElementPresent("* id:'roster_list_item_image_decline_request'")
	touch(query("* id:'roster_list_item_image_decline_request'"))
# Click on Yes for blocking
	waitForElementPresent("* id:'first_button_dialog'")
	touch(query("* id:'first_button_dialog'"))
end

When /^I declined a friend request with blocking him after tapping it$/ do
	sleep(3)
	waitForElementPresent("* id:'text_decline'")
	touch(query("* id:'text_decline'"))
# Click on Yes for blocking
	waitForElementPresent("* id:'first_button_dialog'")
	touch(query("* id:'first_button_dialog'"))
end

Then /^User should see blocked friend in blocked list$/ do
	step "I go to Profile screen"
	step "I tap on setting option"
	step "I tap on Account option"
	waitForElementPresent("* id:'settings_account_blocked_contacts_layout'")
	touch(query("* id:'settings_account_blocked_contacts_layout'"))
	waitForElementPresent("* id:'blocked_contact_list_item_name_text'")
	check_element_exists("* id:'blocked_contact_list_item_name_text'")
end

When /^I sent a friend request to pl.automation8$/ do
	step "I tap on \"pl.automation8\" friend"
	step "I tap on Add to Contacts"
end