###############################

#####    GIVEN steps    #######

###############################






###############################

#####     WHEN steps    #######

###############################


When /^I am in the Settings screen$/ do
  step 'I am in the Chats screen on the "third" device'
  tabBarSwitch("Menu")
  buttonClick("Settings")
end


And /^I click the Save Incoming Media button$/ do
    @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[contains(@value,'1')]").click
end

And /^I click the Auto Download Photos button$/ do
    @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[contains(@value,'1')]").click    
end

When /^I click the "(.*?)" option$/ do |button|
  case button
  when "Vibration and Sounds"
    @driver.find_element(:xpath, "//UIATableCell[3]").click
    
  when "Blocked Contacts"
    @driver.find_element(:xpath, "//UIATableCell[4]").click
  end   
end




###############################

#####     THEN steps    #######

###############################


Then /^I should see the available Settings options$/ do
  sleep 3
    @driver.find_element(:xpath, "//UIATableCell[1]/UIAStaticText[contains(@label,'Save Incoming Media')]")
        puts " Found 'Save Incoming Media' button"
  
    @driver.find_element(:xpath, "//UIATableCell[2]/UIAStaticText[contains(@label,'Auto Download Photos')]")
        puts " Found 'Auto Download Photos' button "
  
    @driver.find_element(:xpath, "//UIATableCell[3]/UIAStaticText[contains(@label,'Vibration and Sounds')]")
        puts " Found 'Vibration and Sounds' button"
  
    @driver.find_element(:xpath, "//UIATableCell[4]/UIAStaticText[contains(@label,'Blocked Contacts')]") 
        puts " Found 'Blocked Contacts' button"    
end

And /^Save Incoming Media and Auto Download Photos options are enabled$/ do
    @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[contains(@value,'1')]")
        puts "Save Incoming Media button is enabled"
  
    @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[contains(@value,'1')]")
        puts "Auto Download Photos button is enabled"  
end

Then /^I should see that Save Incoming Media button is disabled$/ do
    @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[contains(@value,'0')]")
    @driver.find_element(:name, "Back").click
    @driver.find_element(:name, "earningsButton").click
        sleep 3
end
    
Then /^I should see that Auto Download Photos button is disabled$/ do
    @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[contains(@value,'0')]")
    @driver.find_element(:name, "Back").click
    @driver.find_element(:name, "earningsButton").click
          sleep 3
end

Then /^I should see that "(.*?)" button is still disabled$/ do |button|
  case button
    when "Save Incoming Media"
    @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[contains(@value,'0')]")
  
     when "Auto Download Photos"
    @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[contains(@value,'0')]")
end    
end

Then /^I see that  all elements from that screen are displayed correctly$/ do
 # Messages
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[1]")
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[2]")
 # Calls 
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[3]")
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[4]")
 # Login
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[5]")
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[6]")
  scrollScreen
  sleep 2
 # Network 
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[7]")
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[8]")
 # Earnings 
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[9]")
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[10]")
end

Then /^I verify that all elements are enabled by default$/ do
 # Messages
    @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[1][contains(@value,'1')]")
    @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[1][contains(@value,'1')]")
        puts "In-app sound and vibrate for Messages are enabled"
 # Calls 
    @driver.find_element(:xpath, "//UIATableCell[3]/UIASwitch[1][contains(@value,'1')]")
    @driver.find_element(:xpath, "//UIATableCell[4]/UIASwitch[1][contains(@value,'1')]")
        puts "In-app sound and vibrate for Calls are enabled"
 # Login
    @driver.find_element(:xpath, "//UIATableCell[5]/UIASwitch[1][contains(@value,'1')]")
    @driver.find_element(:xpath, "//UIATableCell[6]/UIASwitch[1][contains(@value,'1')]")
        puts "In-app sound and vibrate for Login are enabled"
  scrollScreen
  sleep 2
 # Network 
    @driver.find_element(:xpath, "//UIATableCell[7]/UIASwitch[1][contains(@value,'1')]")
    @driver.find_element(:xpath, "//UIATableCell[8]/UIASwitch[1][contains(@value,'1')]")
  puts "In-app sound and vibrate for Network are enabled"
 # Earnings 
    @driver.find_element(:xpath, "//UIATableCell[9]/UIASwitch[1][contains(@value,'1')]")
    @driver.find_element(:xpath, "//UIATableCell[10]/UIASwitch[1][contains(@value,'1')]")
  puts "In-app sound and vibrate for Earnings are enabled"
end

Then /^I disable all the options from Vibration and Sounds screen$/ do
  # Messages
      @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[1][contains(@value,'1')]").click
      @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[1][contains(@value,'1')]").click
  # Calls 
      @driver.find_element(:xpath, "//UIATableCell[3]/UIASwitch[1][contains(@value,'1')]").click
      @driver.find_element(:xpath, "//UIATableCell[4]/UIASwitch[1][contains(@value,'1')]").click
  # Login
      @driver.find_element(:xpath, "//UIATableCell[5]/UIASwitch[1][contains(@value,'1')]").click
      @driver.find_element(:xpath, "//UIATableCell[6]/UIASwitch[1][contains(@value,'1')]").click
  scrollScreen
    sleep 5
  # Network 
      @driver.find_element(:xpath, "//UIATableCell[7]/UIASwitch[1][contains(@value,'1')]").click
      @driver.find_element(:xpath, "//UIATableCell[8]/UIASwitch[1][contains(@value,'1')]").click
  # Earnings 
      @driver.find_element(:xpath, "//UIATableCell[9]/UIASwitch[1][contains(@value,'1')]").click
      @driver.find_element(:xpath, "//UIATableCell[10]/UIASwitch[1][contains(@value,'1')]").click 
      @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[1]").click
      @driver.find_element(:name, "Back").click
      @driver.find_element(:name, "earningsButton").click
      sleep 3       
end


Then /^I should see that all options from Vibration and Sounds screen are still disabled$/ do
  # Messages
        @driver.find_element(:xpath, "//UIATableCell[1]/UIASwitch[1][contains(@value,'0')]")
        @driver.find_element(:xpath, "//UIATableCell[2]/UIASwitch[1][contains(@value,'0')]")
  # Calls 
        @driver.find_element(:xpath, "//UIATableCell[3]/UIASwitch[1][contains(@value,'0')]")
        @driver.find_element(:xpath, "//UIATableCell[4]/UIASwitch[1][contains(@value,'0')]")
  # Login
        @driver.find_element(:xpath, "//UIATableCell[5]/UIASwitch[1][contains(@value,'0')]")
        @driver.find_element(:xpath, "//UIATableCell[6]/UIASwitch[1][contains(@value,'0')]")
    scrollScreen
      sleep 5
  # Network 
        @driver.find_element(:xpath, "//UIATableCell[7]/UIASwitch[1][contains(@value,'0')]")
        @driver.find_element(:xpath, "//UIATableCell[8]/UIASwitch[1][contains(@value,'0')]")
  # Earnings 
        @driver.find_element(:xpath, "//UIATableCell[9]/UIASwitch[1][contains(@value,'0')]")
        @driver.find_element(:xpath, "//UIATableCell[10]/UIASwitch[1][contains(@value,'0')]")
end





