@Dialpad
Feature: Dial pad
 
	Scenario: User types in number without +,00 or 011
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "40731793053"
		Then I should see the number change to "+40 731 793 053"
	
	Scenario: User selects country and enters number without leading '0'
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "40731793053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	
	
	Scenario: User selects country and enters number with leading '0'
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I select the country Romania
		And I enter the number "0731793053" after county selection
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	

	Scenario: User types in full number using '+'
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "+40731793053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	
	
	Scenario: User types in full number using '00'
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "0040731793053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	

	Scenario: User types in full number using '011'
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "01140731793053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	
@1	
	Scenario: User types in full number without '+,00,011'
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "999733"
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'
		
	Scenario: User types in number without '+,00,011' and then selects country
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "01140731793053"
		And I select the country Romania
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	
	
	Scenario: User types in number with + and then selects country
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "+40731793053"
		And I change country to Sri Lanka
		Then I should see the number change to "+94 73 179 3053"

	Scenario: User types in number with 00 and then selects country
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "0040731793053"
		And I change country to Sri Lanka
		Then I should see the number change to "+94 73 179 3053"	
		
	Scenario: User types in number with 011 and then selects country
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "01140731793053"
		And I change country to Sri Lanka
		Then I should see the number change to "+94 73 179 3053"		
	
	Scenario: User types invalid number (long number)
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "407317930530"
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'
	
	Scenario: User types invalid number (sort number)
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "4073310"
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

	Scenario: User pastes a number in the format +CC (0) XXX XXX XXX
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40 (0) 731 793 053"
		Then I should see the number "+40 731 793 053"

	Scenario: User saves a number in the format +CC (0) XXX XXX XXX
        Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40 (0) 731 793 053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	

	Scenario: User pastes a number in the format 00CC (0) XXX XXX XXX
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "0040 (0) 731 793 053"
		Then I should see the number "+40 731 793 053"	
		
	Scenario: User saves a number in the format 00CC (0) XXX XXX XXX
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "0040 (0) 731 793 053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	
	
	Scenario: User pastes a number in the format 011CC (0) XXX XXX XXX
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "01140 (0) 731 793 053"
		Then I should see the number "+40 731 793 053"	

	Scenario: User saves a number in the format 011CC (0) XXX XXX XXX
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "01140 (0) 731 793 053"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053"	

	Scenario: User enters/pastes a number in the format +40.731.79.3047 (with dots) +40.731.79.3047
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40.731.79.3047"
		Then I should see the number "+40 731 793 047"	
		
	Scenario: User saves a number in the format +40.731.79.3047 (with dots)
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40.731.79.3047"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 047"	
	
	Scenario: User enters/pastes a number in the format +40-731-793-047 (with dashes)
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40-731-793-047"
		Then I should see the number "+40 731 793 047"
	
	Scenario: User enters/pastes a number in the format +40*731#79#3047 (with special symbols)
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40*731#79#3047"
		Then I should see the number "+40*731#79#3047"

	Scenario: User saves a number in the format +40-731-793-047 (with dashes)
		Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I paste the number "+40-731-793-047"
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 047"
		
    Scenario: User selects Canada from Country picker
	    Given I am logged in with "pl.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I select Canada
		#Then I should see the number "+1"		


## The following scenarios take place in the Contact Details screen (Add/Edit Info from a contact profile screen)	 
 
	Scenario: User selects Romania from Country picker on contact screen
	    Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I select the country Romania from contact screen
		Then I should see the number "+40"

	Scenario: User types in number without +,00 or 011 on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "40731793053" on contact screen
		Then I should see the number change to "+40 731 793 053"

	Scenario: User selects country and enters number without leading '0' on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "40731793053" on contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053" on contact screen	

	Scenario: User selects country and enters number with leading '0' on contact screen 
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I select the country Romania from contact screen
		And I enter the number "0731793053" after county selection from contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053" on contact screen	
		
	Scenario: User types in full number using '+' on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "+40731793053" on contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053" on contact screen	
		
	Scenario: User types in full number using '00' on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "0040731793053" on contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053" on contact screen
	
	Scenario: User types in full number without '+,00,011' on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "999733" on contact screen
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'
		
	Scenario: User types in number without '+,00,011' and then selects country from contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "01140731793053" on contact screen
		And I select the country Romania from contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053" on contact screen	
		
	Scenario: User types invalid number (long number) on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "407317930530" on contact screen
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'
		
	Scenario: User types invalid number (sort number) on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I enter the number "4073310" on contact screen
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'
	
	Scenario: User pastes a number in the format 011CC (0) XXX XXX XXX on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I paste the number "01140 (0) 731 793 053" on contact screen
		Then I should see the number "+40 731 793 053"
		
	Scenario: User saves a number in the format 011CC (0) XXX XXX XXX on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I paste the number "01140 (0) 731 793 053" on contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 053" on contact screen

	Scenario: User enters/pastes a number in the format +40*731#79#3047 (with special symbols) on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I paste the number "+40*731#79#3047" on contact screen
		Then I should see the number "+40*731#79#3047"
	
	Scenario: User saves a number in the format +40-731-793-047 (with dashes) on contact screen
		Given I am logged in with "pl.automation6" account
		And I am in chat window with "pl.automation7"		
		When I press the more options
		And I press the View Profile
		And I press the more option from view profile
		And I press Add info option
		And I add new phone number on contact screen
		And I paste the number "+40-731-793-047" on contact screen
		And I click the Done button
		Then I should see the number is saved in the format "+40 731 793 047" on contact screen