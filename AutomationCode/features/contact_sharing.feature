@contact_sharing
Feature: contact sharing		

	Scenario: User sees the Send contact option in the Contact Profile
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I press the more options
		And I press the View Profile
		And I click on More option on contact profile
		Then I should see the Send contact button in contact profile

	Scenario: User sends the Send contact from the Contact Profile
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I press the more options
		And I press the View Profile
		And I click on More option on contact profile
		And I click on Send contact on contact profile
		And I select contact name
		Then I should see the send contact in chat screen
		
	Scenario: User sees the Share Contact option in the Chat screen
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		Then I should see the Share Contact button
		
	Scenario: User sends Share Contact from the Chat screen
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on Share Contact option
		And I select contact name
		Then I should see the send contact in chat screen
		
	Scenario: User opens shared contact after clicking on it
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on Share Contact option
		And I select contact name
		And I click on shared contact
		Then I should see that contacts profile screen
		
	Scenario: User shares multiple contacts in a conversation window
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on Share Contact option
		And I select contact name
		And I tap "+" menu button
		And I tap on Share Contact option
		And I select second contact name
		Then I should see the second send contact in chat screen

	Scenario: User receives contact while offline
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on Share Contact option
		And I select contact name
		And I click on shared contact
		And I am signed out
		Given I am logged in with "pl.automation5" account
		When I go to "Contacts" screen
		And I tap on "pl.automation1" friend
		Then I should see the receives contact in chat screen

#	@test	
#	Scenario: User receives a contact that is already in his roster
#		Given I am logged in with "pl.automation1" account 
#		And I am in chat window with "pl.automation5"
#		When I tap "+" menu button
#		And I tap on Share Contact option
#		And I select existing contact name
#		And I click on shared contact
#		And I am signed out
#		Given I am logged in with "pl.automation5" account
#		When I go to "Contacts" screen
#		And I tap on "pl.automation1" friend
#		Then the message Already in your list is displayed in the contact card
		
	Scenario: User opens contact profile and returns to the chat screen
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on Share Contact option
		And I select contact name
		And I click on shared contact
		Then I press the back button from contact
		And I should see the Chat screen
		