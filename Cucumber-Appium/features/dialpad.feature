@Dialpad
Feature: Dial pad

@WithoutAlert
Scenario: User types in number without +,00 or 011
		Given I am logged in with "pl.ios.automation6" account
		When I go to the edit profile screen
		And I add new phone number
		And I enter the number "40731793053"
		Then I should see the number change to "+40 731 793 053"

@WithoutAlert
Scenario: User enters number without leading '0'
		Given I am on the edit profile screen
		When I add new phone number
		And I enter the number "919999639531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	

@WithoutAlert
Scenario: User types in full number using '+'
		Given I am on the edit profile screen
		When I add new phone number
		And I enter the number "+919999639531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithoutAlert
Scenario: User types in full number using '00'
		Given I am on the edit profile screen
		When I add new phone number
		And I enter the number "+91009999639531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithoutAlert
Scenario: User types in full number using '011'
		Given I am on the edit profile screen
		When I add new phone number
		And I enter the number "011919999639531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithAlert
Scenario: User types in full number without '+,00,011'
		Given I am on the edit profile screen
		When I add new phone number
		And I enter the number "999733"
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

@WithAlert
Scenario: User types invalid number (long number)
		Given I am on the edit profile screen
		When I add new phone number
		And I enter the number "+9199996395312"
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

@WithAlert
Scenario: User types invalid number (sort number)
		Given I am on the edit profile screen
		When I add new phone number		
		And I enter the number "4073310"
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

@WithoutAlert
Scenario: User pastes a number in the format +CC 0 XXX XXX XXX
		Given I am on the edit profile screen
		When I add new phone number
		And I paste the number "+400731793053"
		Then I should see the number change to "+40 731 793 053"

@WithoutAlert
Scenario: User saves a number in the format +CC 0 XXX XXX XXX
        Given I am on the edit profile screen
		When I add new phone number		
		And I paste the number "+9109999639531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	
		
@WithoutAlert	
Scenario: User enters a number in the format +40+731+79+3047 (with plus)
		Given I am on the edit profile screen
		When I add new phone number
		And I paste the number "+40+731+79+3047"
		Then I should see the number change to "+40 731 793 047"	

@WithoutAlert
Scenario: User saves a number in the format +91+9999+639+531 (with plus)
        Given I am on the edit profile screen
		When I add new phone number		
		And I paste the number "+91+9999+639+531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	

@WithoutAlert
Scenario: User enters/pastes a number in the format +40*731#79#3047 (with special symbols)
		Given I am on the edit profile screen
		When I add new phone number		
		And I paste the number "+40*731#79#3047"
		Then I should see the number change to "+40 731 793 047"
		
@WithoutAlert
Scenario: User saves a number in the format +91*9999#639#531 (with special symbols)
        Given I am on the edit profile screen
		When I add new phone number		
		And I paste the number "+91*9999#639#531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithoutAlert		
Scenario: User pastes a number in the format 011CC (0) XXX XXX XXX
		Given I am on the edit profile screen
		When I add new phone number
		And I paste the number "011919999639531"
		Then I should see the number change to "+91 99996 39531"	

@WithoutAlert
Scenario: User saves a number in the format 011CC (0) XXX XXX XXX
		Given I am on the edit profile screen
		When I add new phone number
		And I paste the number "011919999639531"
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	
		
## The following scenarios take place in the Contact Details screen (Add/Edit Info from a contact profile screen)

@WithoutAlert
Scenario: User types in number without +,00 or 011 on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "40731793053" on contact info screen
		Then I should see the number change to "+40 731 793 053" on contact info screen

@WithoutAlert
Scenario: User enters number without leading '0' on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "919999639531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	

@WithoutAlert
Scenario: User types in full number using '+' on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "+919999639531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithoutAlert
Scenario: User types in full number using '00' on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "+91009999639531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithoutAlert
Scenario: User types in full number using '011' on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "011919999639531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"

@WithAlert
Scenario: User types in full number without '+,00,011' on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "999733" on contact info screen
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

@WithAlert
Scenario: User types invalid number (long number) on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I enter the number "+9199996395312" on contact info screen
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

@WithAlert
Scenario: User types invalid number (sort number) on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen		
		And I enter the number "4073310" on contact info screen
		And I click the Done button
		Then a message is displayed saying 'Invalid Phone Number'

@WithoutAlert
Scenario: User pastes a number in the format +CC 0 XXX XXX XXX  on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I paste the number "+400731793053" on contact info screen
		Then I should see the number change to "+40 731 793 053" on contact info screen

@WithoutAlert
Scenario: User saves a number in the format +CC 0 XXX XXX XXX on the contact screen
        Given I am on the contact info screen
		When I add new phone number on contact info screen	
		And I paste the number "+9109999639531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	
		
@WithoutAlert	
Scenario: User enters a number in the format +40+731+79+3047 (with plus) on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen
		And I paste the number "+40+731+79+3047" on contact info screen
		Then I should see the number change to "+40 731 793 047" on contact info screen
		
@WithoutAlert
Scenario: User saves a number in the format +91+9999+639+531 (with plus) on the contact screen
        Given I am on the contact info screen
		When I add new phone number on contact info screen		
		And I paste the number "+91+9999+639+531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"	

@WithoutAlert
Scenario: User enters/pastes a number in the format +40*731#79#3047 (with special symbols) on the contact screen
		Given I am on the contact info screen
		When I add new phone number on contact info screen	
		And I paste the number "+40*731#79#3047" on contact info screen
		Then I should see the number change to "+40 731 793 047" on contact info screen
		
@WithoutAlert
Scenario: User saves a number in the format +91*9999#639#531 (with special symbols) on the contact screen
        Given I am on the contact info screen
		When I add new phone number on contact info screen		
		And I paste the number "+91*9999#639#531" on contact info screen
		And I click the Done button
		Then I should see the number is saved in the format "+91 99996 39531"
