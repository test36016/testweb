@groupchat
Feature: Group Chat feature

@WithoutAlert
Scenario: User sends a long message in Group chat
	Given I am logged in with "pl.ios.automation1" account
	When I go to "Contacts" screen
	And I tap on "group 1" group
	When I write a "Hello, This is a long message" message
	And I tap "Send" button
	Then the message should be sent to group 1

@WithoutAlert	
Scenario: User opens the Emoticon picker
	Given I am in group chat
	When I press the Emoticon icon
	Then I should see the emoticons, emoji picker

@WithoutAlert
Scenario: User sends emoticons in Group chat
	Given I am in group chat
	And I press the Emoticon icon	
	And I select an emoticon
	And I tap "Send" button
	Then I should see that emoticon in the group chat screen

@WithoutAlert
Scenario: Group chat for one user
	Given I am in group chat
	When I write a "Hello" message
	And I tap "Send" button
	Then second user should see message sent to group 1

@WithoutAlert
Scenario: Group chat for two user 
	Given I am in group chat
	And I write a "Hello" message
	And I tap "Send" button
	Then the message should be sent to group 1
	When "pl.ios.automation2" writes "hi, how are you"
	Then the message should be sent to group 1 from other user
	When I switch to First device
	And I am in the group 1 chat window
	And I write a "I am fine thanks" message
	And I tap "Send" button
	Then the message should be sent to group 1


@WithoutAlert		
Scenario: User sends photo in group chat 
	Given I am in group chat
	When I tap "+" menu button
	And I tap on the Gallery button in group chat
	And I tap on the Photos button
	And I Select file from gallery
	And I send file from gallery
	Then user should see the file in group chat

@WithoutAlert
Scenario: User sends video in group chat 
	Given I am in group chat
	When I tap "+" menu button
	And I tap on the Gallery button in group chat
	And I tap on the video button
	And I Select video file from gallery
	And I send video file from gallery
	Then user should see the file in group chat

@WithoutAlert

Scenario:User shares Contact in group chat
	Given I am in group chat
	When I tap "+" menu button
	And I tap on the Share Contact button in group chat
	And I select on the Contact
	Then user should see the shared contact in group chat

@WithoutAlert

Scenario:User shares location in group chat
	Given I am in group chat
	When I tap "+" menu button
	And I tap on the Share location button in group chat
	And I send the location
	Then the shared location should be displayed in the chat screen

@WithoutAlert

Scenario:User can see group info screen
	Given I am in group chat
	When I tap setting icon in group chat
	Then I should see the Group Info screen

@WithoutAlert
Scenario:Two user send emoticons in group chat 

	Given I am in group chat
	When I press the Emoticon icon
	And I select an emoticon
	And I tap "Send" button
	Then I should see that emoticon in the group chat screen
	When I switch to Second device
	And I go to "Contacts" screen
	And I tap on "group 1" group
	And Peer press the Emoticon icon
	And Peer select an emoticon
	And Peer tap "Send" button
	Then I should see that emoticon in the group chat screen

@WithoutAlert
Scenario: Group chat for three users 
	Given I am in group chat
	And I write a "Hello" message
	And I tap "Send" button
	Then the message should be sent to group 1
	When "pl.ios.automation2" writes "hi, how are you"
	Then the message should be sent to group 1 from other user
	When "pl.ios.automation5" writes "hey, dude"
	Then the message should be sent to group 1 from third user	

@WithoutAlert
Scenario:Three user send emoticons in group chat 

	When First user send the emoticons
	Then I should see that emoticon in the group chat screen
	When Second user send the emoticons
	Then I should see that emoticon in the group chat screen	
	When Third user send the emoticons
	Then I should see that emoticon in the group chat screen
