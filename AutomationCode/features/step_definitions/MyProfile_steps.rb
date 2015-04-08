require 'calabash-android/calabash_steps'
require 'test/unit/assertions'
World(::Test::Unit::Assertions)

Then /^I should see the My Profile section$/ do
	scroll_up
	sleep(5)	
	waitForElementPresent("* id:'rl_personal_profile'")
	check_element_exists("* id:'rl_personal_profile'") 
	check_element_exists("* id:'text_user_name'") 
	check_element_exists("* id:'text_send_invites_top_title'") 		
	check_element_exists("* id:'send_invites_envelope'") 		
	check_element_exists("* id:'text_earnings_title'") 		
	check_element_exists("* id:'ll_send_invites_bottom_same'") 		
	check_element_exists("* id:'ll_settings'") 		
end

When /^I tap on the username$/ do
	sleep (3)
	waitForElementPresent("* id:'text_user_name'")
	touch(query("* id:'text_user_name'"))	
end

Then /^I should see my name displayed$/ do
	waitForElementPresent("* id:'text_user_name'")
	check_element_exists("* id:'text_user_name'") 
	check_element_does_not_exist("* id:'text_user_name' text:''") 
end

Then /^I should see the Edit My Profile section$/ do
	waitForElementPresent("* id:'top_bar_btn_edit_with_text'")
	check_element_exists("* id:'top_bar_btn_edit_with_text'") 
	check_element_exists("* id:'text_user_status_title'") 		
	check_element_exists("* id:'text_detail_title'") 	
end

Then /^I should see my avatar or the default user icon displayed$/ do
	waitForElementPresent("* id:'img_avatar'")
	check_element_exists("* id:'img_avatar'") 
end

When /^I type a custom status$/ do
	begin
		waitForElementPresent("* id:'text_user_status_no_status_set'")	
		touch(query("* id:'text_user_status_no_status_set'"))
	rescue
		waitForElementPresent("* id:'text_user_status'")	
		touch(query("* id:'text_user_status'"))
	end
	@statusText='hi I am fine'
	query("* id:'change_status_dialog_changeEdit'",{:setText => @statusText})	
	touch(query("* id:'topbar_gen_backButton'"))	
end

When /^I save it$/ do
	sleep(2)
	#touch(query("* id:'topbar_gen_backButton'"))
	touch(query("* id:'top_bar_btn_back'"))
end

Then /^I should see my custom status displayed$/ do
	waitForElementPresent("* id:'text_user_status'")	
	query("* id:'text_user_status' text:'#{@statusText}'")
end

When /^I press the Send Invite button$/ do
	waitForElementPresent("* id:'ll_send_invites_bottom_same'")	
	touch(query("* id:'ll_send_invites_bottom_same'"))
end

When /^I press the Send Feedback button$/ do
	waitForElementPresent("* id:'ll_send_feedback'")	
	touch(query("* id:'ll_send_feedback'"))
end 

When /^I press the Activity Notifications button$/ do
	waitForElementPresent("* id:'icon'")	
	touch(query("* id:'icon'")[1])
end

Then /^I should see the Activity Notifications screen$/ do
	waitForElementPresent("* id:'new_chat_Button'")	
	check_element_exists("* id:'new_chat_Button'") 
end	

When /^I press profile icon$/ do
	sleep (5)
	waitForElementPresent("* id:'icon'")	
	touch(query("* id:'icon'")[0])
end

When /^I press the My Wow button$/ do
	waitForElementPresent("* id:'ll_my_wow'")	
	touch(query("* id:'ll_my_wow'"))
end

Then /^I should see the My Wow screen$/ do
	sleep(2)
	waitForElementPresent("* id:'separator_notifs_my_wow'")	
	check_element_exists("* id:'separator_notifs_my_wow'") 
end

When /^I press the back button from My Wow screen$/ do
	waitForElementPresent("* id:'topbar_gen_backButton'")	
	touch(query("* id:'topbar_gen_backButton'"))
	sleep(1)
end

When /^I tap on the Edit My Profile button$/ do
	sleep(5)
	waitForElementPresent("* id:'top_bar_btn_edit_with_text'")	
	touch(query("* id:'top_bar_btn_edit_with_text'"))
end

When /^I tap on avatar$/ do
	waitForElementPresent("* id:'edit_profile_avatar'")	
	touch(query("* id:'edit_profile_avatar'"))
end

