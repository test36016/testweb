@AddFriend
Feature: Add Friend

	Scenario: User sees search option by selecting the "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		Then the Search on WowApp option is displayed

	Scenario: User searches by selecting the "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		Then User should see searched user

	Scenario: User searches without typing in any field
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option		
		And I tap on search icon
		Then User should receives an error message that search filed cannot be empty
		
	Scenario: User sees search field by selecting the Search option in My Contact List
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		Then User should see search option on My Contact List
		
	Scenario: User searches by selecting the Search option in My Contact List
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "test2 automation" into Search field in My Contact List
		Then User should see searched user in My Contact List

	Scenario: User searches an user by First name from "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin" on Search field
		And I tap on search icon
		Then User should see searched user

	Scenario: User searches an user by Last name from "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Chak" on Search field
		And I tap on search icon
		Then User should see searched user

	Scenario: User searches an user by YouWowMe ID from "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "pl.atin.chak" on Search field
		And I tap on search icon
		Then User should see searched user

	Scenario: User see searched user profile from "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		And I tap on searched user
		Then User should see searched user profile

	Scenario: User see searched user full profile by selecting View Full Profile from "Add Contact" option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		And I tap on searched user
		And I tap on View Full Profile
		Then User should see searched user full profile

	Scenario: User searches an user that is not available in database
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Taushik khan" on Search field
		And I tap on search icon
		Then User should see message No results
	
	Scenario: User sees Contact screen from Find People
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I tap back button from Find People screen
		Then User should see Contact screen
	
	Scenario: User searches a Friend that is not present in the My Contact list
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "Atin" into Search field in My Contact List
		Then User should see search on wow app option
		
	Scenario: User sees Find People from search on wow app option
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "Atin" into Search field in My Contact List
		And I tap on search on wow app option
		Then User should see Find People screen 

	Scenario: User searches a friend by YouWowMe ID from My Contact list
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "pl.automation2" into Search field in My Contact List
		Then User should see searched user in My Contact List

	Scenario: User searches a friend by First name from My Contact list
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "test2" into Search field in My Contact List
		Then User should see searched user in My Contact List

	Scenario: User searches a friend by Last name from My Contact list
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "automation" into Search field in My Contact List
		Then User should see searched user in My Contact List

	Scenario: User sees chat screen after searching a friend from My Contact list
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on search option on My Contact List
		And I enter "test2 automation" into Search field in My Contact List
		And I tap on the searched friend
		Then User should see chat screen of the friend

	Scenario: User is able to modify the default message while sending a friend request
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		And I tap on searched user
		And I modify the default message
		Then User should see change message

	Scenario: User declines a friend request without blocking him
		Given I have pending friend requests
		And I logged in with "pl.automation7" account
		When I go to "Contacts" screen
		And I declined a friend request without blocking him
		Then friend request should be declined
	
	Scenario: User receives a friend request from his friend
		Given I have pending friend requests
		And I logged in with "pl.automation7" account
		When I go to "Contacts" screen
		Then User should receive friend request

	Scenario: User searches an user by first name that is not available in database
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Taushik" on Search field
		And I tap on search icon
		Then User should see message No results

	Scenario: User searches an user by Last name that is not available in database
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Khan" on Search field
		And I tap on search icon
		Then User should see message No results
	
	Scenario: User searches an user by Invalid YouWowMe ID.
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "@#/" on Search field
		And I tap on search icon
		Then User should see message No results
		
	Scenario: User sees full profile from receive friend request
		Given I have pending friend requests
		And I logged in with "pl.automation7" account
		When I go to "Contacts" screen
		And I tap on friend request
		And I tap on View Full Profile on friend request
		Then User should see full profile from receive friend request

	Scenario: User sees Accept and Decline buttons on receive friend request
		Given I have pending friend requests
		And I logged in with "pl.automation7" account
		When I go to "Contacts" screen
		And I tap on friend request
		Then User should see Accept and Decline buttons

	Scenario: User taps on friend request and decline it without blocking him
		Given I have pending friend requests
		And I logged in with "pl.automation7" account
		When I go to "Contacts" screen
		And I tap on friend request
		And I declined a friend request without blocking him after tapping it
		And I go to "Contacts" screen
		Then friend request should be declined
	
	Scenario: User sees Send Invite and Save Telephone number options from Add Contact
		Given I am logged in with "pl.automation1" account
		When I go to "Contacts" screen
		And I tap on Add Contact option
		Then User should see Send Invite and Save Telephone number options from Add Contact

	Scenario: User accepts a friend request
		Given I have sent a friend requests
		And I log in with "pl.automation8" account
		When I go to "Contacts" screen
		And I accept a friend request
		Then User should be in My contact list

	Scenario: User taps on friend request and accept it
		Given I have sent a friend requests
		And I log in with "pl.automation8" account
		When I go to "Contacts" screen
		And I tap on friend request
		And I accept a friend request after tapping it
		And I go to "Contacts" screen
		Then User should be in My contact list

	Scenario: User decline a friend request without blocking from friend profile
		Given I have pending friend requests
		And I logged in with "pl.automation7" account
		When I go to "Contacts" screen
		And I tap on friend request
		And I tap on View Full Profile on friend request
		And I declined a friend request without blocking him after tapping it
		And I go to "Contacts" screen
		Then friend request should be declined
		
	Scenario: User declines a friend request with blocking him
		Given I have pending friend requests without blocking
		And I have logged in with "pl.automation6" account
		When I go to "Contacts" screen
		And I sent a friend request to pl.automation8
		Given I log in with "pl.automation8" account
		When I go to "Contacts" screen
		And I declined a friend request with blocking him
		Then friend request should be declined

	Scenario: User taps on friend request and decline it with blocking him
		Given I have pending friend requests without blocking
		And I have logged in with "pl.automation6" account
		When I go to "Contacts" screen
		And I sent a friend request to pl.automation8
		Given I log in with "pl.automation8" account
		When I go to "Contacts" screen
		And I tap on friend request
		And I declined a friend request with blocking him after tapping it
		When I go to "Contacts" screen
		Then friend request should be declined

	Scenario: User decline a friend request with blocking from friend profile
		Given I have pending friend requests without blocking
		And I have logged in with "pl.automation6" account
		When I go to "Contacts" screen
		And I sent a friend request to pl.automation8
		Given I log in with "pl.automation8" account
		When I go to "Contacts" screen
		And I tap on friend request
		And I tap on View Full Profile on friend request
		And I declined a friend request with blocking him after tapping it
		When I go to "Contacts" screen
		Then friend request should be declined
		
	Scenario: User sees blocked friend in blocked list after decline a friend request with blocking
		Given I have pending friend requests without blocking
		And I have logged in with "pl.automation6" account
		When I go to "Contacts" screen
		And I sent a friend request to pl.automation8
		Given I log in with "pl.automation8" account
		When I go to "Contacts" screen
		And I declined a friend request with blocking him
		Then User should see blocked friend in blocked list