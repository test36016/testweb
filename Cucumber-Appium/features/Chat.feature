@chat
Feature: Chat feature
So that I can communicate using WowApp,
As a WowApp user,
I want to chat with my friends

Scenario: User chat with his friend
	Given I am logged in with "pl.ios.automation1" account
	And  I am logged in with "pl.ios.automation2" account on second device
	And I am in chat window with "pl.ios.automation2" when friend is online
	When I write a "Hello" message
	And I tap "Send" button
	Then friend should see sent message in the chat screen

Scenario: Single user chat
	Given I am in chat window with "pl.ios.automation2" user
	When I write a "Hello" message
	And I tap "Send" button
	Then the message should be sent to Automation Two

Scenario: Group chat
	Given I am in group chat
	When I write a "Hello" message
	And I tap "Send" button
	Then the message should be sent to group 1

Scenario: Group chat
	Given I am in group chat
	When I write a "Hello" message
	And I tap "Send" button
	Then the message should be sent to group 1
	When "pl.ios.automation2" writes "hi, how are you"
	Then the message should be sent to group 1 from other user
	When I set First device
	When I am in the group 1 chat window
	And I write a "I am fine thanks" message
	And I tap "Send" button
	Then the message should be sent to group 1



Scenario: User send emoticons in chat conservation 
	
	Given I am in chat window with "pl.ios.automation2" user
	When I press the Emoticon icon
	And I select an emoticon
	And I tap "Send" button
	Then I should see that emoticon in the chat screen


Scenario:Peer send emoticons in chat conservation 
	
	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When Peer press the Emoticon icon
	And Peer select an emoticon
	And Peer tap "Send" button
	Then Peer should see that emoticon in the chat screen

Scenario:User and Peer both send emoticons in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I press the Emoticon icon
	And I select an emoticon
	And I tap "Send" button
	Then I should see that emoticon in the chat screen
	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When Peer press the Emoticon icon
	And Peer select an emoticon
	And Peer tap "Send" button
	Then Peer should see that emoticon in the chat screen


Scenario:Peer send message in chat conservation 

	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When I write a "Hello" message
	And I tap "Send" button
	Then Peer should see sent message in the chat screen


Scenario:User and Peer both send message in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I write a "Hello" message
	And I tap "Send" button
	Then the message should be sent to Automation Two
	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When I write a "Hey" message
	And I tap "Send" button
	Then Peer should see sent message in the chat screen


Scenario:User send a long message in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I write a "Hello, This is a long message" message
	And I tap "Send" button
	Then the message should be sent to Automation Two


Scenario:Peer send a long message in chat conservation 

	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When I write a "Hello, This is a long message about 60 characters" message
	And I tap "Send" button
	Then Peer should see sent message in the chat screen


Scenario:User send a Photo in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Gallery button
	And I tap on the Photos button
	And I Select file from gallery
	And I send file from gallery
	Then the file should be displayed in the chat screen


Scenario:Peer sees a sent photo in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Gallery button
	And I tap on the Photos button
	And I Select file from gallery
	And I send file from gallery
	Given I am on second device
	Then friend should see sent photo in the chat screen


Scenario:Peer send a Photo in chat conservation 

	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”	
	When I tap "+" menu button
	And I tap on the Gallery button
	And I tap on the Photos button
	And I Select file from gallery
	And I send file from gallery
	Then Peer should see the file in the chat screen


Scenario:User send a Video in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Gallery button
	And I tap on the video button
	And I Select video file from gallery
	And I send video file from gallery
	Then the file should be displayed in the chat screen
	

Scenario:Peer sees a sent video in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Gallery button
	And I tap on the video button
	And I Select video file from gallery
	And I send video file from gallery
	Given I am on second device
	Then friend should see sent photo in the chat screen


Scenario:Peer send a video in chat conservation 

	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”	
	When I tap "+" menu button
	And I tap on the Gallery button
	And I tap on the video button
	And I Select video file from gallery
	And I send video file from gallery
	Then Peer should see the file in the chat screen


Scenario:User shares Contact in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Share Contact button
	And I select on the Contact
	Then the shared contact should be displayed in the chat screen


Scenario:Peer sees shares Contact in chat conservation
	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Share Contact button
	And I select on the Contact	
	Given I am on second device
	Then friend should see share Contact in the chat screen

Scenario:Peer shares Contact in chat conservation 

	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When I tap "+" menu button
	And I tap on the Share Contact button
	And I select on the Contact	
	Then Peer should see share Contact in the chat screen


Scenario:User shares location in chat conservation 

	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Share location button
	And I send the location
	Then the shared location should be displayed in the chat screen


Scenario:Peer sees shares location in chat conservation
	Given I am in chat window with "pl.ios.automation2" user
	When I tap "+" menu button
	And I tap on the Share location button
	And I send the location	
	Given I am on second device
	Then friend should see share location in the chat screen

Scenario:Peer shares Contact in chat conservation 

	Given I am on second device
	And Peer in chat window with "pl.ios.automation1”
	When I tap "+" menu button
	And I tap on the Share location button
	And I send the location	
	Then Peer should see share location in the chat screen


Scenario:Peer sees shares location from user profile

	Given I am in chat window with "pl.ios.automation2" user
	When I press the Contact option
	And I press the View Profile
	And I press more button on profile
	And I tap on the Share location button from user profile
	Given I am on second device
	Then friend should see share location in the chat screen

Scenario:Peer sees shares Contact from user profile
	Given I am in chat window with "pl.ios.automation2" user
	When I press the Contact option
	And I press the View Profile
	And I press more button on profile
	And I tap on the Share Contact button from user profile
	And I select on the Contact	
	Given I am on second device
	Then friend should see share Contact in the chat screen	
