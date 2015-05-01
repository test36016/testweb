@backend_test_2
Feature: iOS Backend Test part 2/2
	This feature file will use three physical devices and a simulator !!!

###############################
#
#  Add friend (search user)   #
#
###############################

	@1 @MDL
	Scenario: User adds a new friend to his contact's list
		Given I am logged in on two devices
		When I search for a contact on WowApp
		And I send a friend request
		And the contact accepts the friend request
		Then I should see the new friend on both devices
	
	@2 @MDL
	Scenario: User removes a friend from his contact's list
		Given I am logged in on two devices
		When I remove a friend from my contact's list
		Then the friend should disappear from Contacts on both devices

###############################
#
#       Birthday privacy      #
#
###############################

# The following scenarios have the Given step in the Hook file

	@3 @MDL @thirdDevice
	Scenario: User changes birthday privacy to Public
		When I change the "Birthday" privacy to "Public"
		Then the change should happen on my second device
		And the "Birthday" is visible for friends
		And non-friend users can also see the "Birthday"
	
	@4 @MDL @thirdDevice
	Scenario: User changes birthday privacy to Private
		When I change the "Birthday" privacy to "Private"
		Then the change should happen on my second device
		And the "Birthday" is not visible for friends
		And non-friend users can't see the "Birthday"
	
	@5 @MDL @thirdDevice
	Scenario: User changes birthday privacy to Friends
		When I change the "Birthday" privacy to "Friends"
		Then the change should happen on my second device
		And the "Birthday" is visible for friends
		And non-friend users can't see the "Birthday"

	@6 @MDL @thirdDevice
	Scenario: User disables Show year of birth option while Birthday is set to Friends
		When I change the "Birthday" privacy to "Friends"
		And I disable the Show Year of Birth option 
		Then the Show Year of Birth option should be disabled on my second device
		And the "Birth year" is not visible for friends
		And non-friend users can't see the "Birthday"
		
	@7 @MDL @thirdDevice
	Scenario: User disables Show year of birth option while Birthday is set to Public
		When I change the "Birthday" privacy to "Public"
		And I disable the Show Year of Birth option 
		Then the Show Year of Birth option should be disabled on my second device
		And the "Birth year" is not visible for friends
		And non-friend users can't see the "Birth year"

	@8 @MDL @thirdDevice
	Scenario: User changes gender privacy to Public
		When I change the "Gender" privacy to "Public"
		Then the change should happen on my second device
		And the "Gender" is visible for friends
		And non-friend users can also see the "Gender"

	@9 @MDL @thirdDevice
	Scenario: User changes gender privacy to Friends
		When I change the "Gender" privacy to "Friends"
		Then the change should happen on my second device
		And the "Gender" is visible for friends
		And non-friend users can't see the "Gender"

	@10 @MDL @thirdDevice
	Scenario: User changes Language privacy to Public
		When I change the "Language" privacy to "Public"
		Then the change should happen on my second device
		And the "Language" is visible for friends
		And non-friend users can also see the "Language"

	@11 @MDL @thirdDevice
	Scenario: User changes Language privacy to Friends
		When I change the "Language" privacy to "Friends"
		Then the change should happen on my second device
		And the "Language" is visible for friends
		And non-friend users can't see the "Language"

	@12 @MDL @thirdDevice
	Scenario: User changes Awards privacy to Friends
		When I change the "Awards" privacy to "Friends"
		Then the change should happen on my second device
		And the "Award" is visible for friends
		And non-friend users can't see the "Award"

	@13 @MDL @thirdDevice
	Scenario: User changes Awards privacy to Public
		When I change the "Awards" privacy to "Public"
		Then the change should happen on my second device
		And the "Award" is visible for friends
		And non-friend users can also see the "Award"

	@14 @MDL @thirdDevice
	Scenario: User changes Network privacy to Friends
		When I change the "Network" privacy to "Friends"
		Then the change should happen on my second device
		And the "Network" is visible for friends
		And non-friend users can't see the "Network"

	@15 @MDL @thirdDevice
	Scenario: User changes Network privacy to Public
		When I change the "Network" privacy to "Public"
		Then the change should happen on my second device
		And the "Network" is visible for friends
		And non-friend users can also see the "Network"

	@16 @MDL @thirdDevice
	Scenario: User changes Email privacy to Public
		When I change the "Email" privacy to "Public"
		Then the change should happen on my second device
		And the "Email" is visible for friends
		And non-friend users can also see the "Email"

	@17 @MDL @thirdDevice
	Scenario: User changes email privacy to Private
		When I change the "Email" privacy to "Private"
		Then the change should happen on my second device
		And the "Email" is not visible for friends
		And non-friend users can't see the "Email"
		
	@18 @MDL @thirdDevice
	Scenario: User changes email privacy to Friends
		When I change the "Email" privacy to "Friends"
		Then the change should happen on my second device
		And the "Email" is visible for friends
		And non-friend users can't see the "Email"

	@19 @MDL @thirdDevice
	Scenario: User changes phone number privacy to Public
		When I change the "Phone Number" privacy to "Public"
		Then the change should happen on my second device
		And the "Phone Number" is visible for friends
		And non-friend users can also see the "Phone Number"

	@20 @MDL @thirdDevice @lastScenario
	Scenario: User changes phone number privacy to Friends
		When I change the "Phone Number" privacy to "Friends"
		Then the change should happen on my second device
		And the "Phone Number" is visible for friends
		And non-friend users can't see the "Phone Number"