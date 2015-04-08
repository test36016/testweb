Then /^I should see the invite screen$/ do
	waitForElementPresent("* id:'viewInvitesPageButton'")
	check_element_exists("* id:'firstnameEditText'") 
	check_element_exists("* id:'emailEditText'") 
	check_element_exists("* id:'messageEditText'") 
	check_element_exists("* id:'sendInviteButton'") 
	check_element_exists("* id:'viewInvitesPageButton'") 
end

When /^I press the Send Invite button from top$/ do
	waitForElementPresent("* id:'text_send_invites_top'")
	touch(query("* id:'text_send_invites_top'"))	
end
When /^I click on Invite now button at my contacts$/ do
	waitForElementPresent("* text:'Send Invite'")
	touch(query("* text:'Send Invite'"))
end

When /^I press the Send Invite button on Send Invite screen$/ do
	waitForElementPresent("* id:'sendInviteButton'")
	touch(query("* id:'sendInviteButton'"))
end

Then /^I should see the validation message$/ do
	waitForElementPresent("* id:'message'")
	check_element_exists("* id:'message'")
end

When /^I fill the Name field$/ do
	waitForElementPresent("* id:'firstnameEditText'")
	query("* id:'firstnameEditText'",{:setText => "Alex"})
end

When /^I fill the Email field$/ do
	waitForElementPresent("* id:'emailEditText'")
	query("* id:'emailEditText'",{:setText => "Alex@gmail.com"})
end

When /^I fill the Invalid Email field$/ do
	waitForElementPresent("* id:'emailEditText'")
	query("* id:'emailEditText'",{:setText => "Alex@@gmail.com"})
end

When /^I fill the existing email field$/ do
	waitForElementPresent("* id:'emailEditText'")
	query("* id:'emailEditText'",{:setText => "single@yopmail.com"})
end

When /^I fill the Message field$/ do
	waitForElementPresent("* id:'messageEditText'")
	query("* id:'messageEditText'",{:setText => "Message"})
end

When /^I un\-check the check box of Add this person$/ do
	waitForElementPresent("* id:'showInRoster'")
	touch(query("* id:'showInRoster'"))
end

Then /^Add this person check box should be unchecked$/ do
	waitForElementPresent("* id:'showInRoster'")
	check_element_exists("* id:'showInRoster' checked:false")
end

Then /^User should see all entered information$/ do
	waitForElementPresent("* id:'viewInvitesPageButton'")
	check_element_exists("* id:'messageEditText' text:'Message'")
	check_element_exists("* id:'emailEditText' text:'Alex@gmail.com'")
	check_element_exists("* id:'firstnameEditText' text:'Alex'")
end

Then /^User should see the validation message for AlreadyInvited$/ do
	waitForElementPresent("* id:'dialog_general_message'")
	check_element_exists("* id:'dialog_general_message' text:'Invitation already sent'")
end

Then /^I should see the validation message for YouWowMeUser$/ do
	waitForElementPresent("* id:'dialog_general_message'")
	check_element_exists("* id:'dialog_general_message' text:'The person you are tying to invite is already an WowApp user'")
end