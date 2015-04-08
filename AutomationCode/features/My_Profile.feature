@MyProfile 

Feature: My Profile feature
	
    Scenario: User opens the My Profile 
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		Then I should see the My Profile section
	
    Scenario: User sees his name displayed in the My Profile section
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		Then I should see the My Profile section
		And I should see my name displayed
		
    Scenario: User sees his avatar displayed in the My Profile section
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on the username
		Then I should see the Edit My Profile section
		And I should see my avatar or the default user icon displayed
		
	Scenario: User changes his custom status
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on the username
		And I type a custom status
		And I save it
		Then I should see my custom status displayed
		
	Scenario: User presses the Invite a friend button
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Invite button
		Then I should see the invite screen
		
	Scenario: User presses the Send Feedback button from the More menu
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button 
		And I press the Send General Feedback 
		Then I should see the Send Feedback screen

	Scenario: User presses the Activity Notifications button
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I press the Activity Notifications button
		Then I should see the Activity Notifications screen

	Scenario: User sees the My Profile from Activity Notifications screen
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I press the Activity Notifications button
		And I press profile icon
		Then I should see the My Profile section
	
	Scenario: User presses the My Wow button
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I press the My Wow button
		Then I should see the My Wow screen
	
	Scenario: User sees the My Profile from My Wow screen
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I press the My Wow button
		And I press the back button from My Wow screen
		Then I should see the My Profile section
	
	Scenario: User taps the Send Bug Report button from the More menu
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		Then I should see Report a problem screen
	
	Scenario: User sees the My Profile from Report a problem screen
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		And I press the back button on Report a problem screen 
		Then I should see the My Profile section

	Scenario: User changes his avatar
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button 
		And I tap on avatar
		Then I should see the screen with the available avatar options

	Scenario: User presses the Edit My Profile button
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button 
		Then I should see all the profile information fields displayed
	
	Scenario: User changes his First Name successfully 
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button
		And I change the First Name
		And I save the changes
		And I tap on the Edit My Profile button
		Then I should see the First Name changed successfully 
	
	Scenario: User changes his Last Name successfully 
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button
		And I change the Last Name
		And I save the changes
		And I tap on the Edit My Profile button
		Then I should see the Last Name changed successfully 

	Scenario: User changes Gender successfully 
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button
		And I change the Gender
		And I save the changes
		And I tap on the Edit My Profile button
		Then I should see the Gender changed successfully 
@1	
	Scenario: User changes City successfully 
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button
		And I change the city
		And I save the changes
		And I tap on the Edit My Profile button
		Then I should see the City changed successfully

	Scenario: User changes Country successfully 
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button
		And I change the Country
		And I save the changes
		And I tap on the Edit My Profile button
		Then I should see the Country changed successfully

	Scenario: User sees the About WowApp screen
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on About WowApp
		Then I should see the About WowApp screen
	@w	
	Scenario: User changes website successfully 
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		And I tap on the Edit My Profile button
		And I change the website
		And I save the changes
		And I tap on the Edit My Profile button
		Then I should see the website changed successfully
		
	Scenario: User sees the My Profile from About WowApp screen
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on About WowApp
		And I press the back button on the top of the screen
		Then I should see the My Profile section

	Scenario: User sees the Keypad screen
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on Keypad option
		Then I should see the Keypad screen
	
	Scenario: User sees the My Profile from Keypad screen
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on Keypad option
		And I press the back button on the Keypad screen
		Then I should see the My Profile section

	Scenario: User sees the personal info on MyProfile screen
		Given I am logged in with "pl.automation6" account
		When I go to Profile screen
		And I tap on the username
		Then I should see the personal info section
			
	Scenario: User sees the setting screen
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on setting option
		Then I should see the setting screen

	Scenario: User sees the Vibrate, Sound and light screen from setting
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on setting option
		And I tap on Vibrate,Sound and light option
		Then I should see the Vibrate,Sound and light screen

	Scenario: User sees the Media screen from setting
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on setting option
		And I tap on Media option
		Then I should see the Media screen

	Scenario: User sees the Account screen from setting
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on setting option
		And I tap on Account option
		Then I should see the Account screen

	Scenario: User sees the Profile screen from setting
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I tap on setting option
		And I tap on Profile option on setting
		Then I should see the Profile screen from setting