@invitation_management
Feature: Invitation management
 
	Scenario: Access Invite screen from My Profile section
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		Then I should see the invite screen
		
	Scenario: User taps on send invite icon
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button from top
		Then I should see the invite screen
	
	Scenario: Access Invite screen from Roster -> + Contact
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I click on Invite now button at my contacts
		Then I should see the invite screen
	
	Scenario: Sending Invite - No field completed
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I press the Send Invite button on Send Invite screen
		Then I should see the validation message
		
    Scenario: Sending Invite - Fill only Name field
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I fill the Name field
		And I press the Send Invite button on Send Invite screen
		Then I should see the validation message
   
	Scenario: Sending Invite - Fill only E-mail field
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I fill the Email field
		And I press the Send Invite button on Send Invite screen
		Then I should see the validation message

	Scenario: Sending Invite - Writing an Invalid Email address
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I fill the Name field
		And I fill the Invalid Email field
		And I fill the Message field
		And I press the Send Invite button on Send Invite screen
		Then I should see the validation message

	Scenario: Sending Invite - Fill only Message field
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I fill the Message field
		And I press the Send Invite button on Send Invite screen
		Then I should see the validation message

	Scenario: User is able to un-check Add this person to my contacts list check box
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I un-check the check box of Add this person
		Then Add this person check box should be unchecked

	Scenario: User enters all the information on Send Invite screen
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I fill the Name field
		And I fill the Email field
		And I fill the Message field
		Then User should see all entered information
@a		
	Scenario: Sending Invite - to an existing YouWowMe user
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		And I fill the Name field
		And I fill the existing email field
		And I fill the Message field
		And I press the Send Invite button on Send Invite screen
		Then I should see the validation message for YouWowMeUser