@P2PCall @android_all
Feature: P2P Call

	Scenario: Checks element in out going Audio call screen (Portrait mode)
		Given I am logged in with "pl.automation1" account
		When I perform a p2p call to "pl.automation5"
		Then I should see the call screen
		And I should see the ringing animation
		And I should see the back button arrow
		And I should see the Name of the contact I am calling
		And I should see the connecting status
		And I Should see the contacts avatar
		And I should see the video button
		And I should see the speaker button
		And I should see the dialpad button
		And I should see the end call button

	Scenario: Checks element in incoming Audio call screen (Portrait mode)
		Given I am logged in with "pl.automation1" account
		When I receive a p2p call from "pl.automation1"
		Then I should see the call screen
		And I should see the ringing animation
		And I should see the back button arrow
		And I should see the Name of the contact which is calling me
		And I should see the incoming call status
		And I Should see the contacts avatar
		And I should see the answer with video button
		And I should see the answer with audio button
		And I should see the reject call button

	Scenario: Checks element in out going Video call screen(Portrait mode)
		Given I am logged in with "pl.automation1" account
		When I perform a p2p video call to "pl.automation5"
		Then I should see the call screen
		And I should see the ringing animation
		And I should see the back button arrow
		And I should see the Name of the contact I am calling
		And I should see the connecting status
		And I should see my local feed to the right
		And above the local feed should be the flip camera button
		And I Should see the contacts avatar
		And I should see the video button with the blue active bar enabled
		And I should see the speaker button
		And I should see the dialpad button
		And I should see the end call button

	Scenario: Checks element in out going Audio call screen (Landscape mode)
		Given I am logged in with "pl.automation1" account
		When I perform a p2p call to "pl.automation5" in Landscape mode
		Then I should see the call screen
		And I should see the ringing animation
		And I should see the back button arrow
		And I should see the Name of the contact I am calling
		And I should see the connecting status
		And I Should see the contacts avatar
		And I should see the video button
		And I should see the speaker button
		And I should see the dialpad button
		And I should see the end call button

	Scenario: Checks element in incoming Audio call screen (Landscape mode)
		Given I am logged in with "pl.automation1" account
		When I receive a p2p call from "pl.automation1" in Landscape mode
		Then I should see the call screen
		And I should see the ringing animation
		And I should see the back button arrow
		And I should see the Name of the contact which is calling me
		And I should see the incoming call status
		And I Should see the contacts avatar
		And I should see the answer with video button
		And I should see the answer with audio button
		And I should see the reject call button
@2
	Scenario: Checks element in out going Video call screen (Landscape mode)
		Given I am logged in with "pl.automation1" account
		When I perform a p2p video call to "pl.automation5" in Landscape mode
		Then I should see the call screen
		And I should see the ringing animation
		And I should see the back button arrow
		And I should see the Name of the contact I am calling
		And I should see the connecting status
		And I should see my local feed to the right
		And above the local feed should be the flip camera button
		And I Should see the contacts avatar
		And I should see the video button with the blue active bar enabled
		And I should see the speaker button
		And I should see the dialpad button
		And I should see the end call button	
		