Then /^I should see the screen with the available avatar options$/ do
	waitForElementPresent("* text:'From Gallery'")	
	check_element_exists("* text:'From Gallery'")
	check_element_exists("* text:'From Camera'")
 end
 
 Then /^I should see all the profile information fields displayed$/ do
	waitForElementPresent("* id:'done_button'")	
	check_element_exists("* id:'edit_profile_avatar'")
	check_element_exists("* id:'edit_profile_first_name'")
	check_element_exists("* id:'edit_profile_last_name'")
	check_element_exists("* id:'edit_profile_birthday_title'")
	check_element_exists("* id:'edit_profile_gender_title'")
	check_element_exists("* id:'edit_profile_location_title'")
	check_element_exists("* id:'edit_profile_phone_title'")
end

When /^I change the First Name$/ do
	waitForElementPresent("* id:'edit_profile_first_name'")	
	@timeStamp1 = Time.now.strftime("%S")
	@Firstname= "First"+@timeStamp1	
	puts @Firstname
	touch(query("* id:'edit_profile_first_name'"))
	query("* id:'edit_profile_first_name'",{:setText => @Firstname}) 
end
 
When /^I save the changes$/ do
	waitForElementPresent("* id:'done_button'")	
	touch(query("* id:'done_button'"))
end

Then /^I should see the First Name changed successfully$/ do
	waitForElementPresent("* id:'edit_profile_first_name'")	
#	@name = query("* id:'edit_profile_first_name'", 'text')
#	puts @name
#	if(@name.include? @Firstname)
#		flag=true
#	end
	#assert(flag == true, "Failed due to First Name is not saved")
	assert_text(@Firstname)
end

When /^I change the Last Name$/ do
	waitForElementPresent("* id:'edit_profile_last_name'")	
	@timeStamp2 = Time.now.strftime("%S")
	@Lastname= "Last"+@timeStamp2	
	puts @Lastname
	touch(query("* id:'edit_profile_last_name'"))
	query("* id:'edit_profile_last_name'",{:setText => @Lastname}) 
end

Then /^I should see the Last Name changed successfully$/ do
	waitForElementPresent("* id:'edit_profile_last_name'")	
	@lname = query("* id:'edit_profile_last_name'", 'text')
	puts @lname
	#if(@lname.include? @Lastname)
	#	flag=true
	#end
	#assert(flag == true, "Failed due to Last Name is not saved")
	assert_text(@Lastname)
end

When /^I change the Gender$/ do
	waitForElementPresent("* id:'edit_profile_gender_spinner'")	
	touch(query("* id:'edit_profile_gender_spinner'"))
	sleep(2)
	waitForElementPresent("* id:'dialog_button_choice_choice'")	
	touch(query("* id:'dialog_button_choice_choice'"))
end

Then /^I should see the Gender changed successfully$/ do
	waitForElementPresent("* id:'edit_profile_gender_spinner'")	
	check_element_exists("* id:'edit_profile_gender_spinner' text:'Male'")
end

When /^I change the city$/ do
	waitForElementPresent("* id:'edit_profile_city'")	
	@timeStamp2 = Time.now.strftime("%S")
	@Cityname= "City"+@timeStamp2	
	puts @Cityname
	touch(query("* id:'edit_profile_city'"))
	query("* id:'edit_profile_city'",{:setText => @Cityname}) 
end

Then /^I should see the City changed successfully$/ do
	waitForElementPresent("* id:'edit_profile_city'")	
	@cname = query("* id:'edit_profile_city'", 'text')
	puts @cname
	#if(@cname.include? @Cityname)
	#	flag=true
	#end
	#assert(flag == true, "Failed due to City is not saved")
	assert_text(@Cityname)
end

When /^I change the Country$/ do
	waitForElementPresent("* id:'edit_profile_country_spinner'")	
	touch(query("* id:'edit_profile_country_spinner'"))
	sleep(2)
	waitForElementPresent("* id:'countryrow_TextCountryName'")	
	touch(query("* id:'countryrow_TextCountryName'"))
end

Then /^I should see the Country changed successfully$/ do
	waitForElementPresent("* id:'edit_profile_country_spinner'")	
	check_element_exists("* id:'edit_profile_country_spinner' text:'Afghanistan'")
end

When /^I tap on About WowApp$/ do
	scroll_down
	sleep(2)
	waitForElementPresent("* text:'About WowApp'")	
	touch(query("* text:'About WowApp'"))
end

Then /^I should see the About WowApp screen$/ do	
	waitForElementPresent("* id:'topbar_gen_backButton'")	
	check_element_exists("* id:'topbar_gen_backButton' text:'About WowApp'")
