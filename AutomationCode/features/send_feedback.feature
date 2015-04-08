@send_feedback
Feature: Send Feedback

	Scenario: Send Feedback screen accessed from My Profile
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button 
		And I press the Send General Feedback 
		Then I should see the Send Feedback screen
		
	Scenario: User taps Send Feedback button without entering any information
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button 
		And I press the Send General Feedback 
		And I tap Send Feedback button
		Then User should see the message that field is empty

	Scenario: User taps Send Feedback button without entering description
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button 
		And I press the Send General Feedback 
		And I enter summary
		And I tap Send Feedback button
		Then User should see the message that field is empty

	Scenario: User taps Send Feedback button with all information
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button 
		And I press the Send General Feedback 
		And I enter summary
		And I enter description
		And I tap Send Feedback button
		Then User should see message that feedback was sent successfully

	Scenario: User taps ok button on feedback successfully message
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button 
		And I press the Send General Feedback 
		And I enter summary
		And I enter description
		And I tap Send Feedback button
		And I tap on Ok button
		Then I should see the My Profile section

	Scenario: Report a problem screen accessed from My Profile
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		Then I should see Report a problem screen

	Scenario: User taps Send button without entering any information
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		And I tap send button
		Then User should see the Alert message that bug report was not sent

	Scenario: User is able to Report a problem by entering only summary
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		And I enter summary
		And I tap send button
		Then User should see message that bug report was sent successfully
	
	Scenario: User is able to Report a problem by entering only description
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		And I enter description
		And I tap send button
		Then User should see message that bug report was sent successfully

	Scenario: User is able to Report a problem by entering all information
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		And I enter summary
		And I enter description
		And I tap send button
		Then User should see message that bug report was sent successfully

	Scenario: User taps ok button on bug report successfully message
		Given I am logged in with "pl.automation1" account
		When I go to Profile screen
		And I should see the My Profile section
		And I press the Send Feedback button
		And I press Report a problem
		And I enter summary
		And I enter description
		And I tap send button
		And I tap on Ok button
		Then I should see the My Profile section