require 'rspec/expectations'
require 'selenium-webdriver'
require 'appium_lib'
require 'rubygems'
require 'etc' # used for the screenshot method to return the currently logged user


Given /^I select the environment on the "(.*?)" device$/ do |device|
  
  case device
  
  when "first"
    step 'I select the "first" device'
    
  when "second"
    step 'I select the "second" device'
        
  when "third"
    step 'I select the "third" device'
   
  when "simulator"
    step 'I select the "simulator" device'   
    
  end
  
  case $testEnvironment
  
  when "Live"
    @driver.find_element(:xpath, "//UIAWindow[1]/UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").click
      
  when "Prelive"
    @driver.find_element(:xpath, "//UIAWindow[1]/UIATableView[1]/UIATableCell[2]/UIAStaticText[1]").click
    
  when "Beta"
    @driver.find_element(:xpath, "//UIAWindow[1]/UIATableView[1]/UIATableCell[3]/UIAStaticText[1]").click
    
  end
  
end

Given /^I am in the login screen on the "(.*?)" device$/ do |device|
  
  case device
    
    when "first"
    step 'I select the environment on the "first" device'
      
    when "second"
    step 'I select the environment on the "second" device'
          
    when "third"
    step 'I select the environment on the "third" device'
    
    when "simulator"
        step 'I select the environment on the "simulator" device'  
    
    end
  
  
  sleep(3)
    if isElementPresent("id","userNameField") and isElementPresent("id","passwordField")
      puts("Login screen displayed")
    else
      puts("Login screen not displayed")
    end
end

Given /^I am in the Chats screen on the "(.*?)" device$/ do |device|
  
  case device
  
  when "first"
    step 'I select the "first" device'
    
  when "second"
    step 'I select the "second" device'
        
  when "third"
    step 'I select the "third" device'
  end
   
  sleep 3
  
  if isElementPresent(:name,"Skip")
    warn "Phone Validation failed !!!!!!!!!"
    screenshot
    @driver.find_element(:name,"Skip").click
  else 
    currentScreen("Chats")
  end
end


When /^I type my username "(.*?)" and password "(.*?)"$/ do |username, password|
  @driver.find_element(:id, "userNameField").send_keys "#{username}"
  @driver.find_element(:id, "passwordField").send_keys "#{password}"
end

When /^I click the Sign In button$/ do
  @driver.find_element(:id, "signInButton").click
  sleep 5
end

When(/^I set the first device$/) do
  @driver = nil
  @driver = @driverOne
end

When(/^I set the second device$/) do
  @driver = nil
  @driver = @driverTwo
end

When(/^I set the third device$/) do
  @driver = nil
  @driver = @driverThree
end

When(/^I set the forth device$/) do
  @driver = nil
  @driver = @driverFour
end

When /^I select the "(.*?)" device$/ do |device|
  case device
    
  when "first"
    step "I set the first device"
  when "second"
    step "I set the second device"
  when "third"
    step "I set the third device"
  when "simulator"
    step "I set the forth device"
  end
end



