require 'calabash-android/calabash_steps'

When /^I tap on "pl.automation5" friend$/ do 
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 	
	sleep(8)
	touch(query("* id:'roster_list_item_text_contact_name' text:'test5 automation'"))
	step "I clear chat history"
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 
	sleep(8)
	touch(query("* id:'roster_list_item_text_contact_name' text:'test5 automation'"))
end

When /^I tap on "group 1" group$/ do
	#wait_for(:timeout => 30) { waitForElementPresent("* id:'roster_list_item_text_contact_name'") }	
	#sleep(5)
	#touch(query("* id:'roster_list_item_text_contact_name' text:'testing group chat'"))
	#touch(query("* id:'roster_list_item_text_contact_name' text:'group 1'"))
	#step "I clear chat history"
	scroll_down
	sleep(5)
	waitForElementPresent("* id:'roster_list_item_text_contact_name'")	
	touch(query("* id:'roster_list_item_text_contact_name' text:'group 1'"))
end

When /^I tap on group$/ do
	scroll_down
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 
	sleep(5)
	touch(query("* id:'roster_list_item_text_contact_name' text:'group 1'"))
end

Then /^I should see the contacts avatar with rounded corners$/ do
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 	
	sleep(5)
	check_element_exists("* id:'roster_list_item_image_avatar'")
end

When /^I tap on "pl.automation1" friend$/ do 
	#waitForElementPresent("* id:'roster_list_item_text_contact_name'")
	#sleep(5)
	#touch(query("* id:'roster_list_item_text_contact_name' text:'test1 automation1'"))
	#step "I clear chat history"
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 
	sleep(5)
	touch(query("* id:'roster_list_item_text_contact_name' text:'test1 automation'"))
end

When /^I tap on "pl.automation7" friend$/ do 
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 
	sleep(5)
	touch(query("* id:'roster_list_item_text_contact_name' text:'test7 automation'"))
end

When /^I tap on "pl.automation8" friend$/ do 
	waitForElementPresent("* id:'roster_list_item_text_contact_name'") 
	sleep(5)
	touch(query("* id:'roster_list_item_text_contact_name' text:'test8 automation'"))
end

Given /^I am in chat window with "pl.automation5"$/ do
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation5\" friend"
end

Given /^I am in chat window with "pl.automation1"$/ do
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation1\" friend"
end

Given /^I am in chat window with "pl.automation4"$/ do
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation4\" friend"
end

Given /^I am in chat window with "pl.automation7"$/ do
	step "I go to \"Contacts\" screen"
	step "I tap on \"pl.automation7\" friend"
end

Given /^I am in chat window with "group 1" group$/ do
	step "I go to \"Contacts\" screen"
	step "I tap on \"group 1\" group"
end

When /^I tap on Add Contact option$/ do
	waitForElementPresent("* id:'add_contact_Button'")
	touch(query("* id:'add_contact_Button'"))
end

Then /^the Search on WowApp option is displayed$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Search on WowApp'")
	check_element_exists("* id:'dialog_button_choice_choice' text:'Search on WowApp'") 
end

When /^I tap on Search on WowApp option$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Search on WowApp'")
	touch(query("* id:'dialog_button_choice_choice' text:'Search on WowApp'"))
end

When /^I enter "(.*?)" on Search field$/ do |username|
	@u = username
	waitForElementPresent("* id:'txt_search_in_wow'")
	query("* id:'txt_search_in_wow'",{:setText => ""})
	query("* id:'txt_search_in_wow'",{:setText => username})
end

When /^I tap on search icon$/ do
	waitForElementPresent("* id:'btn_search_in_wow'")
	touch(query("* id:'btn_search_in_wow'"))
end

Then /^User should see searched user$/ do
	sleep(10)
	waitForElementPresent("* id:'search_in_wow_list_item_text_name'")
	check_element_exists("* id:'search_in_wow_list_item_text_name' text:'Atin Chak'")	
end

Then /^User should receives an error message that search filed cannot be empty$/ do
	waitForElementPresent("* id:'dialog_general_message' text:'The search field cannot be empty.'")
	check_element_exists("* id:'dialog_general_message' text:'The search field cannot be empty.'") 
end

