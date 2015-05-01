@backend_test
Feature: iOS Backend Test part 1/2
	This feature file will use three physical devices !!!

###############################
#
#       Create account        #
#
###############################

###############################
#
#        Login (MDL)          #
#
###############################

	@1 @MDL
	Scenario: User logs in with the same account on 2 devices
		Given the application is launched on two device
		When I log in with "pl.ios.backend" account on both devices
		And I go to Menu screen on both devices
		And I view my profile info on both devices
		Then I should see the same profile info on both devices

###############################
#
#       Phone Validation      #
#
###############################

	@2 @MDL
	Scenario: User logged on 2 devices validates his account on one device
		Given I am logged in on two devices
		And I am in the phone validation screen on both devices
		When I validate my account with "0732714880" on one device
		Then the validation screen should be dismissed on both devices
	
	@3 @MDL
	Scenario: User logged on 2 devices devalidates his account on one device
		Given I am logged in on two devices
		When I delete my validated phone number on one device
		Then I should see the phone validation screen on both devices

###############################
#
#       Avatars (MDL)         #
#
###############################

	@4 @MDL @threeDevices 
	Scenario: User changes his avatar in MDL 
		Given I am logged in on two devices
		When I set a custom avatar on one device
		Then the avatar will change on both devices
		And my friend checks my profile
		And my friend will see the custom avatar

###############################
#
#       My Profile (MDL)      #
#
###############################

	@5 @MDL @threeDevices 
	Scenario: User adds a status message in MDL
		Given I am logged in on two devices
		When I change the "status message" on one device
		Then I should see the "status message" on the second device
		And my friends should see the "status message"
	
	@6 @MDL @threeDevices 
	Scenario: User modifies his first and last name in MDL
		Given I am in the My Profile screen on two devices
		When I change the "first and last name" on one device
		Then my friends should see the "new first and last name"
		And I should see the "first and last name change" on the second device
		
	@7 @MDL @threeDevices 
	Scenario: Change birthday from Profile in MDL
		Given I am in the My Profile screen on two devices
		When I change the "birthday" on one device
		Then my friends should see the "new birthday"
		And I should see the "birthday change" on the second device
		
	@8 @MDL @threeDevices
	Scenario: Change gender to Female from Profile in MDL
		Given I am in the My Profile screen on two devices
		When I change the "gender to female" on one device
		Then my friends should see the "new gender"
		And I should see the "female gender" on the second device
	
	@9 @MDL @threeDevices 
	Scenario: Change City from Profile in MDL
		Given I am in the My Profile screen on two devices
		When I change the "city" on one device
		Then my friends should see the "new city"
		And I should see the "city" on the second device

	@10 @MDL @threeDevices
	Scenario: Change country Profile in MDL
		Given I am in the My Profile screen on two devices
		When I change the "country" on one device
		Then my friends should see the "new country"
		And I should see the "country" on the second device
	
	@11 @MDL @threeDevices
	Scenario: Add Mobile phone number to Profile in MDL
		Given I am in the My Profile screen on two devices
		When I add "a mobile number" on one device
		Then my friends should see the "new mobile number"
		And I should see the "mobile number" on the second device
	
	@12 @MDL @threeDevices
	Scenario: Add website to Profile in MDL
		Given I am in the My Profile screen on two devices
		When I add "a website" on one device
		Then my friends should see the "website"
		And I should see the "website" on the second device

###############################
#
#    Contact profile (MDL)    #
#
###############################

	@13 @MDL
	Scenario: User adds a nickname to a friend in MDL
		Given I am in a friend's profile screen
		When I add "a nickname" for my friend
		Then I should see the "nickname" on the second device
	
	@14 @MDL 
	Scenario: User adds an email to a friend in MDL
		Given I am in a friend's profile screen
		When I add "an email" for my friend
		Then I should see the "email" on the second device

	@15 @MDL 
	Scenario: User adds a phone number to a friend in MDL
		Given I am in a friend's profile screen
		When I add "a phone number" for my friend
		Then I should see the "phone number" on the second device
	
	@16 @MDL 
	Scenario: User adds notes to a friend in MDL
		Given I am in a friend's profile screen
		When I add "notes" for my friend
		Then I should see the "notes" on the second device

	@17 @MDL
	Scenario: User adds a nickname to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "a nickname" for the Telephone Number contact
		Then I should see the contact's "nickname" on the second device

	@18 @MDL
	Scenario: User adds an email to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "an email" for the Telephone Number contact
		Then I should see the contact's "email" on the second device

	@19 @MDL
	Scenario: User adds a phone number to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "a phone number" for the Telephone Number contact
		Then I should see the contact's "phone number" on the second device
	
	@20 @MDL
	Scenario: User adds notes to a Telephone Number contact in MDL
		Given I am in a Telephone Number contact's profile screen
		When I add "notes" for the Telephone Number contact
		Then I should see the contact's "notes" on the second device

###############################
#
#          My Wow             #
#
###############################

	@21 @singleDevice
	Scenario: User checks each type of my wow notification is properly displayed
		Given I am in the Chats screen on the "first" device
		When I go to Menu screen
		And I tap the My Wow button
		Then I should see each type of notification

#####################################
#
# Paid Call (balance update in MDL) #
#
#####################################

	@22 @MDL
	Scenario: User makes a paid call and checks that the credit is updated
		Given I am logged in on two devices
		When I perform a paid call to "13156234436" on one device
		Then I should see the credit update when the call is ended
		And I should see the updated credit on the second device

#####################################
#
####    Earnings and Network    #####
#
#####################################

	@23 @MDL 
	Scenario: User makes a paid call and checks that the earnings are updated
		Given I am logged in on two devices
#		When I perform a paid call to "13156234436" on one device
		Then I should see the earnings update when the call is ended
#		And I should see the updated earnings on the second device

#####################################
#
#    Send Bug Report and Feedback   #
#
#####################################

	@24 @singleDevice 
	Scenario: User sends feedback
		Given I am in the Send Feedback screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		And I tap the Ok button in the feedback confirmation message
		Then I should see the Menu screen

	@25 @singleDevice 
	Scenario: User reports a problem
		Given I am in the Report a Problem screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		And I tap the Ok button in the report confirmation message
		Then I should see the Menu screen

###############################
#
#        Send Invite          #
#
###############################

	@26 @singleDevice
	Scenario: The user can see how many invites are available 
		Given I am in the Chats screen on the "first" device
		When I go to Menu screen 
		Then I should see the Invite button  
#	    And I should have "10" invites left

	@27 @singleDevice
	Scenario: The user can send an invite
		Given I am in the Chats screen on the "first" device
		When I go to Menu screen 
		And I tap the "Send Invite" button
		And I fill all the required fields
		And I tap the Send button
		Then the invite should be sent	
#		And the available invites should decrease by 1

###############################
#
####      Call forward     ####
#
###############################

###############################
#
#         Caller ID           #
#
###############################

###############################
#
#    Forgot/Reset password    #
#
###############################