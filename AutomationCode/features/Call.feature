@Call
Feature: Call feature
So that I can communicate using WowApp,
As a WowApp user,
I want to call my friends
	
	Scenario: Single call for first usage of the app
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		When I go to "Contacts" screen
		And I tap on "pl.automation5" friend
		And I tap "+" menu button
		And I tap on "Audio Call" button
		And I tap on "Free Call" button
		#And I tap on "OK" access to "microphone" dialog
		#And I tap on "OK" access to "camera" dialog
		And I tap on "Hangup" button
		Then the call should not be established
		And the "Outgoing call" message should be displayed in the chat screen
		#And I should see the check mark for successful sending
@b
#Use an After "@hangup_call" hook for closing the call after the scenario is ended
@hangup_call
	Scenario: Single call is answered
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		And I go to "Contacts" screen
		And I tap on "pl.automation5" friend
		And I tap "+" menu button
		And I tap on "Audio Call" button
		And I tap on "Free Call" button
		And "pl.automation5" answers my call with "Audio"
		Then the call should be established
		And the call timer should be displayed
	
	Scenario: Single call is declined
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		When I go to "Contacts" screen
		And I tap on "pl.automation5" friend
		And I tap "+" menu button
		And I tap on "Audio Call" button
		And I tap on "Free Call" button
		And "pl.automation5" taps "Hangup" button
		And I Select First device
		Then I should see "Call declined" popup	
		And the call should Not be established

	Scenario: User sees Audio Call option on contacts profile
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"		
		When I press the more options
		And I press the View Profile
		Then I should see that Audio Call option on contacts profile

	Scenario: Single call is answered from contacts profile
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		And I am in chat window with "pl.automation5"		
		When I press the more options
		And I press the View Profile
		And I tap on Audio Call button on contacts profile
		And I tap on "Free Call" button
		And "pl.automation5" answers my call with "Audio"
		Then the call should be established
		And the call timer should be displayed

	Scenario: Single call is declined from contacts profile
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		And I am in chat window with "pl.automation5"		
		When I press the more options
		And I press the View Profile
		And I tap on Audio Call button on contacts profile
		And I tap on "Free Call" button
		And "pl.automation5" taps "Hangup" button
		And I Select First device
		Then I should see "Call declined" popup	
		And the call should Not be established

	Scenario: Single call is answered from top menu on chat screen
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		And I am in chat window with "pl.automation5"
		And I tap on call icon at the top on the screen
		And I tap on "Free Call" button
		And "pl.automation5" answers my call with "Audio"
		Then the call should be established
		And the call timer should be displayed

	Scenario: Single call is declined from top menu on chat screen
		Given I am logged in with "pl.automation1" account
		And I am logged in with "pl.automation5" account on second device
		When I Select First device
		And I am in chat window with "pl.automation5"
		And I tap on call icon at the top on the screen
		And I tap on "Free Call" button
		And "pl.automation5" taps "Hangup" button
		And I Select First device
		Then I should see "Call declined" popup	
		And the call should Not be established