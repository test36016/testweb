@SingleChat
Feature: Single User Chat feature

@WithoutAlert
	Scenario: User opens the Chat screen from Roster and taps the Back button
		Given I am logged in with "pl.ios.automation1" account 
		And I am in chat window with "pl.ios.automation2"
		When I press the back button
		Then I should see the My Contacts list

@WithoutAlert	
	Scenario: User taps the + button to access the More menu
		Given I am in chat window with "pl.ios.automation2" user
		When I tap "+" menu button
		Then I should see the Call button
		And I should see the Video button		
		And I should see the Camera button
		And I should see the Gallery button
		And I should see the Send Location button

@WithoutAlert		
	Scenario: User closes the More menu using the X button
		Given I am in chat window with "pl.ios.automation2" user
		When I tap "+" menu button
		Then I should see the Call button
		And I press the "X" button at Chat screen
		And I should not see the Call button

@WithoutAlert
	Scenario: User opens the Emoticon picker
		Given I am in chat window with "pl.ios.automation2" user
		And I press the Emoticon icon
		Then I should see the emoticons, emoji picker

@WithoutAlert			
	Scenario: User sends emoticons
		Given I am in chat window with "pl.ios.automation2" user
		When I press the Emoticon icon
		And I select an emoticon
		And I tap "Send" button
		Then I should see that emoticon in the chat screen	

@WithoutAlert				
	Scenario: User opens the contact profile screen from the Chat screen
		Given I am in chat window with "pl.ios.automation2" user
		When I press the Contact option
		And I press the View Profile
		Then I should see that contacts profile screen

@WithoutAlert
	Scenario: User opens the contact profile screen from the Chat screen and taps the Back button
		Given I am in chat window with "pl.ios.automation2" user
		When I press the Contact option
		And I press the View Profile
		Then I should see that contacts profile screen		
		When I tap on back button
		Then I should see the Chat screen

@WithoutAlert
	
Scenario:User send a Photo from user profile

		Given I am in chat window with "pl.ios.automation2" user		
		When I press the Contact option
		And I press the View Profile
		And I press more button on profile
		And I tap on the Gallery button from user profile
		And I tap on the Photos button
		And I Select file from gallery
		And I send file from gallery
		Then the file should be displayed in the chat screen

@WithoutAlert 
	Scenario:User send a Video from user profile

		Given I am in chat window with "pl.ios.automation2" user		
		When I press the Contact option
		And I press the View Profile
		And I press more button on profile
		And I tap on the Gallery button from user profile
		And I tap on the video button
		And I Select video file from gallery
		And I send video file from gallery
		Then the file should be displayed in the chat screen

@WithoutAlert
	Scenario:User shares Contact from user profile

		Given I am in chat window with "pl.ios.automation2" user
		When I press the Contact option
		And I press the View Profile
		And I press more button on profile
		And I tap on the Share Contact button from user profile
		And I select on the Contact
		Then the shared contact should be displayed in the chat screen

@WithoutAlert
	Scenario:User shares location from user profile

		Given I am in chat window with "pl.ios.automation2" user
		When I press the Contact option
		And I press the View Profile
		And I press more button on profile
		And I tap on the Share location button from user profile
		Then the shared location should be displayed in the chat screen