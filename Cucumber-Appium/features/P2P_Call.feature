@P2P_Call
Feature: P2P Call feature

Scenario: User calls to his friend
		Given I am logged in with "pl.ios.automation1" account
		And  I am logged in with "pl.ios.automation2" account on second device
		When I select First device
		And I am in chat window with "pl.ios.automation2"
		When I tap "+" menu button
		And I tap on Audio call
		And I tap on Free call button
		Then I should see the call screen

 Scenario: Checks element in out going Audio call screen
		Given I perform a p2p call to second user
		Then I should see the call screen
		And I should see the video button
		And I should see the speaker button
		And I should see the mute button
		And I should see the end call button

Scenario: Checks element in incoming Audio call screen
		Given I receive a p2p call from first user
		Then I should see the incoming call screen
		And I should see the answer with video button
		And I should see the answer with audio button
		And I should see the reject call button

Scenario: Checks element in out going Video call screen
		Given I perform a p2p video call to second user
		Then I should see the call screen
		And I should see the video button
		And I should see the speaker button
		And I should see the mute button
		And I should see the end call button

Scenario: Single Call is answered
		Given I receive a p2p call from first user
		And I answer the call
		Then call should be established

Scenario: Single Call is declined
		Given I perform a p2p call to second user
		And I end the call
		Then call should not be established

Scenario: User sees the more options when he is in the call
		Given I receive a p2p call from first user
		And I answer the call
		Then User should see more options
			
Scenario: User selects a contact from the roster to perform a P2P call
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		Then I want to get connected with the contact

 Scenario: User ends P2P Voice call started with another contact
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answers
		And I end the call
		Then the call should stop

Scenario: User ends P2P Voice call before the other contact answers
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And I end the call before the contact answers
		Then the call should stop on both devices

Scenario: Contact rejects P2P Voice call started by the user
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the contact rejects the call
		Then the call should stop on both devices

Scenario: Contact ends P2P Voice call started by the user
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answers
		And the peer ends the call
		Then the call should stop
		
Scenario: User selects a contact from the roster to perform a P2P call
		Given I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		Then I want to get connected with the contact
		
Scenario: User performs a P2P call from the contact
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Contact option
		And I press the Call button
		Then I want to get connected with the contact
	
Scenario: User ends P2P Voice call started with another contact (from the contact profile)
		Given I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And I end the call
		Then the call should stop

Scenario: Contact ends P2P Voice call started by the user (from the contact profile)
		Given I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And the peer ends the call
		Then the call should stop

Scenario: User starts video after performing a P2P Voice call
		Given I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And I start my video stream
		Then I should see my video stream active on the screen

Scenario: Peer starts video after initiating in a P2P Voice call
		Given I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And peer starts his video stream
		Then I should see peer's video stream active on the screen

Scenario: User performs a P2P video call with a contact from the roster
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		Then I want to get connected with the other contact

Scenario: User ends P2P video call started with another contact
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers with video
		And I end the call
		Then the call should stop

Scenario: User ends P2P Video call before the other contact answers
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And I end the call before the contact answers
		Then the call should stop on both devices

Scenario: Contact rejects P2P video call started by the user
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the contact rejects the call
		Then the call should stop on both devices

Scenario: Contact ends P2P video call started by the user
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answers with video
		And the peer ends the call
		Then the call should stop

Scenario: Contact ends P2P video call started by the user(answers without video)
		Given I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers without video
		And the peer ends the call
		Then the call should stop