@SingleChat
Feature: Single User Chat feature

	Scenario: User opens the Chat screen from Roster and taps the Back button
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I press the back button
		Then I should see the My Contacts list
		
	Scenario: User taps the + button to access the More menu
	    Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		Then I should see the Call button
		And I should see the Video button		
		And I should see the Camera button
		And I should see the Gallery button
		And I should see the Send Location button
		
	Scenario: User closes the More menu using the X button
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		Then I should see the Call button
		And I press the "X" button at Chat screen
		And I should not see the Call button

	Scenario: User opens the Emoticon picker
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		And I press the Emoticon icon
		Then I should see the emoticons, emoji picker	
		
	Scenario: User sends emoticons
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I press the Emoticon icon
		And I select an emoticon
		And I tap "Send" button
		Then I should see that emoticon in the chat screen	
	
	Scenario: User opens the contact profile screen from the Chat screen
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"		
		When I press the more options
		And I press the View Profile
		Then I should see that contacts profile screen
	
	Scenario: User opens the contact profile screen from the Chat screen and taps the Back button
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"		
		When I press the more options
		And I press the View Profile
		Then I should see that contacts profile screen		
		And I press the back button from contact
		Then I should see the Chat screen
	
	Scenario: User receives a message while offline
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I write a message
		And I tap "Send" button
		And I am signed out
		Given I am logged in with "pl.automation5" account
		When I go to "Contacts" screen
		And I tap on "pl.automation1" friend
		Then the message should be displayed in the chat screen

	Scenario: User tries to send a blank message
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I select the text field
		And I press Space button
		Then the Send button should be disabled
		And I should not see a new message appear in the chat screen.
		
	Scenario: User sends a long text message
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I write a long message
		And I tap "Send" button
		Then I should see my long chat message in the chat screen
		
	Scenario: User sends a photo file from Gallery option
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on the Gallery button
		And I tap on the Photos button
		And I Select file from gallery
		And I send file from gallery
		Then the photo file should be displayed in the chat screen
	
	Scenario: User sends a video file from Gallery option
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on the Gallery button
		And I tap on the Videos button
		And I Select file from gallery
		And I send file from gallery
		Then the video file should be displayed in the chat screen
		