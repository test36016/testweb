@location_sharing
Feature: location_sharing 	

Scenario: User sees the Send location option in the Contact Profile
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I press the more options
		And I press the View Profile
		And I click on More option on contact profile
		Then I should see the Send Location button in contact profile 

Scenario: User sees the Send location option in the Chat screen
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		Then I should see the Send Location button

Scenario: User sends location with GPS enabled
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on share location option
		Then I should see the Send Location in chat screen
@a		
Scenario: User sends the Send location with GPS enabled from the Contact Profile
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I press the more options
		And I press the View Profile
		And I click on More option on contact profile
		And I click on send location on contact profile
		Then I should see the Send Location in chat screen
	
Scenario: User sends location and switches the Chat screen to landscape
		Given I am logged in with "pl.automation1" account 
		And I am in chat window with "pl.automation5"
		When I tap "+" menu button
		And I tap on share location option
		And I rotate the device to landscape
		Then I should see the Send Location in chat screen in landscape mode	