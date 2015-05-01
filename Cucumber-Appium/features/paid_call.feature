@PaidCall
Feature: Paid Call

@WithoutAlert
Scenario: User see keyPad screen from profile
	Given I am logged in with "pl.ios.automation5" account
	When I press on profile icon
	And I tap on keypad option
	Then user should see Keypad screen

@WithoutAlert
Scenario: User select the country to perform the paid call
	Given I am in the activity screen
	When I tap on keypad button
	And I select "India" country
	Then User should see the selected country	

@WithoutAlert
Scenario: User see keyPad screen from activity screen
	Given I am in the activity screen
	When I tap on keypad button
	Then user should see Keypad screen

@WithoutAlert
Scenario: User types a valid phone number in the dial pad
	Given I am in the activity screen
	When I tap on keypad button
	And I select "India" country
	And I type a valid phone number
	Then User should see typed number 

@WithoutAlert
Scenario: User types an invalid phone number in the dial pad (that starts with a country code but has less characters than the valid one)	
	Given I am in the activity screen
	When I tap on keypad button
	And I select "India" country
	And I type a Invalid phone number
	And I press call button on keypad
	Then Call should not be started

@WithoutAlert
Scenario: User taps on call button without entering phone number
	Given I am in the activity screen
	When I tap on keypad button
	And I press call button on keypad
	Then Call should not be started

@WithoutAlert
Scenario: User types an invalid phone number in the dial pad (that contains digits and special characters)
	Given I am in the activity screen
	When I tap on keypad button
	And I select "India" country
	And I type a Invalid phone number with special characters
	And I press call button on keypad
	Then Call should not be started

@WithoutAlert		
Scenario: User establish a call after typing a valid phone number in the dial pad
	Given I am in the activity screen
	When I tap on keypad button
	And I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	Then the call should be established from dial pad

@WithoutAlert
Scenario: User performs call that is cancelled
	Given I am in the activity screen
	When I tap on keypad button
	And I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	And I cancel the call
	Then I should NOT see the call quality feedback popup

@WithoutAlert	
Scenario: User types an invalid phone number in the dial pad from profile
	Given I am in the dial pad
	When I select "India" country
	And I type a Invalid phone number
	And I press call button on keypad
	Then Call should not be started

@WithoutAlert
Scenario: User establish a call after typing a valid phone number from profile
	Given I am in the dial pad
	When I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	Then the call should be established from dial pad

@WithoutAlert
Scenario: User performs call that is cancelled from profile
	Given I am in the dial pad
	When I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	And I cancel the call
	Then I should NOT see the call quality feedback popup

@WithoutAlert
Scenario: User see keyPad screen from contact
	Given I am in the activity screen
	When I tap on keypad button from contact
	Then user should see Keypad screen

@WithoutAlert
Scenario: User establish a call after typing a valid phone number from contact
	Given I am in the activity screen
	When I tap on keypad button from contact
	And I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	Then the call should be established from dial pad

@WithoutAlert
Scenario: User performs call that is cancelled from contact
	Given I am in the activity screen
	When I tap on keypad button from contact
	And I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	And I cancel the call
	Then I should NOT see the call quality feedback popup

@WithoutAlert
Scenario: User taps on backspace button to delete entered number
	Given I am in the activity screen
	When I tap on keypad button from contact
	And I select "India" country
	And I tap on backspace button
	And I clear the number
	And I press call button on keypad
	Then Call should not be started

@WithoutAlert
Scenario: User see All contact screen from keypad
	Given I am in the activity screen
	When I tap on keypad button
	And I tap contact icon on keypad screen
	Then user should see all contact screen

@WithoutAlert
Scenario: User tap on create new contact option from keypad
	Given I am in the activity screen
	When I tap on keypad button
	And I tap on Add number on key pad
	And I tap on create new contact option
	Then user should see edit profile screen

@WithoutAlert
Scenario: User tap on add to existing option from keypad
	Given I am in the activity screen
	When I tap on keypad button
	And I tap on Add number on key pad
	And I tap on add to existing option
	Then user should see Address book contacts screen