When(/^I tap on Add Contact option$/) do
  	waitForElementPresent("name", "nav bar add contact")
	@driver.find_element(:name, "nav bar add contact").click
end

Then(/^the Search on WowApp option is displayed$/) do
  	waitForElementPresent("name", "Search Contact on WowApp")
  	assertElementPresent(@driver.find_element(:name,"Search Contact on WowApp"))
end

When(/^I go to Contacts screen$/) do
  	if $closePopUps
        close_pop_up
  end
  	step "I click on contact icon"
end

When(/^I am on Contacts screen$/) do
  	step "I set First device"
  	step "I go to Contacts screen"
end

When(/^I tap on Search on WowApp option$/) do
  	waitForElementPresent("name", "Search Contact on WowApp")
  	@driver.find_element(:name, "Search Contact on WowApp").click
end

When(/^I enter "([^"]*)" on Search field$/) do |arg1|
	@searchUser = arg1
  	waitForElementPresent("xpath", "//UIATableView[1]/UIASearchBar[1]")
	@driver.find_element(:xpath, "//UIATableView[1]/UIASearchBar[1]").send_keys arg1
end

When(/^I tap on search icon$/) do
  	waitForElementPresent("name", "Search")
  	@driver.find_element(:name, "Search").click
end

Then(/^User should see searched user$/) do
  	waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  	text = @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").text
	assert_send([text, :include?, @searchUser])
end

When(/^I tap on the clear text button on the search field$/) do
  	waitForElementPresent("name", "Clear text")
  	@driver.find_element(:name, "Clear text").click
end

Then(/^text should be cleared from search field$/) do
  	waitForElementPresent("xpath", "//UIATableView[1]/UIASearchBar[1]")
  	text = @driver.find_element(:xpath,"//UIATableView[1]/UIASearchBar[1]").text
	assert_send([text, :include?, "Search"])
end

When(/^I tap on search option on My Contact List$/) do
  	waitForElementPresent("name", "nav bar search")
  	@driver.find_element(:name, "nav bar search").click
end

Then(/^User should see search option on My Contact List$/) do
  	waitForElementPresent("name", "Cancel")
  	assertElementPresent(@driver.find_element(:name,"Cancel"))
end

When(/^I enter "([^"]*)" into Search field in My Contact List$/) do |arg1|
  	@searchContactUser = arg1
  	waitForElementPresent("xpath", "//UIAElement[1]/UIAElement[2]/UIASearchBar[1]")
	@driver.find_element(:xpath, "//UIAElement[1]/UIAElement[2]/UIASearchBar[1]").send_keys arg1
end

Then(/^User should see searched user in My Contact List$/) do
  	waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  	text = @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").text
	puts text
	assert_send([text, :include?, @searchContactUser])
end

Then(/^Search option should not be displayed$/) do
  	waitForElementPresent("name", "nav bar add contact")
  	isElementNotPresent("name", "Cancel")
end

When(/^I tap on searched user$/) do
  waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").click
end

Then(/^User should see searched user profile$/) do
  	waitForElementPresent("name", "labelButtonSendContactRequest")
  	assertElementPresent(@driver.find_element(:name,"labelButtonSendContactRequest"))
end

When(/^I tap on View Full Profile$/) do
  waitForElementPresent("name", "labelButtonViewFullProfile")
  @driver.find_element(:name,"labelButtonViewFullProfile").click
end

Then(/^User should see searched user full profile$/) do
  waitForElementPresent("name", "Birthday")
  assertElementPresent(@driver.find_element(:name,"Birthday"))
end

Then(/^User should see No results$/) do
  waitForElementPresent("name", "labelFooter")
  assertElementPresent(@driver.find_element(:name,"labelFooter"))
end

Then(/^User should see Contact screen$/) do
  step "I should see the My Contacts list"
end

Then(/^User should see search on wow app option$/) do
  waitForElementPresent("name", "Search Contact on WowApp")
  assertElementPresent(@driver.find_element(:name,"Search Contact on WowApp"))
end

When(/^I tap on search on wow app option$/) do
  waitForElementPresent("name", "Search Contact on WowApp")
  @driver.find_element(:name,"Search Contact on WowApp").click
  step "I tap on search icon"
end

Then(/^User should see Find People screen$/) do
  waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  assertElementPresent(@driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]"))
end

Then(/^User should see searched YouWowMe ID user in My Contact List$/) do
  	waitForElementPresent("xpath", "//UIATableCell[1]/UIAStaticText[1]")
  	text = @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").text
	puts text
	assert_send([text, :include?, "Automation One"])
end

When(/^I tap on the searched friend$/) do
  waitForElementPresent("xpath", "//UIATableView[2]/UIATableCell[1]")
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell[1]").click
end

Then(/^User should see chat screen of the friend$/) do
  waitForElementPresent("name", "chatPlus")
  assertElementPresent(@driver.find_element(:name,"chatPlus"))
