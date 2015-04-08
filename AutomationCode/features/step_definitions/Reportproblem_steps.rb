When /^I press Report a problem$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice' text:'Report a problem'")
	touch(query("* id:'dialog_button_choice_choice' text:'Report a problem'"))
end

Then /^I should see Report a problem screen$/ do
	waitForElementPresent("* id:'topbar_gen_backButton'") 	
	check_element_exists("* id:'topbar_gen_backButton'") 
	check_element_exists("* id:'textView1' text:'SUMMARY'") 		
	check_element_exists("* id:'textView3' text:'DESCRIPTION'")
	check_element_exists("* id:'sendBugReportButton'") 	
end

When /^I press the back button on Report a problem screen$/ do
	waitForElementPresent("* id:'topbar_gen_backButton'") 
	touch(query("* id:'topbar_gen_backButton'"))
end