#   We are not able to identify locator for blue bar 	
	Scenario: User taps bottom bar action buttons
		Given I am logged in with "pl.automation1" account
		When I am in a call with "pl.automation5"
		And I tap a button from the bottom bar
		Then it should activate
		#And It should now have a blue bar above it showing its active

	Scenario: User taps bottom bar action buttons that are active
		Given I am logged in with "pl.automation1" account
		When I am in a call with "pl.automation5"
		And I tap a button from the bottom bar
		And I have button in their active state and I tap them again
		Then they should deactivate
		#And It should not have a blue bar above it showing its active

	Scenario: User taps the back button next to the Name of the contact
		Given I am logged in with "pl.automation1" account
		When I am in a call with "pl.automation5"
		When I tap the back button that is next to the contact name
		Then I should be taken to the chat screen with the contact
		And the call should continue without any issues

	Scenario: User selects a contact from the roster to perform a P2P call
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		Then I want to get connected with the contact

	Scenario: User locks the device after initiating a P2P call with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And I lock the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P call is initiated by user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer locks the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P call is started with the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answer
		And the peer locks the device
		Then the call should run normally

	Scenario: User locks the device after starting a P2P call with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answer
		And I lock the device
		Then the call should run normally

	 Scenario: User ends P2P Voice call started with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answers
		And I end the call
		Then the call should stop

	Scenario: User ends P2P Voice call before the other contact answers
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And I end the call before the contact answers
		Then the call should stop on both devices

	Scenario: Contact rejects P2P Voice call started by the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the contact rejects the call
		Then the call should stop on both devices

	Scenario: Contact ends P2P Voice call started by the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answers
		And the peer ends the call
		Then the call should stop

	Scenario: User selects a contact from the roster to perform a P2P call
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		Then I want to get connected with the contact

	Scenario: User initiates a call with a contact that becomes offline and not reachable after starting the P2P call
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And the contact becomes offline and not reachable (switches off the device)
		Then the call should stop when contact becomes offline

	Scenario: User locks the device after initiating a P2P call with another contact (from the contact profile)
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And I lock the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P call is initiated by user (from the contact profile)
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer locks the device
		Then the call should run normally

	Scenario: User locks the device after starting a P2P call with another contact (from the contact profile)
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And I lock the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P call is started with the user (from the contact profile)
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And the peer locks the device
		Then the call should run normally

	Scenario: User ends P2P Voice call started with another contact (from the contact profile)
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And I end the call
		Then the call should stop

	Scenario: Contact ends P2P Voice call started by the user (from the contact profile)
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And the peer ends the call
		Then the call should stop

	Scenario: User starts video after performing a P2P Voice call
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And I start my video stream
		Then I should see my video stream active on the screen
@1
	Scenario: Peer starts video after initiating in a P2P Voice call
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		And I tap on View profile
		And I press the Call button on contact profile
		And the peer answers
		And peer starts his video stream
		Then I should see peer's video stream active on the screen

	Scenario: User performs a P2P video call with a contact from the roster
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		Then I want to get connected with the other contact
		And I want to see my video stream

#   When user is offline then we cannot receive the user declined toast.
	Scenario: User selects an offline and not reachable contact from the roster to perform a P2P video call
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And that contact is offline and not reachable
		And I press the Plus button
		And I press the Video button
		#Then I receive a User declined toast.

	Scenario: User locks the device after initiating a P2P video call with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And I lock the device
		Then the call should run normally
	
	Scenario: Contact locks the device after a P2P call is initiated by user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers with video
		And the peer locks the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P video call is initiated by user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers with video
		And the peer locks the device
		Then the call should run normally

	Scenario: User locks the device after starting a P2P video call with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers
		And I lock the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P video call is started with the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers with video
		And the peer locks the device
		Then the call should run normally

	Scenario: Contact locks the device after a P2P video call is started with the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers without video
		And the peer locks the device
		Then the call should run normally

	Scenario: User ends P2P video call started with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers with video
		And I end the call
		Then the call should stop

	Scenario: User ends P2P video call started with another contact
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers without video
		And I end the call
		Then the call should stop

	Scenario: User ends P2P Video call before the other contact answers
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And I end the call before the contact answers
		Then the call should stop on both devices

	Scenario: Contact rejects P2P video call started by the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the contact rejects the call
		Then the call should stop on both devices

	Scenario: Contact ends P2P video call started by the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Call button
		And the peer answers with video
		And the peer ends the call
		Then the call should stop

	Scenario: Contact ends P2P video call started by the user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers without video
		And the peer ends the call
		Then the call should stop

	Scenario: User stops video stream in P2P Video call with another user
		Given I am logged in with "pl.automation1" account
		And I am in the roster
		When I select a contact from the Wow roster
		And I press the Plus button
		And I press the Video button
		And the peer answers with video
		And I close the video stream
		Then the call should run normally