@api_test
Feature: Api Release Checklist

	@1 @MDL
	Scenario: User logs in with the same account on 2 devices
		Given the application is launched on two device
		When I log in with "pl.ios.api" account on both devices
		And I go to Menu screen on both devices
		And I view my profile info on both devices
		Then I should see the same profile info on both devices

	@2 @MDL
	Scenario: User adds a new friend to his contact's list
		Given I am logged in on two devices
		When I search for a contact on WowApp
		And I send a friend request
		And the contact accepts the friend request
		Then I should see the new friend on both devices
		
	@3 @MDL
	Scenario: User removes a friend from his contact's list
		Given I am logged in on two devices
		When I remove a friend from my contact's list
		Then the friend should disappear from Contacts on both devices

	@4 @MDL @new
	Scenario: User blocks a contact in MDL
		Given I am logged in on two devices
		When I block a contact on Device 1 
		Then the contact is blocked also on Device 2
	
	@5 @MDL @new
	Scenario: User unblocks a contact in MDL
		Given I am logged in on two devices
		When I unblock a contact on Device 1 
		Then the contact is unblocked also on Device 2

	@6 @MDL @new
	Scenario: Unread notification badge appears over Chats tab in MDL
		Given I am logged in on two devices
		When I receive a new message from a contact
		Then an unread notification badge appears over Chats tab on both devices
	
	@7 @MDL @new
	Scenario: Unread notification badge disappears when the message is viewed in MDL
		Given I am logged in on two devices
		When I have an unread notification badge over the Chats tab
		And I view the unread message on one device
		Then the unread notification badge disappears from both devices

	@8 @MDL @new
	Scenario: Seen appears when the message is viewed in MDL 
		Given I am logged in on two devices
		When I send a message in a single chat
		And the message is viewed by my friend
		Then the Seen appears in the chat window on both devices

	@9 @MDL @new
	Scenario: Seen stays after user relaunches the app 
		Given I have a Seen message in the Chat screen with a friend
		And I am logged in on two devices
		When I open the Chat screen with my friend
		Then the Seen appears in the chat screen on both devices

	@10 @MDL @new
	Scenario: Remove message from single chat when in MDL
		Given I am logged in on two devices
		When I send a message to an online friend
		And I remove the message
		Then the message will be removed on both devices

	@11 @MDL
	Scenario: Create group chat 
		Given I am in Create Group screen
		When I search for participants
		And I choose the participants
		And I tap the Done button twice
		Then I should be in the Group Chat screen
		And I should see the proper system message

	@12 @MDL @new
	Scenario: Save group chat to Contacts
		Given I am logged in on two devices
		When I select save GC to Contacts for an existing GC
		Then the group chat appears in Contacts on both devices

	@13 @MDL @new
	Scenario: Seen by appears when the message is viewed in GC in MDL
		Given I open a group chat window 
		And I send the message
		When the message is viewed 
		Then seen appears in the group chat window 

	@14 @MDL @new
	Scenario: Seen by system message stays after user relogs 
		Given I have a Seen message in a group chat
		And I am logged in on two devices
		When I open the group chat screen
		Then the Seen appears in the group chat on both devices

	@15 @MDL @new
	Scenario: Remove message in group chat when in MDL
		Given I open a group chat window 
		And I type a message and I send the message
		When I remove the message
		Then the message will be removed on the other device also

	@16 @MDL @new
	Scenario: Seen appears if messages are seen while offline
		Given my friend sees my message while I am offline
		When I am logged in on two devices
		Then the Seen appears in the chat screen on both devices

	@17 @MDL @newLastStep
	Scenario: User is able to delete entries from Chats
		Given I am in the Chats screen on the "first" device
		When I delete the entries from Chats
		Then the entries should not be displayed anymore
		And the second device should not display the entires

	@18 @MDL @new
	Scenario: Available (online) presence updates in realtime in chat when in MDL
		Given I am logged in on two devices
		When a Last Seen friend comes online
		Then he will appear Available on both devices

	@19 @MDL @new
	Scenario: Move friend to Favorites when in MDL
		Given I am logged in on two devices
		When I move a friend to Favorites
		Then the friend is moved to the Favorites group on both devices
		
	@20 @MDL @new
	Scenario: Remove friend from Favorites when in MDL
		Given I am logged in on two devices
		When I remove a friend from Favorites
		Then the friend is moved to the Friends group on both devices

	@21 @MDL
	Scenario: User adds a nickname to a friend in MDL
		Given I am in a friend's profile screen
		When I add "a nickname" for my friend
		Then I should see the "nickname" on the second device
	
	@22 @MDL 
	Scenario: User adds an email to a friend in MDL
		Given I am in a friend's profile screen
		When I add "an email" for my friend
		Then I should see the "email" on the second device

	@23 @MDL 
	Scenario: User adds a phone number to a friend in MDL
		Given I am in a friend's profile screen
		When I add "a phone number" for my friend
		Then I should see the "phone number" on the second device
	
	@24 @MDL 
	Scenario: User adds notes to a friend in MDL
		Given I am in a friend's profile screen
		When I add "notes" for my friend
		Then I should see the "notes" on the second device

	@25 @MDL @new
	Scenario: User ads a new ADB contact in MDL
		Given I am logged in on two devices
		When I add a new ADB contact on Device 1
		Then the new ADB contact appears on Device 2 also

	@26 @MDL
	Scenario: User adds a nickname to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "a nickname" for the Telephone Number contact
		Then I should see the contact's "nickname" on the second device

	@27 @MDL
	Scenario: User adds an email to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "an email" for the Telephone Number contact
		Then I should see the contact's "email" on the second device

	@28 @MDL
	Scenario: User adds a phone number to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "a phone number" for the Telephone Number contact
		Then I should see the contact's "phone number" on the second device
	
	@29 @MDL
	Scenario: User adds notes to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "notes" for the Telephone Number contact
		Then I should see the contact's "notes" on the second device

	@30 @MDL @new
	Scenario: User removes an ADB contact in MDL
		Given I am logged in on two devices
		When I remove an ADB contact on Device 1
		Then the ADB contact is removed from Device 2 also

