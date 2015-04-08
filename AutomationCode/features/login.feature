@login
Feature: Login feature
So that I can chat using WowApp on mobile platform,
As a WowApp user,
I want to authenticate on my iOS device

#This scenario will be performed only for account with phone number not validated
@b
Scenario: Valid user Login for the first time
	Given I am on the login window
	When I enter "pl.automation3" in username field
	#When I enter "liveAccount1" in username field
	And I enter the usual password in password field
	And I click on login Button
	Then I should see Phone number validation screen
@a
Scenario: Login for user with validated phone number 
	Given I am on the login window
	When I enter "pl.automation5" in username field
	And I enter the usual password in password field
	And I click on login Button
	Then I should be in "Chats" Screen

	