@create_group_chat
Feature: Create Group Chat



@button
Scenario: The create group button is present in Chats and can be clicked 	
	Given I am logged in
	When I look in the top-right corner of the screen
	Then the Create Group button should be present
	And the "Create Group" button should be clickable

@screen	
Scenario: The user can access the Create Group screen
	Given I am in "Chats" screen
	When I tap the "Create Group" button
	Then I should be in the "Create Group" screen
	
@screen_elements
Scenario: All interactive elements are present in the Create Group screen
	Given I am in Create Group screen
	When I look at the screen
	Then all interactive elements are present

@search_participants
Scenario: As a user, I should be able to search for contacts during the create group-chat process
	Given I am in Create Group screen
	When I tap the "Enter contact name" field
	And I write "auto" text
	Then I should see the search results
	
@local_search
Scenario: As a user, I should be able to search for contacts by tapping the "+" button
	Given I am in Create Group screen
	When I tap the + button
	And I write "marius"
	Then I should see all results that contains "marius"
	
@gc1
Scenario: The user can create a group chat with two participants
	Given I am in Create Group screen
	When I search for participants
	And I choose the participants
	And I tap the Done button twice
	Then I should be in the Group Chat screen
	And I should see the proper system message
	
@gc_topic
Scenario: The user can add a topic to the group chat when creating it
	Given I am in Create Group screen
	When I search for participants
	And I choose the participants
	And I tap the Done button
	And I write "topic@" in the topic field
	And I tap the Done button
	And I reach the Group Chat screen
	Then the topic should be correctly displayed on top
	
@gc_topic_chats
Scenario: The user can see the topic of the created group chat in Chats too
	Given I am in "Chats" screen
	When I look at the screen
	Then I should see the "topic@" group chat entry on top
	
@gc_from_single_chat
Scenario: The user can create a group chat from a single user chat
	Given I am in "Chats" screen
	When I enter a single user chat
	And I expand the More menu
	And I tap Add Participants button
	Then I should be in the "Create Group" screen
	And the contact from single user chat should already be a participant	
		 
@gc_participant_check
Scenario: After creating a group chat, one of the participants can see the new group event in his activity
	Given I create a group chat on one device
	When I look at the participant's device
	Then I should see the group chat in the activity
	And I should see the system message in it