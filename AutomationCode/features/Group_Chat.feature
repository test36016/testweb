@Group_chat
Feature: Group Chat feature

	Scenario: User sends a message in Group chat
		Given I am logged in with "pl.automation1" account
		And I am in chat window with "group 1" group
		When I write a message
		And I tap "Send" button
		Then the message should be displayed in the chat screen
 
	Scenario: User sends a long message in Group chat
		Given I am logged in with "pl.automation1" account
		And I am in chat window with "group 1" group
		When I write a long message
		And I tap "Send" button
		Then the message should be displayed in the chat screen
	
	Scenario: User opens the Emoticon picker
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		And I press the Emoticon icon
		Then I should see the emoticons, emoji picker	
	
	Scenario: User sends emoticons in Group chat
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I press the Emoticon icon
		And I select an emoticon
		And I tap "Send" button
		Then I should see that emoticon in the chat screen
		
	Scenario: User see View participants in Group chat
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I press the more options
		And I press the View participants
		Then I should see View participants in Group chat

	Scenario: User taps the + button to access the More menu
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I tap "+" menu button
		Then I should see the Gallery button
		And I should see the Send Location button
			
	Scenario: User closes the More menu using the X button
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I tap "+" menu button
		Then I should see the Gallery button
		And I press the "X" button at Chat screen
		And I should not see the Gallery button		
		
	Scenario: User sends a photo file from Gallery option in Group chat
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I tap "+" menu button
		And I tap on the Gallery button
		And I tap on the Photos button
		And I Select file from gallery
		And I send file from gallery
		Then the photo file should be displayed in the group chat screen

	Scenario: User sends Share Contact from the Chat screen in Group chat
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I tap "+" menu button
		And I tap on Share Contact option
		And I select contact name
		Then I should see the send contact in the group chat screen

	Scenario: User sends location with GPS enabled in Group chat
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I tap "+" menu button
		And I tap on share location option
		Then I should see the Send Location in chat screen
	
	Scenario: User sends a video file from Gallery option in Group chat
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "group 1" group
		When I tap "+" menu button
		And I tap on the Gallery button
		And I tap on the Videos button
		And I Select file from gallery
		And I send file from gallery
		Then the video file should be displayed in the group chat screen