# N/A on iOS
#Scenario: Rename groups in roster when in MDL
#Given that I am in the roster
#When I right click on a custom group in the roster
#And I select Rename Group
#And I enter a new name
#Then the group is renamed in the roster

# N/A on iOS
#Scenario: Move contacts to new groups when in MDL
#Given that I am in the roster
#When I right click on a contact in the roster
#And I select Move to Group
#And I select a Custom group from the list
#And I click on the Move to Group button
#Then the contact is moved to the Custom group

# N/A on iOS
#Scenario: Busy presence updates in realtime in roster when in MDL
#Given I am in the roster
#When the contact changes presence to Busy
#Then he will appear Busy in the roster

# N/A on iOS
#Scenario: Away presence updates in realtime in roster
#Given I am in the roster in MDL on device 1 and device 2
#When I change the presence to away
#Then the presence will change to away on both devices
#And contact will also see me away

# N/A on iOS
#Scenario: Idle presence updates in realtime in roster ( MDL)
#Given I am in the roster in MDL on device 1 and device 2
#When the contact goes idle
#Then he will appear idle on both device 1 and device 2

# N/A on iOS
#Scenario: Contact presence changes to idle( MDL)
#Given I am in the roster 
#When the contact goes idle on both device 1 and device 2
#Then he will appear idle in the roster
		
# N/A on iOS
#Scenario: Delete message in single chat from Activity
#Given I select a single chat window from Activity
#And I open the context menu
#And I select Delete messages
#When I select and delete the last message in the chat window
#Then the message is deleted from the chat window

# N/A on iOS
#Scenario: Edit message in group chat when in MDL
#Given I open a group chat window 
#And I type a message and I send the message
#When I edit the message
#Then the message will appear edited on the other device also
	
#Scenario: Seen by system message appears when user Marks all as read the Activity tab
#Given I am in the roster
#And I have a unread badge over the Activity tab
#When I right click on the History tab 
#And I select Mark all as read
#Then Seen by system message appears in the chat window of the contact	

# N/A on iOS
#Scenario: Seen by appears when user Marks as read entries in activity
#Given I am in the roster
#And I have a unread activity entry
#When I right click on the activity entry
#And I select Mark as read
#Then Seen by system message appears in the chat window of the contact
	
# N/A on iOS	
#Scenario: Edited message is updated in MDL
#Given I open a chat window with an online contact
#And I type a message and I send the message
#When I edit the message
#Then the message will appear edited on the other device also	
		
# N/A on iOS
#Scenario: Remove groups from roster when in MDL
#Given that I am in the roster
#When I right click on a custom group in the roster
#And I select Remove Group
#Then the group is removed from the roster