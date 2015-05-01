@editProfile
Feature: Profile Page

@1
	Scenario:Profile Page is displayed
		Given I am in the login screen on the "first" device
		When I type my username "pl.prelive15" and password "123456"
		And I click the Sign In button
		And I go to Menu screen
		And I open my profile screen
		Then I should see the Edit button

#######################################################
# PLACE THE PHONE CAMERA UP BEFORE RUNNING THESE TESTS#
#######################################################

#################################################
# HAVE AT LEAST 1 PHOTO IN YOUR FAVORITES ALBUM #
#################################################

@2
Scenario: User enters the Edit Profile screen
	When I tap the Edit button
	Then I see the Edit Profile screen
	
@3
Scenario: User checks the action sheet compare to having an avatar or not
	When I tap the Edit button
	And I tap the Avatar button
	Then I should see the WowApp Action Sheet


@4
Scenario: User sets a custom avatar using camera
	When I set the custom avatar using camera
	Then I should see a custom Avatar

@5
Scenario: User views the photo of his custom avatar
	When I tap View Photo
	Then I should view a photo	

@6
Scenario: User deletes his custom avatar
	Given I have a custom Avatar set
	When I delete my custom avatar
	Then I should see the Initials Avatar

@7
Scenario: User sets a custom avatar from gallery. 
	Given I have the Initials Avatar set
	When I set the custom avatar from gallery 
	Then I should see a custom Avatar
	
@8
Scenario: User changes First Name/ Last Name
	When I change my First Name
	And I change my Last Name
	Then I should see the new name
	
@9
Scenario: User tries to save without having a FN
	When I delete my first name and try to save
	Then I should see an error
	
@10
Scenario: User tries to save without having a LN
	When I delete my last name and try to save
	Then I should see an error
	
@11
Scenario: User changes his birthday
	When I change my birthday to a previous day
	Then I should see the new birthday in my profile