When /^I tap on search option on My Contact List$/ do
	waitForElementPresent("* id:'more_Button'")
	touch(query("* id:'more_Button'"))
end

Then /^User should see search option on My Contact List$/ do
	waitForElementPresent("* id:'search_edit'")
	check_element_exists("* id:'search_edit'")
end

When /^I enter "(.*?)" into Search field in My Contact List$/ do |firendname|
	waitForElementPresent("* id:'search_edit'")
	query("* id:'search_edit'",{:setText => ""})
	query("* id:'search_edit'",{:setText => firendname})
end

Then /^User should see searched user in My Contact List$/ do
	sleep(1)
	waitForElementPresent("* id:'roster_list_item_text_contact_name'")
	check_element_exists("* id:'roster_list_item_text_contact_name' text:'test2 automation'")	
end

When /^I tap on searched user$/ do
	sleep(10)
	waitForElementPresent("* id:'search_in_wow_list_item_text_name'")
	touch(query("* id:'search_in_wow_list_item_text_name' text:'Atin Chak'"))
end

Then /^User should see searched user profile$/ do
	waitForElementPresent("* id:'topbar_contact_request_backButton'")
	check_element_exists("* id:'topbar_contact_request_backButton'")
end

When /^I tap on View Full Profile$/ do
	waitForElementPresent("* id:'send_invite_view_profile'")
	touch(query("* id:'send_invite_view_profile'"))
end

Then /^User should see searched user full profile$/ do
	waitForElementPresent("* id:'txt_add_contact'")
	check_element_exists("* id:'txt_add_contact'")
end

Then /^User should see message No results$/ do
	waitForElementPresent("* id:'message'")
	check_element_exists("* id:'message'")
end

When /^I tap back button from Find People screen$/ do
	waitForElementPresent("* id:'btn_back_search_in_wow'")
	touch(query("* id:'btn_back_search_in_wow'"))
end

Then /^User should see Contact screen$/ do
	waitForElementPresent("* id:'add_contact_Button'")
	check_element_exists("* id:'add_contact_Button'")
end

Then /^User should see search on wow app option$/ do
	waitForElementPresent("* id:'roster_button_search_in_woow'")
	check_element_exists("* id:'roster_button_search_in_woow'")
end

When /^I tap on search on wow app option$/ do
	waitForElementPresent("* id:'roster_button_search_in_woow'")
	touch(query("* id:'roster_button_search_in_woow'"))
end

Then /^User should see Find People screen$/ do
	waitForElementPresent("* id:'btn_back_search_in_wow'")
	check_element_exists("* id:'btn_back_search_in_wow'")
end

When /^I tap on the searched friend$/ do
	sleep(1)
	waitForElementPresent("* id:'roster_list_item_text_contact_name'")
	touch(query("* id:'roster_list_item_text_contact_name' text:'test2 automation'"))
end

Then /^User should see chat screen of the friend$/ do
	waitForElementPresent("* id:'topbar_chat_title'")
	check_element_exists("* id:'topbar_chat_title'")
end

When /^I tap on searched user on find people$/ do
	sleep(10)
	puts @u
	t = "* id:'search_in_wow_list_item_text_name' text:"+"'"+@u+"'"+""
	waitForElementPresent("* id:'search_in_wow_list_item_text_name'")
	touch(query(""+t+""))
end

Then /^User should see Contact request sent message$/ do
	waitForElementPresent("* id:'roster_list_item_text_contact_status_message'")
	check_element_exists("* id:'roster_list_item_text_contact_status_message'")
end

When /^I tap on sent request contact$/ do
	sleep(1)
	waitForElementPresent("* id:'roster_list_item_text_contact_status_message'")
	touch(query("* id:'roster_list_item_text_contact_status_message'"))
end

Then /^User status should be displayed Pending$/ do
	waitForElementPresent("* id:'topbar_chat_subtitle'")
	check_element_exists("* id:'topbar_chat_subtitle' text:'Pending'")
end

Then /^User should see Send Invite and Save Telephone number options from Add Contact$/ do
	waitForElementPresent("* text:'Send Invite'")
	check_element_exists("* text:'Send Invite'")
	waitForElementPresent("* text:'Save Telephone Number'")
	check_element_exists("* text:'Save Telephone Number'")
end