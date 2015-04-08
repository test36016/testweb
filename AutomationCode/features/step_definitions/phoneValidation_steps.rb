require 'calabash-android/calabash_steps'

Then /^I should see Phone number validation screen$/ do
	waitForElementPresent("* id:'phone_number_validation_topbar_title'") 	
	check_element_exists("* id:'phone_number_validation_topbar_title'text:'Phone Validation'")
	waitForElementPresent("* id:'phone_number_validation_country_picker_button'") 		
	check_element_exists("* id:'phone_number_validation_country_picker_button'")   
	check_element_exists("* id:'phone_number_validation_number_edittext'")   
 	check_element_exists("* id:'phone_number_validation_send_sms_button'") 
end