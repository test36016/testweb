@AddFriend
Feature: Add Friend

@WithoutAlert
Scenario: User sees search option by selecting the "Add Contact" option
		Given I am logged in with "pl.ios.automation4" account 
		When I go to Contacts screen
		And I tap on Add Contact option
		Then the Search on WowApp option is displayed

@WithoutAlert
Scenario: User searches by selecting the "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		Then User should see searched user

@WithoutAlert
Scenario: User searches by selecting the "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on the clear text button on the search field
		Then text should be cleared from search field

@WithoutAlert
Scenario: User sees search field by selecting the Search option in My Contact List
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		Then User should see search option on My Contact List

@WithoutAlert		
Scenario: User searches by selecting the Search option in My Contact List
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I enter "Automation One" into Search field in My Contact List
		Then User should see searched user in My Contact List

@WithoutAlert		
Scenario: User searches by selecting the Search option in My Contact List
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I tap on cancel button
		Then Search option should not be displayed 

@WithoutAlert
Scenario: User searches an user by First name from "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin" on Search field
		And I tap on search icon
		Then User should see searched user

@WithoutAlert
Scenario: User searches an user by Last name from "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Chak" on Search field
		And I tap on search icon
		Then User should see searched user
		
@WithoutAlert
Scenario: User searches an user by YouWowMe ID from "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "pl.atin.chak" on Search field
		And I tap on search icon
		Then User should see searched user

@WithoutAlert
Scenario: User see searched user profile from "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		And I tap on searched user
		Then User should see searched user profile

@WithoutAlert
Scenario: User see searched user full profile by selecting View Full Profile from "Add Contact" option
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		And I tap on searched user
		And I tap on View Full Profile
		Then User should see searched user full profile

@WithoutAlert
Scenario: User searches an user that is not available in database
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Taushik khan" on Search field
		And I tap on search icon
		Then User should see No results
		
@WithoutAlert	
Scenario: User sees Contact screen from Find People
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I tap on back button
		Then User should see Contact screen

@WithoutAlert		
Scenario: User searches a Friend that is not present in the My Contact list
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I enter "Atin" into Search field in My Contact List
		Then User should see search on wow app option

@WithoutAlert		
Scenario: User sees Find People from search on wow app option
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I enter "Atin" into Search field in My Contact List
		And I tap on search on wow app option
		Then User should see Find People screen 

@WithoutAlert
Scenario: User searches a friend by YouWowMe ID from My Contact list
		Given I am on Contacts screen
		When I tap on search option on My Contact List		
		And I enter "pl.ios.automation1" into Search field in My Contact List
		Then User should see searched YouWowMe ID user in My Contact List

@WithoutAlert		
Scenario: User searches a friend by First name from My Contact list
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I enter "Automation" into Search field in My Contact List
		Then User should see searched user in My Contact List

@WithoutAlert
Scenario: User searches a friend by Last name from My Contact list
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I enter "One" into Search field in My Contact List
		Then User should see searched user in My Contact List

@WithoutAlert
Scenario: User sees chat screen after searching a friend from My Contact list
		Given I am on Contacts screen
		When I tap on search option on My Contact List
		And I enter "Automation One" into Search field in My Contact List
		And I tap on the searched friend
		Then User should see chat screen of the friend

@WithoutAlert
Scenario: User searches an user by first name that is not available in database
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Taushik" on Search field
		And I tap on search icon
		Then User should see No results

@WithoutAlert
Scenario: User searches an user by Last name that is not available in database
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Khan" on Search field
		And I tap on search icon
		Then User should see No results

@WithoutAlert
Scenario: User searches an user by Invalid YouWowMe ID.
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "@#/" on Search field
		And I tap on search icon
		Then User should see No results

@WithoutAlert
Scenario: User is able to modify the default message while sending a friend request
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "Atin Chak" on Search field
		And I tap on search icon
		And I tap on searched user
		And I modify the default message
		Then User should see change message

@WithoutAlert
Scenario: User taps on Send Invite option from Add Contact
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on send Invite option
		Then User should see Send Invite screen

@WithoutAlert
Scenario: User taps on Save Telephone number option from Add Contact
		Given I am on Contacts screen
		When I tap on Add Contact option
		And I tap on save telephone number option
		Then User should see Save Telephone number screen

@WithAlert
Scenario: User receives a friend request from his friend
		Given I am logged in with "pl.ios.automation6" account on second device
		When I see pending friend requests
		And I select Second device
		And I click on contact icon
		Then User should receive friend request
		
@WithAlert
Scenario: User sends a friend request to his friend
		Given I have declined previous friend request
		When I am on Contacts screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "pl.ios.automation6" on Search field
		And I tap on search icon
		And I tap on searched user
		And I tap on the Send Contact Request
		Then I should see request sent message

@WithAlert
Scenario: User sends a friend request to his friend from profile
		Given I have declined previous friend request
		When I am on Contacts screen
		And I tap on Add Contact option
		And I tap on Search on WowApp option
		And I enter "pl.ios.automation6" on Search field
		And I tap on search icon
		And I tap on searched user
		And I tap view full profile on searched user 
		And I tap on the Send Contact Request on profile
		Then I should see request sent message

@WithAlert
Scenario: User declines a friend request without blocking him
		Given I have pending friend requests
		When I select Second device
		And I click on contact icon
		And I declined a friend request without blocking him
		Then friend request should be declined

@WithAlert
Scenario: User sees Accept and Decline buttons on receive friend request
		Given I have pending friend requests
		When I select Second device
		And I click on contact icon
		And I tap on friend request
		Then User should see Accept and Decline buttons



