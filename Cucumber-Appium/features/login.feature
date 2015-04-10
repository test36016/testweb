@login
Feature: Login feature
So that I can chat using WowApp on mobile platform,
As a WowApp user,
I want to authenticate on my iOS device

#This scenario will be performed only for account with phone number not validated
@a
Scenario: Valid user Login for the first time
	Given I am on the login window on simulator device
	When I enter "pl.ios.automation3" in username field
	And I enter the usual password in password field
	And I click on login Button
	Then I should see Phone number validation screen
	
@b
Scenario: Login for user with validated phone number 
	Given I am on the login window on simulator device
	When I enter "pl.ios.automation2" in username field
	And I enter the usual password in password field
	And I click on login Button
	Then I should be in "Chats" Screen