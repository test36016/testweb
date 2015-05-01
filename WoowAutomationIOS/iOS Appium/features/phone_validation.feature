@phone_validation
Feature: Phone Validation

	Scenario: Get the SMS text
		Given I am in the validation code screen
		When I receive the SMS
		Then I should see the validation code
		
		#	@real_device
#	Scenario: The country is automatically detected if a SIM is inserted in the device when the phone validation screen appears
	
	@simulator
	Scenario: User is able to type his phone number and request an SMS code
		Given I am in the phone validation screen
		When I type my phone number
		And I click Done
		Then I should see the confirmation prompt 