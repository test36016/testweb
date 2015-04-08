When /^I am in the dial pad$/ do
	step "I go to Profile screen"
	step "I tap on Keypad option"
end

When /^I select a country$/ do
	waitForElementPresent("* id:'btn_pick_country'")
	touch(query("* id:'btn_pick_country'"))
	waitForElementPresent("* id:'country_filter_search_bar'")
	press_back_button
	scroll_screen_until_element_not_exist("* id:'countryrow_TextCountryName' text:'Romania'")
	waitForElementPresent("* id:'countryrow_TextCountryName' text:'Romania'")
    touch(query("* id:'countryrow_TextCountryName' text:'Romania'"))
end

When /^I type a valid phone number$/ do
	waitForElementPresent("* id:'rl_seven'")
	touch(query("* id:'rl_seven'"))
	sleep(1)
	touch(query("* id:'rl_three'"))
	sleep(1)
	touch(query("* id:'rl_one'"))
	sleep(1)
	touch(query("* id:'rl_seven'"))
	sleep(1)
	touch(query("* id:'rl_nine'"))
	sleep(1)
	touch(query("* id:'rl_three'"))
	sleep(1)
	touch(query("* id:'rl_zero'"))
	sleep(1)
	touch(query("* id:'rl_five'"))
	sleep(1)
	touch(query("* id:'rl_nine'"))
end

Then /^User should see typed number$/ do
	waitForElementPresent("* id:'edttxt_phone_number'")
	check_element_exists("* id:'edttxt_phone_number' text:'+40 731 793 059'")
end

When /^I type a Invalid phone number$/ do
	waitForElementPresent("* id:'rl_seven'")
	touch(query("* id:'rl_seven'"))
	sleep(1)
	touch(query("* id:'rl_three'"))
	sleep(1)
	touch(query("* id:'rl_one'"))
	sleep(1)
	touch(query("* id:'rl_seven'"))
	sleep(1)
	touch(query("* id:'rl_nine'"))
	sleep(1)
	touch(query("* id:'rl_three'"))
	sleep(1)
	touch(query("* id:'rl_zero'"))
	sleep(1)
	touch(query("* id:'rl_five'"))
end

When /^I tap on call button on dial pad$/ do
	waitForElementPresent("* id:'btn_call'")
	touch(query("* id:'btn_call'"))
end

Then /^User should see message for Invalid number$/ do
	waitForElementPresent("* id:'dialog_general_message'")
	check_element_exists("* id:'dialog_general_message' text:'Phone number is invalid'")
end

When /^I type a Invalid phone number with special characters$/ do
	waitForElementPresent("* id:'rl_seven'")
	touch(query("* id:'rl_seven'"))
	sleep(1)
	touch(query("* id:'rl_three'"))
	sleep(1)
	touch(query("* id:'rl_one'"))
	sleep(1)
	touch(query("* id:'rl_seven'"))
	sleep(1)
	touch(query("* id:'rl_nine'"))
	sleep(1)
	touch(query("* id:'rl_diez'"))
	sleep(1)
	touch(query("* id:'rl_zero'"))
	sleep(1)
	touch(query("* id:'rl_five'"))
	sleep(1)
	touch(query("* id:'rl_five'"))
end

When /^I tap on Ok button on Invalid number message$/ do
	waitForElementPresent("* id:'first_button_dialog'")
	touch(query("* id:'first_button_dialog'"))
end

When /^I am in the dial pad from activity notification screen$/ do
	step "I am tap on dial pad button"
end

Then /^the call should be established from dial pad$/ do
	sleep(1)
	waitForElementPresent("* id:'call_end_call_button'")
	check_element_exists("* id:'call_end_call_button'")
	touch(query("* id:'call_end_call_button'"))
end

When /^I cancel the call$/ do
	sleep(1)
	waitForElementPresent("* id:'call_end_call_button'")
	touch(query("* id:'call_end_call_button'"))
end

When /^I am tap on dial pad button$/ do
	sleep(5)
	waitForElementPresent("* id:'dialpad_Button'")
	touch(query("* id:'dialpad_Button'"))
end

When /^I am in the dial pad from contacts screen$/ do
	step "I go to \"Contacts\" screen"
	step "I am tap on dial pad button"
end

When /^I tap on backspace button$/ do
	sleep(2)
	waitForElementPresent("* id:'btn_backspace'")
	touch(query("* id:'btn_backspace'"))
end

Then /^User should see that one number is deleted$/ do
	waitForElementPresent("* id:'edttxt_phone_number'")
	check_element_exists("* id:'edttxt_phone_number' text:'+40 731 793 05'")
end

When /^I type a valid phone number for the user$/ do
	waitForElementPresent("* id:'edttxt_phone_number'")
	query("* id:'edttxt_phone_number'",{:setText => '+91 8802830569'})
end

Then /^I should NOT see the call quality feedback popup$/ do
	sleep(5)
	waitForElementPresent("* id:'edttxt_phone_number'")
	check_element_does_not_exist("* id:'call_feedback_dialog_title'")
end