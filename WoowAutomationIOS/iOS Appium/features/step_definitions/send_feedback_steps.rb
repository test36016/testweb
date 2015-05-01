###############################

#####    GIVEN steps    #######

###############################

Given /^I am in the Send Feedback screen$/ do
  step 'I am in the Chats screen on the "first" device'
  step 'I go to Menu screen'
  step 'I tap the "Send Feedback" button'
  step 'I see the Send Feedback action sheet'
  step 'I select Send General Feedback'
end

Given /^I am in the Report a Problem screen$/ do
  step 'I am in the Chats screen on the "first" device'
  step 'I go to Menu screen'
  step 'I tap the "Send Feedback" button'
  step 'I see the Send Feedback action sheet'
  step 'I select Report a Problem'
end  

###############################

#####    WHEN steps     #######

###############################


When /^I go to Menu screen$/ do
  tabBarSwitch("Menu") #check common_steps.rb for the definition of this method
end

When /^I see the Send Feedback action sheet$/ do
  
# Will wait until the action sheet is displayed
# Will check for the two action sheet options (Send General Feedback and Report a Problem)   
   
  $wait.until { @driver.find_element(:xpath, "//UIAApplication[1]/UIAWindow[4]/UIAActionSheet[1]") }
  if @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]").displayed? 
    if @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]").displayed?
    puts("Send Feedback action sheet displayed")
  end
  end
end

When /^I select Send General Feedback$/ do
  @driver.find_element(:xpath, "//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]").click
end

When /^I tap the "(.*?)" button$/ do |button|
  buttonClick("#{button}")
end

When /^I enter summary$/ do
  $wait.until { @driver.find_element(:xpath, "//UIATableCell[1]/UIATextView[1]").displayed? }
  @driver.find_element(:xpath, "//UIATableCell[1]/UIATextView[1]").send_keys "Automation summary"
end

When /^I enter description$/ do
  $wait.until { @driver.find_element(:xpath, "//UIATableCell[2]/UIATextView[1]").send_keys "Automation description" }
end

When /^I tap the Ok button in the feedback confirmation message$/ do
  warn "Due to issue http://developer.woow.com:8080/browse/TALK-37721 this step will be implemented when the issue is fixed"
  $wait.until {menuButton("My Wow").displayed?}
end

When /^I select Report a Problem$/ do
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]").click
end

When /^I tap the Ok button in the report confirmation message$/ do
  warn "Due to issue http://developer.woow.com:8080/browse/TALK-37721 this step will be implemented when the issue is fixed" 
  $wait.until {menuButton("My Wow").displayed?}
end

###############################

#####    THEN  steps    #######

###############################


Then /^I should see the "(.*?)" button$/ do |button|
  if menuButton("#{button}").displayed?
    puts("Found the #{button} button")
  else
    puts("The #{button} button not found")
  end
end

Then /^the Feedback screen should appear$/ do
  sleep(2)
  $wait.until { isElementPresent("name", "Send Feedback") }
end

Then /^the user should see the "(.*?)" warning message$/ do |field|
  errorMessage("#{field}") #check menu_page.rb file for this method's definition
end

Then /^the user should see a message that feedback was sent successfully$/ do
#  $wait.until {}
  warn "Due to issue http://developer.woow.com:8080/browse/TALK-37721 this step will be implemented when the issue is fixed"
end

Then /^I should see the Menu screen$/ do
  menuScreen #check menu_page.rb file for this method's definition
end

Then /^the Report a Problem screen should appear$/ do
  $wait.until { @driver.find_element(:name, "Report a Problem") }
end

Then /^the user should see a message that report was sent successfully$/ do
#  $wait.until {}
  warn "Due to issue http://developer.woow.com:8080/browse/TALK-37721 this step will be implemented when the issue is fixed"
end
