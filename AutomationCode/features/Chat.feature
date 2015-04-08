@chat
Feature: Chat feature
So that I can communicate using WowApp,
As a WowApp user,
I want to chat with my friends

Scenario: Single user chat
	Given I am logged in with "pl.automation1" account 
	And I am in chat window with "pl.automation5"
	When I write a message
	And I tap "Send" button
	Then the message should be displayed in the chat screen
	And I should see the check mark for successful sending

@a	
Scenario: Group chat
	Given I am logged in with "pl.automation1" account
	When I go to "Contacts" screen
	And I tap on "group 1" group
	And I write a message
	And I tap "Send" button
	Then the message should be displayed in the chat screen
	And I should see the check mark for successful sending

Scenario: Group chat
	Given I am logged in with "pl.automation1" account
	When I am in the "group 1" chat window
	And I write "hello" message
	And "pl.automation5" writes "hi, how are you"
	And I write "I am fine, thanks" message
	And "pl.automation4" writes "hi guys, whatsup?"
	Then all messages should be displayed in the chat screen
	And I should see the check mark for successful sending and receiving for the last message