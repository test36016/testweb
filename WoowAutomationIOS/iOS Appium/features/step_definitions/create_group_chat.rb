require 'appium_lib'
require 'appium_lib/driver.rb'
require 'test/unit/assertions'
require 'etc' # used for the screenshot method to return the currently logged user
World(::Test::Unit::Assertions)

###############################

#####    GIVEN steps    #######

###############################

Given /^I am logged in$/ do
  step 'I am logged in with "pl.mariusautomatic1" user and "123456" password'
end

Given /^I am in Create Group screen$/ do
  step 'I am in the Chats screen on the "second" device'
  step 'I tap the "Create Group" button'
  
end

Given /^I create a group chat on one device$/ do
  step 'I set the second device'
  step 'I am in Create Group screen'
  step 'I search for participants'
  step 'I choose the participants'
  step 'I tap the Done button'
  step 'I write "topic@" in the topic field'
  step 'I tap the Done button'
end

###############################

#####     WHEN steps    #######

###############################

When /^I look in the top-right corner of the screen$/ do
  
end

When /^I look at the screen$/ do
  
end

When /^I reach the Group Chat screen$/ do
  
end

When /^I tap the "(.*?)" field$/ do |button_name|
  sleep 2
  buttonClick(button_name)
end
  
When /^I write "(.*?)" text$/ do |text|
  @driver.find_element(:name,"contactNameTextField").send_keys text
end

When (/^I tap the \+ button$/) do
  @driver.find_element(:name,"groupchatAddParticipant").click
end

When /^I write "marius"$/ do
  @driver.find_element(:xpath,"//UIATableView[1]/UIASearchBar[1]").send_keys "marius"
end

When /^I write "topic@" in the topic field$/ do
  @driver.find_element(:id,"groupSubjectTextField").send_keys "topic@"
end

When /^I search for participants$/ do
  step 'I tap the + button'
  step 'I write "marius"'
end

When /^I choose the participants$/ do
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell[1]/UIAStaticText[1][contains(@value,'marius3 preauto3')]").click
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell[2]/UIAStaticText[1][contains(@value,'marius68 vm68')]").click
  @driver.find_element(:xpath,"//UIATableView[1]/UIAButton[2]").click
end

When /^I tap the Done button twice$/ do
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[3]").click
  sleep 1
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[3]").click
end

When /^I tap the Done button$/ do
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[3]").click
end

When /^I enter a single user chat$/ do
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1][contains(@value,'Auto5 Pre5')]").click
end

When /^I expand the More menu$/ do
  @driver.find_element(:id,"chatPlus").click
end

When /^I tap Add Participants button$/ do
  @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[5]").click
end

When /^I look at the participant's device$/ do
  step 'I set the third device'
end


###############################

#####    THEN  steps    #######

###############################


Then /^the Create Group button should be present$/ do
  isElementPresent(:name, "groupChatButton")
end

Then /^the "(.*?)" button should be clickable$/ do |button_name|
 buttonClick(button_name)

end

Then /^all interactive elements are present$/ do
    
 if ( @driver.find_element(:name, "topItem").displayed? and  #this is "Chats" button
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[2]").displayed? and #this is "back" arrow
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAStaticText[1]").displayed? and #this is the title of the screen
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").displayed? and #this is "Done" button
  @driver.find_element(:xpath, "//UIAElement[2]/UIAStaticText[1]").displayed? and #topic label
  @driver.find_element(:name, "groupSubjectTextField").displayed? and
  @driver.find_element(:xpath, "//UIAElement[3]/UIAStaticText[1]").displayed? and #participants label
  @driver.find_element(:name, "contactNameTextField").displayed? and
  @driver.find_element(:name, "groupchatAddParticipant").displayed? )#+ button
 
 else
   warn "One element is missing"
   screenshot
 end
end

Then /^I should see the search results$/ do
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1][contains(@value,'auto2 preauto2')]")
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[2]/UIAStaticText[1][contains(@value,'auto4 preauto4')]")
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[3]/UIAStaticText[1][contains(@value,'Auto5 Pre5')]")
end

Then /^I should see all results that contains "marius"$/ do
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell[1]/UIAStaticText[1][contains(@value,'marius3 preauto3')]")
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell[2]/UIAStaticText[1][contains(@value,'marius68 vm68')]")
end

Then /^I should be in the Group Chat screen$/ do
  assertGC = isElementPresent("id","groupchatEditGroupChat")
  if assertGC == true
    puts "I am in group chat"
  else
    warn "Group Chat not created!!"
    screenshot
  end
end

Then /^I should see the proper system message$/ do
  sleep 1
  assertSysMessage = @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").value
  if assertSysMessage.to_s == "auto1 preauto1 added marius3 preauto3, marius68 vm68 to the group"
    puts "Correct system message"
  else
    warn "Wrong system message!!"
    screenshot
  end
end

Then /^the topic should be correctly displayed on top$/ do
  assertTopic = @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAStaticText[1]").value
  if assertTopic.to_s == "topic@"
    puts "Correct topic found"
  else
    warn "Wrong topic found!!"
    screenshot
  end
end

Then /^I should see the "topic@" group chat entry on top$/ do
  assertTopic = @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").value
  if assertTopic.to_s == "topic@"
    puts "Correct activity entry found"
  else
    warn "Wrong activity entry found!!"
    screenshot
  end
end

Then /^the contact from single user chat should already be a participant$/ do
  assertParticipant = @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").value
  if assertParticipant.to_s == "Auto5 Pre5"
    puts "Participant already checked"
  else 
    warn "Participant not checked!!"
    screenshot
  end
end

Then /^I should see the group chat in the activity$/ do
  assertTopic = @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").value
    if assertTopic.to_s == "topic@"
      puts "Correct activity entry found"
    else
      warn "Wrong activity entry found!!"
      screenshot
    end
end

Then /^I should see the system message in it$/ do
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").click
  sleep 1
    assertSysMessage = @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").value
    if assertSysMessage.to_s == "auto1 preauto1 added marius3 preauto3, marius68 vm68 to the group"
      puts "Correct system message"
    else
      warn "Wrong system message!!"
      screenshot
    end
end