end

When /^I change the website$/ do
	scroll_down
	sleep(2)
	waitForElementPresent("* id:'edit_profile_website'")	
	@timeStamp2 = Time.now.strftime("%S")
	@webname= "www.mywebsite"+@timeStamp2+".com"	
	puts @webname
	touch(query("* id:'edit_profile_website'"))
	query("* id:'edit_profile_website'",{:setText => @webname}) 
end

Then /^I should see the website changed successfully$/ do
	scroll_down
	sleep(2)
	waitForElementPresent("* id:'edit_profile_website'")	
	@wname = query("* id:'edit_profile_website'", 'text')
	puts @wname
	#if(@wname.include? @webname)
	#	flag=true
	#end
	#assert(flag == true, "Failed due to Website is not saved")
	assert_text(@webname)
end

When /^I press the back button on the top of the screen$/ do
	waitForElementPresent("* id:'topbar_gen_backButton'")	
	touch(query("* id:'topbar_gen_backButton'"))
end

When /^I tap on Keypad option$/ do
	waitForElementPresent("* id:'ll_keypad'")	
	touch(query("* id:'ll_keypad'"))
end

Then /^I should see the Keypad screen$/ do
	waitForElementPresent("* id:'img_back'")	
	check_element_exists("* id:'img_back' text:'Keypad'")
	#check_element_exists("* id:'btn_add_credit_popup'")
end

When /^I press the back button on the Keypad screen$/ do
	waitForElementPresent("* id:'img_back'")	
	touch(query("* id:'img_back'"))
end

Then /^I should see the personal info section$/ do
	waitForElementPresent("* id:'text_detail_title'")	
	check_element_exists("* id:'text_detail_title' text:'Username:'")
	check_element_exists("* id:'text_detail_title' text:'Network:'")
	check_element_exists("* id:'text_detail_title' text:'Birthday:'")
end

When /^I tap on setting option$/ do
	waitForElementPresent("* id:'ll_settings'")	
	touch(query("* id:'ll_settings'"))
end

Then /^I should see the setting screen$/ do
	waitForElementPresent("* id:'settings_arrow_line_item_label'")	
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Vibrate, Sound and Light'")
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Media'")
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Account'")
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Profile'")
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Manage Invites'")
end

When /^I tap on Vibrate,Sound and light option$/ do
	waitForElementPresent("* id:'settings_arrow_line_item_label' text:'Vibrate, Sound and Light'")	
	touch(query("* id:'settings_arrow_line_item_label' text:'Vibrate, Sound and Light'"))
end

Then /^I should see the Vibrate,Sound and light screen$/ do
	waitForElementPresent("* id:'account_edit_privacy_title_label'")	
	check_element_exists("* id:'account_edit_privacy_title_label' text:'Messages'")
	check_element_exists("* id:'account_edit_privacy_title_label' text:'Calls'")
	check_element_exists("* id:'account_edit_privacy_title_label' text:'Earnings'")
	check_element_exists("* id:'account_edit_privacy_title_label' text:'Network'")
end

When /^I tap on Media option$/ do
	waitForElementPresent("* id:'settings_arrow_line_item_label' text:'Media'")	
	touch(query("* id:'settings_arrow_line_item_label' text:'Media'"))
end

Then /^I should see the Media screen$/ do
	waitForElementPresent("* id:'account_edit_privacy_title_label'")	
	check_element_exists("* id:'account_edit_privacy_title_label' text:'When using mobile data'")
	check_element_exists("* id:'account_edit_privacy_title_label' text:'When using Wi-Fi'")
	check_element_exists("* id:'account_edit_privacy_title_label' text:'When roaming'")	
end

When /^I tap on Account option$/ do
	waitForElementPresent("* id:'settings_arrow_line_item_label' text:'Account'")	
	touch(query("* id:'settings_arrow_line_item_label' text:'Account'"))
end

Then /^I should see the Account screen$/  do
	waitForElementPresent("* id:'settings_arrow_line_item_label'")	
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Privacy'")
	check_element_exists("* id:'settings_arrow_line_item_label' text:'Blocked Contacts'")
end

When /^I tap on Profile option on setting$/ do
	waitForElementPresent("* id:'settings_arrow_line_item_label' text:'Profile'")	
	touch(query("* id:'settings_arrow_line_item_label' text:'Profile'"))
end

Then /^I should see the Profile screen from setting$/ do
	step "I should see the personal info section"
end