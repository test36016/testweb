@send_feedback
Feature: Send Feedback

	@1
	Scenario: Send Feedback option displayed in Menu screen
		Given I am in the login screen on the "first" device
		When I type my username "pl.autoios.feedback" and password "123456"
		And I click the Sign In button
		And I go to Menu screen
		Then I should see the "Send Feedback" button
	
	@2
	Scenario: Send General Feedback screen accessed from Menu screen
		Given I am in the Chats screen on the "first" device
		When I go to Menu screen
		And I tap the "Send Feedback" button
		And I see the Send Feedback action sheet
		And I select Send General Feedback
		Then the Feedback screen should appear
	
	@3
	Scenario: User taps Send Feedback button without entering any information
		Given I am in the Send Feedback screen
		When I tap the "Send" button
		Then the user should see the "Summary" warning message

	@4
	Scenario: User taps Send Feedback button without entering description
		Given I am in the Send Feedback screen
		When I enter summary
		And I tap the "Send" button
		Then the user should see the "Description" warning message

	@5
	Scenario: User taps Send Feedback button with all information typed
		Given I am in the Send Feedback screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		Then the user should see a message that feedback was sent successfully
	
	@6
	Scenario: User taps OK button on feedback confirmation message
		Given I am in the Send Feedback screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		And I tap the Ok button in the feedback confirmation message
		Then I should see the Menu screen

	@7
	Scenario: Report a problem screen accessed from My Profile
		Given I am in the Chats screen on the "first" device
		When I go to Menu screen
		And I tap the "Send Feedback" button
		And I see the Send Feedback action sheet
		And I select Report a Problem
		Then the Report a Problem screen should appear
	
	@8
	Scenario: User taps Send Report button without entering any information
		Given I am in the Report a Problem screen
		And I tap the "Send" button
		Then the user should see the "Summary" warning message

	@9
	Scenario: User taps Send Report button without entering description
		Given I am in the Report a Problem screen
		When I enter summary
		And I tap the "Send" button
		Then the user should see the "Description" warning message

	@10
	Scenario: User taps Send Report button with all information typed
		Given I am in the Report a Problem screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		Then the user should see a message that report was sent successfully

	@11
	Scenario: User taps OK button on report confirmation message
		Given I am in the Report a Problem screen
		When I enter summary
		And I enter description
		And I tap the "Send" button
		And I tap the Ok button in the report confirmation message
		Then I should see the Menu screen