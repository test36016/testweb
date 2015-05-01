require 'appium_lib'
require 'appium_lib/driver.rb'
require 'test/unit/assertions'
require 'etc' # used for the screenshot method to return the currently logged user
World(::Test::Unit::Assertions)

###############################

#####    GIVEN steps    #######

###############################

Given /^I am logged in with "pl.mariusautomatic1" user and "123456" password$/ do
  step 'I am in the login screen on the "second" device'
  step 'I type my username "pl.mariusautomatic1" and password "123456"' #should be changed with the Jenkins credentials
  step 'I click the Sign In button'
  step 'I am in the Chats screen on the "second" device' #this step is required because the next step will fail without it
end

Given /^I am in Menu screen$/ do
  step 'I am in the Chats screen on the "second" device' #this step is required because the next step will fail without it
  step 'I go to Menu screen'
end

Given /^I am in Chats screen$/ do  
  step 'I am in the Chats screen on the "second" device'
end

Given /^I am in "(.*?)" screen$/ do |tabName|
   step 'I am in the Chats screen on the "second" device'
   tabBarSwitch("#{tabName}")
end

Given /^I am in the Invite screen$/ do
  step 'I am in the Chats screen on the "second" device' #this step is required because the next step will fail without it
  step 'I go to Menu screen'
  step 'I tap the "Send Invite" button' 
end

###############################

#####     WHEN steps    #######

###############################

When /^I click the Add this person to my contacts list button$/ do
  $wait.until { @driver.find_element(:name,"labelCheckAddToContactList") }
  @driver.find_element(:name,"checkBox").click
end

When /^I fill all the required fields$/ do
  @driver.find_element(:name,"textFieldName").send_keys "marius"
  random = rand(999).to_s
  @driver.find_element(:name,"textFieldEmail").send_keys "youwowmobileqa+" + random +"@gmail.com"
  @driver.find_element(:name,"textViewMessage").send_keys "hai cu noi"
end  

When /^I tap the Send button$/ do
  @driver.find_element(:name,"Send").click 
end

When /^I select Send Invite from action sheet$/ do
  @driver.find_element(:xpath,"//UIAApplication[1]/UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]").click
end

###############################

#####    THEN  steps    #######

###############################

Then /^I should see the Invite button$/ do
 @driver.find_element(:name,"invitesButton")
end

Then /^I should see the number of available invites left$/ do
  @driver.find_element(:text,"10")
end

Then /^I should be in the "(.*?)" screen$/ do |screen|
  currentScreen(screen) #see methods.rb
end

Then /^the check-mark should be unchecked$/ do
  if @driver.find_element(:name,"checkBox").selected?  #selected shows up if a button is in selected state or not
    warn "Checkbox is still selected"
    screenshot
  else puts "Checkbox not selected"
  end
end

Then /^the invite should be sent$/ do
  warn "This will fail when app language is not English!!!"
  $wait.until { @driver.find_element(:name,"Congratulations! Your invitation was sent.") }
  @driver.switch_to.alert.accept  
end