end

When(/^I see pending friend requests$/) do
  step "I go to Contacts screen"
  step "I declined a friend request without blocking him which I have already"
  # Switch to first device
  step "I am on Contacts screen"
  step "I tap on Add Contact option"
  step "I tap on Search on WowApp option"
  step "I enter \"pl.ios.automation6\" on Search field"
  step "I tap on search icon"
  step "I tap on searched user"
  step "I tap on the Send Contact Request"
  step "I tap on Ok button on Alert"
end

Given(/^I have pending friend requests$/) do
  step "I switch to Second device"
  step "I go to Contacts screen"
  step "I declined a friend request without blocking him which I have already"
  # Switch to first device
  step "I am on Contacts screen"
  step "I tap on Add Contact option"
  step "I tap on Search on WowApp option"
  step "I enter \"pl.ios.automation6\" on Search field"
  step "I tap on search icon"
  step "I tap on searched user"
  step "I tap on the Send Contact Request"
  step "I tap on Ok button on Alert"
end

Given(/^I have declined previous friend request$/) do
  step "I switch to Second device"
  step "I go to Contacts screen"
  step "I declined a friend request without blocking him which I have already"
end

When /^I declined a friend request without blocking him which I have already$/ do
		req = waitForElementPresent("name", "btnDecline")	
		if req ==true
			step "I declined a friend request without blocking him"
			puts "Previously request is declined"
		else
			puts "No request displays"
		end
end

When /^I declined a friend request without blocking him$/ do
	waitForElementPresent("name", "btnDecline")
	@driver.find_element(:name,"btnDecline").click
# Click on Yes for blocking
	step "I tap on No button"
	step "I tap on Ok button on Alert"
end

When /^I tap on No button$/ do
	waitForElementPresent("name", "No")
	@driver.find_element(:name,"No").click
end

When /^I tap on Ok button on Alert$/ do
	waitForElementPresent("name", "Ok")
	@driver.find_element(:name,"Ok").click
end

When /^I tap on the Send Contact Request$/ do
  waitForElementPresent("name", "labelButtonSendContactRequest")
  @driver.find_element(:name,"labelButtonSendContactRequest").click
end

Then /^User should receive friend request$/ do
  	waitForElementPresent("name", "btnDecline")
  	assertElementPresent(@driver.find_element(:name,"btnDecline"))
end

Then(/^friend request should be declined$/) do
  waitForElementPresent("name", "Contacts")
  isElementNotPresent("name", "btnDecline")
end

Then(/^I should see request sent message$/) do
  waitForElementPresent("name", "Your contact request has been sent")
  assertElementPresent(@driver.find_element(:name,"Your contact request has been sent"))
end

When(/^I modify the default message$/) do
  waitForElementPresent("name", "labelPersonalMessage")
  @driver.find_element(:name,"labelPersonalMessage").click
  waitForElementPresent("name", "textViewMessage")
  @driver.find_element(:name, "textViewMessage").clear
  @driver.find_element(:name, "textViewMessage").send_keys "Hello! Add Me"	
end

Then(/^User should see change message$/) do
  	waitForElementPresent("name", "textViewMessage")
  	text = @driver.find_element(:name,"textViewMessage").value
	puts text
	assert_send([text, :include?, "Hello! Add Me"])
end

When(/^I tap on send Invite option$/) do
  waitForElementPresent("name", "Send Invite")
  @driver.find_element(:name,"Send Invite").click
end

Then(/^User should see Send Invite screen$/) do
  waitForElementPresent("name", "Invite")
  assertElementPresent(@driver.find_element(:name,"Invite"))
end	

When(/^I tap on save telephone number option$/) do
  waitForElementPresent("name", "Save Phone Number")
  @driver.find_element(:name,"Save Phone Number").click
end

Then(/^User should see Save Telephone number screen$/) do
  waitForElementPresent("name", "Edit Profile")
  assertElementPresent(@driver.find_element(:name,"Edit Profile"))
end

When(/^I tap view full profile on searched user$/) do
  waitForElementPresent("name", "labelButtonViewFullProfile")
  @driver.find_element(:name,"labelButtonViewFullProfile").click
end

When(/^I tap on the Send Contact Request on profile$/) do
  waitForElementPresent("name", "addToContactsButton")
  @driver.find_element(:name,"addToContactsButton").click
end

When(/^I tap on friend request$/) do
  waitForElementPresent("xapth", "//UIATableCell[1]/UIAStaticText[1]")
  @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").click
end

Then(/^User should see Accept and Decline buttons$/) do
  waitForElementPresent("name", "btnAccept")
  assertElementPresent(@driver.find_element(:name,"btnAccept"))
  waitForElementPresent("name", "btnDecline")
  assertElementPresent(@driver.find_element(:name,"btnDecline"))
end