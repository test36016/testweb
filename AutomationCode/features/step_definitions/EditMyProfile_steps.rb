When /^I go to the edit profile screen$/ do
	step "I go to Profile screen"
	step "I tap on the username"
	step "I tap on edit button"
end

When /^I tap on edit button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'top_bar_btn_edit_with_text'") }	
	waitForElementPresent("* id:'top_bar_btn_edit_with_text'")
	touch(query("* id:'top_bar_btn_edit_with_text'"))
end

When /^I add new phone number$/ do
	sleep (5)
	#wait_for(:timeout => 30) { element_exists("* id:'done_button'") }	
	waitForElementPresent("* id:'done_button'")
	scroll_screen_until_element_not_exist("* id:'edit_profile_website_title'")
	delete_additional_Phone_number()
	
	#wait_for(:timeout => 30) { element_exists("* id:'edit_profile_add_new_phone_number'") }	
	waitForElementPresent("* id:'edit_profile_add_new_phone_number'")
	touch(query("* id:'edit_profile_add_new_phone_number'"))
end

When /^I enter the number "([^\"]*)"$/ do |number|
	#wait_for(:timeout => 30) { element_exists("* id:'edit_profile_phone_number'") }	
	waitForElementPresent("* id:'edit_profile_phone_number'")
	query("* id:'edit_profile_phone_number' index:1",{:setText => ""})
	query("* id:'edit_profile_phone_number' index:1",{:setText => number})
end

When /^I paste the number "([^\"]*)"$/ do |number|
	#wait_for(:timeout => 30) { element_exists("* id:'edit_profile_phone_number'") }	
	waitForElementPresent("* id:'edit_profile_phone_number'")
	query("* id:'edit_profile_phone_number' index:1",{:setText => ""})
	query("* id:'edit_profile_phone_number' index:1",{:setText => number})
end

Then /^I should see the number change to "(.*?)"$/ do |arg1|
	#wait_for(:timeout => 10) { element_exists("* id:'edit_profile_phone_number'") }
	waitForElementPresent("* id:'edit_profile_phone_number'")
	assert_text(arg1)
end

Then /^I should see the number "(.*?)"$/ do |arg1|
	#wait_for(:timeout => 10) { element_exists("* id:'edit_profile_phone_number'") }
	waitForElementPresent("* id:'edit_profile_phone_number'")
	assert_text(arg1)
end

Then /^I should see the number is saved in the format "(.*?)"$/ do |arg1|	
	#wait_for(:timeout => 10) { element_exists("* id:'top_bar_btn_edit_with_text'") }
	waitForElementPresent("* id:'top_bar_btn_edit_with_text'")
	sleep(4)
	adbscroll_screen_until_element_not_exist("* id:'text_detail_title' text:'Website:'")	
	sleep (8)
	assert_text(arg1)
end

When /^I click the Done button$/ do
	#wait_for(:timeout => 30) { element_exists("* id:'done_button'") }
	sleep(5)
	waitForElementPresent("* id:'done_button'")
	touch(query("* id:'done_button'"))
end

When /^I select the country Romania$/ do
	#wait_for(:timeout => 10) { element_exists("* id:'edit_profile_country_icon'") }	
	waitForElementPresent("* id:'edit_profile_country_icon'")
	touch(query("* id:'edit_profile_country_icon'")[1])
	#wait_for(:timeout => 10) { element_exists("* id:'country_filter_search_bar'") }	
	waitForElementPresent("* id:'country_filter_search_bar'")
	press_back_button
	scroll_screen_until_element_not_exist("* id:'countryrow_TextCountryName' text:'Romania'")
	waitForElementPresent("* id:'countryrow_TextCountryName' text:'Romania'")
    touch(query("* id:'countryrow_TextCountryName' text:'Romania'"))
end

When /^I change country to Sri Lanka$/ do
	#wait_for(:timeout => 10) { element_exists("* id:'edit_profile_country_icon'") }	
	waitForElementPresent("* id:'edit_profile_country_icon'")
	touch(query("* id:'edit_profile_country_icon'")[1])
	
	#wait_for(:timeout => 10) { element_exists("* id:'country_filter_search_bar'") }	
	waitForElementPresent("* id:'country_filter_search_bar'")
	press_back_button
	scroll_screen_until_element_not_exist("* id:'countryrow_TextCountryName' text:'Sri Lanka'")
    touch(query("* id:'countryrow_TextCountryName' text:'Sri Lanka'"))
end

When /^I enter the number "([^\"]*)" after county selection$/ do|number|
	#wait_for(:timeout => 10) { element_exists("* id:'edit_profile_phone_number'") }	
	waitForElementPresent("* id:'edit_profile_phone_number'")
	enter_text("* id:'edit_profile_phone_number' index:1", number)	
end

Then /^a message is displayed saying 'Invalid Phone Number'$/ do
	#wait_for(:timeout => 10) { element_exists("* id:'message'") }	
	waitForElementPresent("* id:'message'")	
	check_element_exists(("* id:'message' text:'Invalid Phone'"))   
