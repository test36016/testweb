@settings
Feature: Settings



#########################################################################################################
	#1
	@1
	Scenario: User checks that the Settings option is available in the Menu screen.
		Given I am in the login screen on the "third" device
		When I type my username "pl.autoios.settings" and password "123456"
		And I click the Sign In button
		And I should see the Chats screen
		And I go to Menu screen
		Then I should see the "Settings" button
#########################################################################################################	
	#2
	@2
	Scenario: User checks the available options in the Settings screen.
		Given I am in the Settings screen
		Then I should see the available Settings options
		And Save Incoming Media and Auto Download Photos options are enabled
		
#########################################################################################################		
	#3
	@3
	Scenario: User disable Save Incoming Media button.
		Given I am in the Settings screen
		And I click the Save Incoming Media button 
		Then I should see that Save Incoming Media button is disabled
		
#########################################################################################################		
	#4
	@4
	Scenario: User checks if the Save Incoming Media button persists after a force stop.
		Given I am in the Settings screen
		Then I should see that "Save Incoming Media" button is still disabled
		
#########################################################################################################		
	#5
	@5	
	Scenario: User disable Auto Download Photos button.
		Given I am in the Settings screen
		And I click the Auto Download Photos button 
		Then I should see that Auto Download Photos button is disabled
		
#########################################################################################################		
	#6
	@6	
	Scenario: User checks if the Auto Download Photos button setting persists after a force stop.
		Given I am in the Settings screen
		Then I should see that "Auto Download Photos" button is still disabled
		
#########################################################################################################		
	#7
	@7
	Scenario: User opens Vibration and Sounds screen and checks if all elements are displayed correctly.
		Given I am in the Settings screen
		When I click the "Vibration and Sounds" option
		Then I see that  all elements from that screen are displayed correctly
		
#########################################################################################################		
	#8
	@8
	Scenario: User verify that all elements are enabled by default in Vibration And Sounds screen.
		Given I am in the Settings screen
		When I click the "Vibration and Sounds" option
		Then I verify that all elements are enabled by default
		
#########################################################################################################		
	#9	
	@9
	Scenario: User disable all options from Vibration and Sounds screen.
		Given I am in the Settings screen
		When I click the "Vibration and Sounds" option
		Then I disable all the options from Vibration and Sounds screen
		
#########################################################################################################		
	#10
	@10
	Scenario: User check if all options from Vibration and Sounds screen are still disabled.
		Given I am in the Settings screen
		When I click the "Vibration and Sounds" option 
		Then I should see that all options from Vibration and Sounds screen are still disabled
		
#########################################################################################################		
	#11	
#	Scenario: User opens Blocked Contacts screen.
#		Given I am in the Settings screen
#		When I click "Blocked Contacts" button
#		Then I should see that i am in Blocked Contacts Screen
				
#########################################################################################################
		#12
			 	 
#	Scenario: User verifies that blocked contacts screen contains an button "Unblock" in the right side
#	Given I am logged in with "test_user" credentials
#	When I press the Settings button
#	And I press Blocked Contacts button
#	Then I should see my blocked contacts ( only if someone is blocked) with an button "Unblock" right side
	
#########################################################################################################
	 	 
#	Scenario: User verifies that multiple blocked contacts can be Unblocked
#	Given I am logged in with "test_user" credentials
#	And I am in the Blocked contacts screen
#	And I have multiple blocked contacts
#	When I tap unblock on a contact
#	And I tap unblock on another contact
#	Then I should not see those contact in the blocked screen anymore
	 	 
#	Scenario: User verifies that confirmation dialog is shown when unblocking a contact
#	Given I am logged in with "test_user" credentials
#	And I am in the Blocked contacts screen
#	And I have a blocked contact
#	When I tap unblock on a contact
#	Then I should see a confirmation dialog appear
#	And I should see the "yes" option
#	And I should see the "no" option
	 	 
#	Scenario: User taps no when dialog is shown when unblocking a contact
#	Given I am logged in with "test_user" credentials
#	And I am in the Blocked contacts screen
#	And I have a blocked contact
#	When I tap unblock on a contact
#	And I see a confirmation dialog appear
#	And I tap "no"
#	Then the contact should still be blocked
#	And I should see that contact in the blocked screen
	 	 
#	Scenario: User taps yes when dialog is shown when unblocking a contact
#	Given I am logged in with "test_user" credentials
#	And I am in the Blocked contacts screen
#	And I have a blocked contact
#	When I tap unblock on a contact
#	And I see a confirmation dialog appear
#	And I tap "yes"
#	Then the contact should be unblocked
#	And I should not see that contact in the blocked screen