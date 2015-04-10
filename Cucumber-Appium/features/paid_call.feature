@PaidCall
Feature: Paid Call

Scenario: User see keyPad screen from profile
	Given I am logged in with "pl.ios.automation5" account
	When I press on profile icon
	And I tap on keypad option
	Then user should see Keypad screen

Scenario: User select the country to perform the paid call
	When I am in the activity screen
	And I tap on keypad button
	And I select "India" country
	Then User should see the selected country	

Scenario: User see keyPad screen from activity screen
	When I am in the activity screen
	And I tap on keypad button
	Then user should see Keypad screen

Scenario: User types a valid phone number in the dial pad
	When I am in the activity screen
	And I tap on keypad button
	And I select "India" country
	And I type a valid phone number
	Then User should see typed number 

Scenario: User types an invalid phone number in the dial pad (that starts with a country code but has less characters than the valid one)	
	When I am in the activity screen
	And I tap on keypad button
	And I select "India" country
	And I type a Invalid phone number
	And I press call button on keypad
	Then Call should not be started
@1
Scenario: User taps on call button without entering phone number
	When I am in the activity screen
	And I tap on keypad button
	And I press call button on keypad
	Then Call should not be started
@2
Scenario: User types an invalid phone number in the dial pad (that contains digits and special characters)
	When I am in the activity screen
	And I tap on keypad button
	And I select "India" country
	And I type a Invalid phone number with special characters
	And I press call button on keypad
	Then Call should not be started
@3			
Scenario: User establish a call after typing a valid phone number in the dial pad
	When I am in the activity screen
	And I tap on keypad button
	And I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	Then the call should be established from dial pad
@4
Scenario: User performs call that is cancelled
	When I am in the activity screen
	And I tap on keypad button
	And I select "India" country
	And I type a valid phone number
	And I press call button on keypad
	And I cancel the call
	Then I should NOT see the call quality feedback popup