end

def delete_additional_Phone_number()
	total_phoneNumber= query("* id:'edit_profile_delete_phone_number'").count
    while (total_phoneNumber>1)		
        touch(query("* id:'edit_profile_delete_phone_number'"))
		sleep 2
		total_phoneNumber= query("* id:'edit_profile_delete_phone_number'").count
    end
end	
def delete_additional_Phone_number_on_contact()
	total_phoneNumber= query("* id:'edit_profile_delete_phone_number'").count
    while (total_phoneNumber>0)		
        delete=query("* id:'edit_profile_delete_phone_number' index:#{total_phoneNumber-1}")
		touch(delete)
		#touch(query("* id:'edit_profile_delete_phone_number'"))
		sleep 2
		total_phoneNumber= query("* id:'edit_profile_delete_phone_number'").count
    end
end

When /^I select Canada$/ do
	waitForElementPresent("* id:'edit_profile_country_icon'")
	touch(query("* id:'edit_profile_country_icon'")[1])
	
	#wait_for(:timeout => 10) { element_exists("* id:'country_filter_search_bar'") }	
	waitForElementPresent("* id:'country_filter_search_bar'")
	press_back_button
	scroll_screen_until_element_not_exist("* id:'countryrow_TextCountryName' text:'Canada'")
    waitForElementPresent("* id:'countryrow_TextCountryName' text:'Canada'")
	touch(query("* id:'countryrow_TextCountryName' text:'Canada'"))
end

When /^I select Angola$/ do
	waitForElementPresent("* id:'edit_profile_country_icon'")
	touch(query("* id:'edit_profile_country_icon'"))
	
	#wait_for(:timeout => 10) { element_exists("* id:'country_filter_search_bar'") }	
	waitForElementPresent("* id:'country_filter_search_bar'")
	press_back_button
	scroll_screen_until_element_not_exist("* id:'countryrow_TextCountryName' text:'Angola'")
	waitForElementPresent("* id:'countryrow_TextCountryName' text:'Angola'")
    touch(query("* id:'countryrow_TextCountryName' text:'Angola'"))
end

When /^I press the more option from view profile$/ do
	sleep(5)
	waitForElementPresent("* id:'top_bar_btn_more'")
	touch(query("* id:'top_bar_btn_more'"))
end

When /^I press Add info option$/ do
	waitForElementPresent("* text:'Add Info'")
	touch(query("* text:'Add Info'"))
end

When /^I add new phone number on contact screen$/ do
	sleep (5)
	delete_additional_Phone_number_on_contact()
	waitForElementPresent("* id:'edit_profile_add_new_phone_number'")
	touch(query("* id:'edit_profile_add_new_phone_number'"))
	#waitForElementPresent("* id:'edit_profile_country_icon'")
	#touch(query("* id:'edit_profile_country_icon'"))
end

Then /^I should see the number is saved in the format "(.*?)" on contact screen$/ do |arg1|	
	#wait_for(:timeout => 10) { element_exists("* id:'top_bar_btn_edit_with_text'") }
	waitForElementPresent("* id:'top_bar_btn_more'")
	sleep(2)
	adbscroll_screen_until_element_not_exist("* id:'text_detail_title' text:'Website:'")	
	sleep (10)
	assert_text(arg1)
end

When /^I select the country Romania from contact screen$/ do
	waitForElementPresent("* id:'edit_profile_country_icon'")
	touch(query("* id:'edit_profile_country_icon'"))
	sleep(5)
	waitForElementPresent("* id:'country_filter_search_bar'")
	press_back_button
	sleep(5)
	scroll_screen_until_element_not_exist("* id:'countryrow_TextCountryName' text:'Romania'")
	waitForElementPresent("* id:'countryrow_TextCountryName' text:'Romania'")
    touch(query("* id:'countryrow_TextCountryName' text:'Romania'"))
end

When /^I enter the number "(.*?)" after county selection from contact screen$/ do |number|
	waitForElementPresent("* id:'edit_profile_phone_number'")
	enter_text("* id:'edit_profile_phone_number'", number)	
end

When /^I enter the number "(.*?)" on contact screen$/ do |number|
	#wait_for(:timeout => 30) { element_exists("* id:'edit_profile_phone_number'") }	
	waitForElementPresent("* id:'edit_profile_phone_number'")
	query("* id:'edit_profile_phone_number'",{:setText => ""})
	query("* id:'edit_profile_phone_number'",{:setText => number})
end

When /^I paste the number "(.*?)" on contact screen$/ do |number|
	#wait_for(:timeout => 30) { element_exists("* id:'edit_profile_phone_number'") }	
	waitForElementPresent("* id:'edit_profile_phone_number'")
	query("* id:'edit_profile_phone_number'",{:setText => ""})
	query("* id:'edit_profile_phone_number'",{:setText => number})
end