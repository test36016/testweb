When /^I press the Send General Feedback$/ do
	waitForElementPresent("* id:'dialog_button_choice_choice'") 	
	touch(query("* id:'dialog_button_choice_choice'"))
end

Then /^I should see the Send Feedback screen$/ do
	waitForElementPresent("* id:'summaryEditText'") 
	check_element_exists("* id:'summaryEditText'") 
	check_element_exists("* id:'descriptionEditText'") 		
	check_element_exists("* id:'sendFeedbackButton'") 	
end

When /^I tap Send Feedback button$/ do
	waitForElementPresent("* id:'sendFeedbackButton'") 	
	touch(query("* id:'sendFeedbackButton'"))
end

Then /^User should see the message that field is empty$/ do
	waitForElementPresent("* id:'message'")
	check_element_exists("* id:'message'")
end

When /^I enter summary$/ do
	waitForElementPresent("* id:'summaryEditText'")
	query("* id:'summaryEditText'",{:setText => "Text for Summary"})
end

When /^I enter description$/ do
	waitForElementPresent("* id:'descriptionEditText'")
	query("* id:'descriptionEditText'",{:setText => "Text for Description"})
end

Then /^User should see message that feedback was sent successfully$/ do
	sleep(2)
	waitForElementPresent("* id:'dialog_general_message'")
	check_element_exists("* id:'dialog_general_message'")
end

When /^I tap on Ok button$/ do
	sleep(2)
	waitForElementPresent("* id:'first_button_dialog'") 	
	touch(query("* id:'first_button_dialog'"))
end

When /^I tap send button$/ do
	waitForElementPresent("* id:'sendBugReportButton'") 	
	touch(query("* id:'sendBugReportButton'"))
end

Then /^User should see the Alert message that bug report was not sent$/ do
	sleep(2)
	waitForElementPresent("* id:'dialog_general_message' text:'The bug report was not sent'")
	check_element_exists("* id:'dialog_general_message' text:'The bug report was not sent'")
end

Then /^User should see message that bug report was sent successfully$/ do
	sleep(2)
	waitForElementPresent("* id:'dialog_general_message'")
	check_element_exists("* id:'dialog_general_message'")
end