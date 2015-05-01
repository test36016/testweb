@smoke_test
Feature: iOS Smoke Test

#
#
# Please enable No Reset option for Appium before executing scripts
#
# !!!!! Set the real device to receive SMS as alerts !!!!!
#
#  !!! Check hooks.rb for the Before/After hooks
#

	@1 @firstScenario
	Scenario: User tries to log in with invalid credentials
		Given I am in the login screen on the "first" device
		When I type my username "pl.ios.smoke" and password "wrongpass"
		And I click the Sign In button
		Then I should be warned that the credentials are invalid
	
	@2
	Scenario: User logs in with valid credentials
		Given I am in the login screen on the "first" device
		When I type my username "pl.ios.smoke" and password "automatizare"
		And I click the Sign In button
		And I validate my account with "0732714880"
		Then I should see the Chats screen

	@3
	Scenario: User verifies that all types of entries are correctly created in Chats menu
		When I generate all possible chats events
		Then the events should be displayed in the Chats screen
		
	@4 
	Scenario: Generating Chats entries
		When I generate activity entries
		Then these entries can be loaded from server next time	

	@5
	Scenario: User is able to retrieve more activities from server
		When I swipe up
		Then more entries should be loaded from the server	

	@6
	Scenario: User is able to delete entries from Chats
		When I delete the entries from Chats
		Then the entries should not be displayed anymore
	
	@7
	Scenario: User verifies that all types of entries are correctly created in the chat screen
		When I open a chat screen
		And I generate all possible chat events
		Then the events should be displayed in the chat screen
	
	@8
	Scenario: User sends a video from camera in a single chat
		When I open a chat screen
		And I send a video from camera
		Then the events should be displayed in the chat screen
	
	@9
	Scenario: User verifies that all types of entries are correctly created the group chat screen
		When I open a group chat screen
		And I generate all possible group chat events
		Then the events should be displayed in the group chat screen
		
	@10 
	Scenario: User sends a video from camera in a group chat
		When I open a group chat screen
		And I send a video from camera
		Then the events should be displayed in the group chat screen
	
	@11
	Scenario: User checks that the Contacts screen displays the First/Last Name for his friends
		When I click the Contacts button
		Then I should see the First and Last Name for my friends
	
	@12
	Scenario: User searches for a friend in Contacts
		When I click the Contacts button
		And I search my contacts list for "Auto Cont5"
		Then "Auto Cont5" should be displayed
	
	@13
	Scenario: User checks the profile info for a friend
		When I click the Contacts button
		And I open the profile screen for "Auto Cont10"
		Then I should see my friend's profile info
	
	
	@14
	Scenario: User searches for a friend in WowApp
		When I click the Contacts button
		And I search for "pl.doya2" on WowApp
		Then "pl.doya2" should be displayed in the search results
	
	@15
	Scenario: User checks the public profile info for pl.doya2	
		When I click the Contacts button
		And I search for "pl.doya2" on WowApp
		And I select "pl.doya2" from the search results
		And I select to view the profile
		Then I should see "pl.doya2"'s public information
	
	@16
	Scenario: User checks the public profile info for pl.doya3	
		When I click the Contacts button
		And I search for "pl.doya3" on WowApp
		And I select "pl.doya3" from the search results
		And I select to view the profile
		Then I should see "pl.doya3"'s public information
	
	@17
	Scenario: User checks the public profile info for a pending friend
		When I click the Contacts button
		And I search my contacts list for "doya patru"
		And I select "doya patru" from the roster search results
		Then I should see "pl.doya4"'s public information
	
	@18
	Scenario: User saves a phone number to his contacts list
		When I click the Contacts button
		And I save "40777123456" in my contacts list
		Then I should see "+40 777 123 456" as a contact
	
	
	@19
	Scenario: User checks the Keypad screen	
		When I click the Keypad button
		Then the Keypad screen should be displayed
	
	@20 		
    Scenario: User checks that the country code changes when typing a phone number
    	When I click the Keypad button
		And I delete the default country code
		And I type a Romanian phone number
		Then I should see the "RO" country flag
		
	@21
    Scenario: User checks that he can save a phone number in Contacts from Keypad
    	When I type a Romanian phone number in Keypad
    	And I save the number in my Contacts list
    	Then I should see the number in my Contacts list

	@22
    Scenario: User checks that he can add a phone number to a contact from Keypad	
    	When I type a Romanian phone number in Keypad
    	And I save the number in "Doya1 P1" profile
    	Then I should see the number in "Doya1 P1" profile screen

	@23
	Scenario: User sends feedback
		Given I am in the Send Feedback screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		And I tap the Ok button in the feedback confirmation message
		Then I should see the Menu screen
	
	@24
	Scenario: User reports a problem
		Given I am in the Report a Problem screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		And I tap the Ok button in the report confirmation message
		Then I should see the Menu screen	
		
	@25
	Scenario: User opens the My Wow screen
		When I go to Menu screen
		And I tap the My Wow button
		Then I should see the My Wow screen	
	
	@26 @lastScenario
	Scenario: User checks his profile info
		When I go to Menu screen
		And I open my profile screen
		Then I should see my profile info	
		