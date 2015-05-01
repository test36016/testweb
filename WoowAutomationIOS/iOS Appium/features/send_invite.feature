@send_invite
Feature: Send Invite

@firstScenario
Scenario: The user can see how many invites are available 
	Given I am logged in with "pl.mariusautomatic1" user and "123456" password
	When I go to Menu screen 
	Then I should see the Invite button  
####And I should have "10" invites left

@2    
Scenario: The user can access Send Invite screen from Invites button
	Given I am in Menu screen   		
	When I tap the "Invite" button
	Then I should be in the "Invite" screen
@3	
Scenario: The user can access Send Invite screen from Send Invite button
	Given I am in Menu screen
	When I tap the "Send Invite" button
	Then I should be in the "Invite" screen
	
@4
Scenario: The user can access Send Invite screen from Contacts screen	
	Given I am in "Contacts" screen
	When I tap the "+" button
	And I select Send Invite from action sheet
	Then I should be in the "Invite" screen	
		
@5
Scenario: The user can uncheck the "Add to contacts list"
	Given I am in the Invite screen
	When I click the Add this person to my contacts list button
	Then the check-mark should be unchecked
	
@6
Scenario: The user can send an invite
	 Given I am in the Invite screen
	 When I fill all the required fields
	 And I tap the Send button
	 Then the invite should be sent	
	  		
#@7
#Scenario: After one invite has been sent, the number of available invites has decreased with 1
#	Given I am in Menu screen
#	When I look at the Invites button
#	Then I should have "9" invites left	