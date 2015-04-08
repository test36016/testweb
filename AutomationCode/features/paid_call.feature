@PaidCall
Feature: Paid Call

	Scenario: User types a valid phone number in the dial pad
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I select a country
		And I type a valid phone number
		Then User should see typed number 

	Scenario: User types an invalid phone number in the dial pad (that starts with a country code but has less characters than the valid one)	
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I select a country
		And I type a Invalid phone number
		And I tap on call button on dial pad
		Then User should see message for Invalid number

	Scenario: User taps on call button without entering phone number
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I tap on call button on dial pad
		Then User should see message for Invalid number

	Scenario: User types an invalid phone number in the dial pad (that contains digits and special characters)
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I select a country
		And I type a Invalid phone number with special characters
		And I tap on call button on dial pad
		Then User should see message for Invalid number

	Scenario: User taps on Ok button on Invalid number message
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I select a country
		And I type a Invalid phone number
		And I tap on call button on dial pad
		And I tap on Ok button on Invalid number message
		Then I should see the Keypad screen
		
	Scenario: User establish a call after typing a valid phone number in the dial pad
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I type a valid phone number for the user
		And I tap on call button on dial pad
		Then the call should be established from dial pad

	Scenario: User performs call that is cancelled
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I type a valid phone number for the user
		And I tap on call button on dial pad
		And I cancel the call
		Then I should NOT see the call quality feedback popup
		
	Scenario: User sees Keypad screen from activity notification screen
		Given I am logged with "paidAccount" account
		When I am in the dial pad from activity notification screen
		Then I should see the Keypad screen

	Scenario: User types a valid phone number in the dial pad from activity notification screen
		Given I am logged with "paidAccount" account
		When I am in the dial pad from activity notification screen
		And I select a country
		And I type a valid phone number
		Then User should see typed number

	Scenario: User types an invalid phone number in the dial pad from activity notification screen	
		Given I am logged with "paidAccount" account
		When I am in the dial pad from activity notification screen
		And I select a country
		And I type a Invalid phone number
		And I tap on call button on dial pad
		Then User should see message for Invalid number

	Scenario: User taps on Ok button on Invalid number message from activity notification screen
		Given I am logged with "paidAccount" account
		When I am in the dial pad from activity notification screen
		And I select a country
		And I type a Invalid phone number
		And I tap on call button on dial pad
		And I tap on Ok button on Invalid number message
		Then I should see the Keypad screen

	Scenario: User sees Keypad screen from contacts screen
		Given I am logged with "paidAccount" account
		When I am in the dial pad from contacts screen
		Then I should see the Keypad screen

	Scenario: User types a valid phone number in the dial pad from contacts screen
		Given I am logged with "paidAccount" account
		When I am in the dial pad from contacts screen
		And I select a country
		And I type a valid phone number
		Then User should see typed number

	Scenario: User types an invalid phone number in the dial pad from contacts screen	
		Given I am logged with "paidAccount" account
		When I am in the dial pad from contacts screen
		And I select a country
		And I type a Invalid phone number
		And I tap on call button on dial pad
		Then User should see message for Invalid number

	Scenario: User taps on Ok button on Invalid number message from contacts screen
		Given I am logged with "paidAccount" account
		When I am in the dial pad from contacts screen
		And I select a country
		And I type a Invalid phone number
		And I tap on call button on dial pad
		And I tap on Ok button on Invalid number message
		Then I should see the Keypad screen

	Scenario: User taps on backspace button to delete entered number
		Given I am logged with "paidAccount" account
		When I am in the dial pad
		And I select a country
		And I type a valid phone number
		Then User should see typed number
		When I tap on backspace button
		Then User should see that one number is deleted
	