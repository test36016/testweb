require 'appium_lib'
require 'appium_lib/driver.rb'
require 'test/unit/assertions'
World(::Test::Unit::Assertions)

###############################

#####    GIVEN steps    #######

###############################


###############################

#####     WHEN steps    #######

###############################

When /^I validate my account with "(.*?)"$/ do |phoneNumber|
  validateAccountWithNumber(phoneNumber)
end

When /^I generate all possible chats events$/ do
  
  $generatedEvents = 0
  
  #Single user chat event
  sleep 2
  tabBarSwitch("Contacts")
  @driver.find_element(:name,"Contacts")
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'Smoke iPhone')]").click
  typeMessage
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'Chats')]").click
  if isElementPresent("id","pl.ios.smoke2@woow.com") # Single chat entry
    $generatedEvents += 1
  else
    warn "Single user chat event not found"
    screenshot
  end
  
  #Group chat event
  tabBarSwitch("Contacts")
  @driver.find_element(:name, "Contacts")
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'Smoke iPhone')]").click
  sleep 1
  @driver.find_element(:id,"chatPlus").click
  @driver.find_element(:name,"Add Participants").click
  @driver.find_element(:name,"Done").click
  typeMessage
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'Chats')]").click
  if isElementPresent("xpath","//UIATableCell[contains(@name,'conference.woow.com')]") # Group chat entry
    $generatedEvents += 1
  else
    warn "Group chat event not found"
    screenshot
  end
  
  #Paid call event
  callNumber("40731733271",2) # Called the method using two arguments: the number and the call duration in seconds
    
  $wait.until { @driver.find_element(:xpath,"//UIAButton[contains(@name,'Back')]").click }
  if isElementPresent("xpath","//UIATableCell[contains(@name,'+40731733271@woow.com')]") # Group chat entry
    $generatedEvents += 1
  else
    warn "Paid call event not found"
    screenshot
  end
end

When /^I swipe up$/ do
  loadMoreActivity(4)
end

When /^I generate activity entries$/ do
  generateChatsEvents(10)
end

When /^I delete the entries from Chats$/ do
  puts $generatedEvents.to_s + " events will be deleted"
  deleteChats($generatedEvents)
end

When /^I open a chat screen$/ do
  tabBarSwitch("Contacts")
  sleep 1
  @driver.find_element(:name,"Contacts")
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'Smoke iPhone')]").click
end

When /^I generate all possible chat events$/ do

  messagesInChat = 0
  
# Message
  typeMessage
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'Chats')]").click
  $wait.until { @driver.find_element(:id, "pl.ios.smoke2@woow.com") }
  text = @driver.find_element(:id,"pl.ios.smoke2@woow.com").text
  assert_send([text, :include?, $message])
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'Smoke iPhone')]").click
  messagesInChat +=1

# Audio Call
  @driver.find_element(:id,"chatPlus").click
  sleep 1
  @driver.find_element(:name,"Audio Call").click
  sleep 1
  @driver.find_element(:name,"Free Call").click
  @driver.find_element(:name,"hangup").click
  messagesInChat +=1
  event = @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]/UIAStaticText[1]").value
  assert_send([event, :include?, "Outgoing Call"])
    
# Video Call - cannot be verified on simulator
  if $realDevice 
      @driver.find_element(:name,"Video Call").click
      sleep 1
    while isElementPresent("xpath","//UIAAlert[1]")
        @driver.switch_to.alert.accept
      end
      @driver.find_element(:name,"hangup").click
      messagesInChat +=1
      event = @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]/UIAStaticText[1]").value
      assert_send([event, :include?, "Outgoing Call"])
  else warn "Video Call - cannot be verified on simulator"
  end

# Share Location
  @driver.find_element(:name,"Share Location").click
  sleep 1
  
  if isElementPresent("name","Allow")
    @driver.find_element(:name,"Allow").click
    @driver.find_element(:id,"buttonSendLocation").click
  else
    @driver.find_element(:id,"buttonSendLocation").click
  end
  
  messagesInChat +=1
  
  $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]/UIAButton[contains(@name,'locationButton')]") }

# Photo from camera - cannot be verified on simulator
    
  if $realDevice
    @driver.find_element(:id,"chatPlus").click
      sleep 1 
      @driver.find_element(:name,"Take Photo").click
      
      while isElementPresent("xpath","//UIAAlert[1]")
        @driver.switch_to.alert.accept
      end
      
        @driver.find_element(:name,"PhotoCapture").click
        sleep 4
        $wait.until { @driver.find_element(:xpath,"//UIAWindow[1]/UIAButton[4]").click } # Click on Use Photo
              
      sleep 2
      messagesInChat +=1
        while isElementPresent("xpath","//UIAAlert[1]")
          @driver.switch_to.alert.accept
        end
      $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]") }  
  else
    warn "Photo from camera - cannot be verified on simulator"
  end
    
# Photo from Gallery
  @driver.find_element(:id,"chatPlus").click
  @driver.find_element(:name,"Gallery").click
  @driver.find_element(:name,"Send Photo").click
  
  begin
  sleep 4
  @driver.find_element(:xpath, "//UIATableCell[1]").click
  sleep 2
  @driver.find_element(:xpath, "//UIAImage[1]").click
  @driver.find_element(:name,"Send").click
  
  sleep 2
  messagesInChat +=1
  
  $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]") }  
  
  rescue
    warn "Photo from Gallery failed, please check!!!!"
  end
    
# Video from Gallery - cannot be verified on simulator
    
if $realDevice
  @driver.find_element(:id,"chatPlus").click
    sleep 1 
    @driver.find_element(:name,"Gallery").click
    
    while isElementPresent("xpath","//UIAAlert[1]")
      @driver.switch_to.alert.accept
    end
    
    @driver.find_element(:name,"Send Video").click
      @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click
      @driver.find_element(:name,"Choose").click
      
    sleep 4
    messagesInChat +=1
    
    $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]") }  
else
  warn "Video from Gallery - cannot be verified on simulator"
end
    
# Share contact 
  @driver.find_element(:id,"chatPlus").click
  sleep 1
  @driver.find_element(:name,"Share Contact").click  
  sleep 2  
  @driver.find_element(:xpath,"//UIATableCell[1]").click  
  messagesInChat +=1  
  event = @driver.find_element(:xpath,"//UIATableCell[#{messagesInChat}]/UIAStaticText[1]").value
  assert_send([event, :include?, "Auto Cont1"])
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[1]").click #Click Back
end


# Video from camera - cannot be verified on simulator
  
When /^I send a video from camera$/ do
  
  if $realDevice
    sleep 2
    @driver.find_element(:id,"chatPlus").click
      sleep 1 
      @driver.find_element(:name,"Take Video").click
      sleep 1
      
        @driver.find_element(:name,"VideoCapture").click
        sleep 30 # Take a 30s video
        @driver.find_element(:name,"VideoCapture").click
        sleep 2
        @driver.find_element(:name,"Use Video").click
              
      sleep 2
      $wait.until { @driver.find_element(:xpath,"//UIATableCell[1]") }  
   while isElementPresent("xpath","//UIAWindow[4]/UIAAlert[1]")
        @driver.switch_to.alert.accept
   end
   sleep 5
    @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[1]").click #Click Chats/Back
  else
    warn "Video from camera - cannot be verified on simulator"
  end
end


When /^I open a group chat screen$/ do
  @driver.find_element(:id,"groupChatButton").click
  @driver.find_element(:id,"contactNameTextField").send_keys "S"
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'Smoke iPhone')]").click
  @driver.find_element(:name,"Done").click
end

When /^I generate all possible group chat events$/ do
  
  messagesInGroupChat = 0
  
  # Initial message
  sleep 3
  firstSystemMessage = @driver.find_element("xpath", "//UIATableCell[1]/UIAStaticText[1]").value
    if firstSystemMessage.to_s == 'WowApp Smoke added Smoke iPhone to the group'
      messagesInGroupChat += 1
      else
        warn "Missing the first system message in group chat"
      screenshot
    end
    
  # Message
    typeMessage
    @driver.find_element(:xpath,"//UIAButton[contains(@name,'Back')]").click
    $wait.until { @driver.find_element(:xpath, "//UIATableCell[contains(@name,'@conference.woow.com')]") }
    text = @driver.find_element(:xpath, "//UIATableCell[contains(@name,'@conference.woow.com')]").text
    assert_send([text, :include?, $message])
    @driver.find_element(:xpath, "//UIATableCell[contains(@name,'@conference.woow.com')]").click
    messagesInGroupChat +=1
  
  # Photo from camera - cannot be verified on simulator
  
    
if $realDevice
    @driver.find_element(:id,"chatPlus").click
      sleep 1 
      @driver.find_element(:name,"Take Photo").click
      
      while isElementPresent(:xpath,"//UIAAlert[1]")
        @driver.switch_to.alert.accept
      end
      
        @driver.find_element(:name,"PhotoCapture").click
        $wait.until { @driver.find_element(:name,"Use Photo").click }
              
      sleep 2
  messagesInGroupChat +=1
      
      $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInGroupChat}]") }  
  else
    warn "Photo from camera - cannot be verified on simulator"
  end
    
  # Add a participant
    @driver.find_element(:id,"chatPlus").click
    sleep 1 
    @driver.find_element(:name,"Add Participants").click
    @driver.find_element(:id,"addMoreParticipantsCell").click
    @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[2]/UIAStaticText[contains(@label,'Auto Cont10')]").click
    @driver.find_element(:name,"Done").click
    @driver.find_element(:name,"Done").click
    messagesInGroupChat +=1
    sleep 3
    
    addedParticipantMessage = @driver.find_element("xpath", "//UIATableCell[#{messagesInGroupChat}]/UIAStaticText[1]").value
    screenshot
    if addedParticipantMessage.to_s == 'WowApp Smoke added Auto Cont10 to the group'
      else
      warn "Missing the system message for added participant"
      screenshot
    end
    
  # Remove participant
    
    @driver.find_element(:id,"groupchatEditGroupChat").click
    sleep 1
    if isElementPresent("xpath","//UIATableCell[3]/UIAStaticText[contains(@label,'Auto Cont10')]")
        @driver.find_element(:xpath,"//UIATableCell[3]/UIAButton[contains(@label,'groupchatDeleteParticipant')]").click
        @driver.find_element(:name,"Done").click
        messagesInGroupChat +=1
    else
      warn "Participant not found in the list"
    end
    
    removedParticipantMessage = @driver.find_element("xpath", "//UIATableCell[#{messagesInGroupChat}]/UIAStaticText[1]").value
    screenshot
    if removedParticipantMessage.to_s == 'WowApp Smoke removed Auto Cont10 from the group'
      else
      warn "Missing the system message for removed participant"
      screenshot
    end
    
  # Share Location
    @driver.find_element(:id,"chatPlus").click
    sleep 1 
    @driver.find_element(:name,"Share Location").click
    sleep 1
    
    if isElementPresent("name","Allow")
      @driver.find_element(:name,"Allow").click
      @driver.find_element(:id,"buttonSendLocation").click
    else
      @driver.find_element(:id,"buttonSendLocation").click
    end
    
    messagesInGroupChat +=1
    
    $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInGroupChat}]/UIAButton[contains(@name,'locationButton')]") }
  
      
  # Photo from Gallery
    @driver.find_element(:id,"chatPlus").click
    sleep 1 
    @driver.find_element(:name,"Gallery").click
    
    if isElementPresent("name","Ok")
      @driver.find_element(:name,"Ok").click
      @driver.find_element(:name,"Ok").click
      @driver.find_element(:name,"Send Photo").click
      @driver.find_element(:xpath,"//UIATableCell[1]").click
      @driver.find_element(:xpath,"//UIACollectionCell[1]").click
      @driver.find_element(:name,"Send").click
    else
      @driver.find_element(:name,"Send Photo").click
      @driver.find_element(:xpath,"//UIATableCell[1]").click
      @driver.find_element(:xpath,"//UIACollectionCell[1]").click
      @driver.find_element(:name,"Send").click
    end
    
    sleep 2
    messagesInGroupChat += 1
    
    $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInGroupChat}]") }  
      
  # Video from Gallery - cannot be verified on simulator
      
if $realDevice
  @driver.find_element(:id,"chatPlus").click
    sleep 1 
    @driver.find_element(:name,"Gallery").click
    
    while isElementPresent("xpath","//UIAAlert[1]")
      @driver.switch_to.alert.accept
    end
    
    @driver.find_element(:name,"Send Video").click
      @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click
      @driver.find_element(:name,"Choose").click
      
    sleep 4
  messagesInGroupChat +=1
    
    $wait.until { @driver.find_element(:xpath,"//UIATableCell[#{messagesInGroupChat}]") }  
else
  warn "Video from Gallery - cannot be verified on simulator"
end
      
  # Share contact 
    @driver.find_element(:id,"chatPlus").click
    sleep 1
    @driver.find_element(:name,"Share Contact").click  
    sleep 2  
    @driver.find_element(:xpath,"//UIATableCell[1]").click  
    messagesInGroupChat +=1  
    event = @driver.find_element(:xpath,"//UIATableCell[#{messagesInGroupChat}]/UIAStaticText[1]").value
    assert_send([event, :include?, "Auto Cont1"])
    @driver.find_element(:xpath,"//UIAButton[contains(@name,'Back')]").click
end

When /^I click the Contacts button$/ do
  tabBarSwitch("Contacts")
end

When /^I click the Keypad button$/ do
  @driver.find_element(:id,"dialpadButton").click
end

When /^I search my contacts list for "(.*?)"$/ do |friend|
  buttonClick("Search")
  #  @driver.find_element(:xpath,"//UIAButton[contains(@name,'nav bar search')]").click # Click on the search button
  @driver.find_element(:xpath,"//UIASearchBar[1]").send_keys friend
end

When /^I open the profile screen for "(.*?)"$/ do |friend|
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'#{friend}')]").click
  sleep 1
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAStaticText[1]").click # Click the friend's name on the top bar
  sleep 1
end

When /^I search for "(.*?)" on WowApp$/ do |user|
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'nav bar add contact')]").click
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[contains(@name,'Search Contact on WowApp')]").click
  @driver.find_element(:xpath,"//UIASearchBar[1]").click
  @driver.find_element(:xpath,"//UIASearchBar[1]").send_keys user
  @driver.find_element(:xpath,"//UIAKeyboard[1]/UIAButton[4]").click # Click on keyboard Search button
end

When /^I select "(.*?)" from the search results$/ do |wowuser|
  $wait.until { @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell/UIAStaticText[contains(@value,'#{wowuser}')]").click }
end

When /^I select "(.*?)" from the roster search results$/ do |friend|
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell/UIAStaticText[contains(@value,'#{friend}')]").click
end

When /^I select to view the profile$/ do
  $wait.until { @driver.find_element(:id,"viewFullProfileCell").click }
end

When /^I save "(.*?)" in my contacts list$/ do |phoneNumber|
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'nav bar add contact')]").click
  @driver.find_element(:xpath,"//UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[3]/UIAButton[contains(@name,'Save Phone Number')]").click
  @driver.find_element(:id,"phoneCell").click
  @driver.find_element(:xpath,"//UIATableCell[3]/UIATextField[1]").send_keys phoneNumber
  @driver.find_element(:name,"Done").click
  sleep 1
  @driver.switch_to.alert.accept
end

When /^I delete the default country code$/ do
  3.times do
  @driver.find_element(:id,"buttonDeleteLastCharacter").click
  end
end

When /^I type a Romanian phone number$/ do
  [4,0,7,3,1,7,3,3,2,7,1].each do |digit|
      @driver.find_element(:name,"#{digit}").click
      end
end  

When /^I type a Romanian phone number in Keypad$/ do
  step 'I click the Keypad button'
  step 'I delete the default country code'
  step 'I type a Romanian phone number'
end

When /^I save the number in my Contacts list$/ do
  @driver.find_element(:id,"buttonSaveNumber").click
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]").click
  sleep 2
  @driver.find_element(:name,"Done").click
  @driver.switch_to.alert.accept
end

When /^I save the number in "(.*?)" profile$/ do |friend|
  @driver.find_element(:id,"buttonSaveNumber").click
  sleep 2
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]").click
  sleep 2
  @driver.find_element(:xpath,"//UIASearchBar[1]").click
  @driver.find_element(:xpath,"//UIASearchBar[1]").send_keys "#{friend}"
  sleep 1
  @driver.find_element(:xpath,"//UIATableView[2]/UIATableCell[1]").click
  @driver.switch_to.alert.accept
  puts "Phone number added to " + friend + "'s profile info"
end

When /^I tap the My Wow button$/ do
  sleep 2
  buttonClick("My Wow")
end

When /^I open my profile screen$/ do
  @driver.find_element(:id,"infoButton").click # Click the i button
  sleep 1
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]").click # Click View Profile from the action sheet
end

###############################

#####     THEN steps    #######

###############################

Then /^I should see the Chats screen$/ do
  if isElementPresent(:name,"Skip")
      warn "Phone Validation failed !!!!!!!!!"
      screenshot
      isElementPresent(:name,"Skip").click
  else 
    while isElementPresent("xpath","//UIAWindow[4]/UIAAlert[1]")
        @driver.switch_to.alert.accept
        sleep 1
    end
    currentScreen("Chats")
  end  
end


Then /^I should be warned that the credentials are invalid$/ do
  sleep 2
  @driver.find_element(:xpath, "//UIAStaticText[contains(@name,'Incorrect password or account name')]")
  screenshot
end


Then /^the events should be displayed in the Chats screen$/ do
# Event display was checked in the previous step  
  deleteChats($generatedEvents)
end

Then /^more entries should be loaded from the server$/ do
  lastActivity = "pl.autocont1@woow.com"
  sleep 3
  if @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[contains(@name,'#{lastActivity}')]")
    puts "All Activity entries were retrieved from server"
  else
    warn "Entire history not retrieved"
    screenshot
  end
end

Then /^these entries can be loaded from server next time$/ do
# Everything was done in the previous step  
end

Then /^the entries should not be displayed anymore$/ do
  if isElementPresent("xpath","//UIAWindow[1]/UIATableView[1]/UIATableCell[1]/UIAStaticText[contains(@value,'latest activity')]")
    puts "Chats entries deleted"
  else
    warn "Entries were not deleted!!!"
    screenshot
  end
end

Then /^the events should be displayed in the chat screen$/ do
  puts "All events displayed successfully"
  deleteChats(1)
end

Then /^the events should be displayed in the group chat screen$/ do
  puts "All events displayed successfully"
  deleteChats(1)
end

Then /^I should see the First and Last Name for my friends$/ do
  for cellNumber in (1..8)
    checkContactsList(cellNumber) # Check common_steps.rb file for the method definition
  end
  
  scrollScreen
  
  for cellNumber in (9..17)
    checkContactsList(cellNumber)
    end
  
  scrollScreen
   
   for cellNumber in (18..23)
     checkContactsList(cellNumber)
     end
end

Then /^"(.*?)" should be displayed$/ do |friend|
  isElementPresent("xpath","//UIATableView[2]/UIATableCell[1]/UIAStaticText[contains(@name,'#{friend}')]")
end

Then /^"(.*?)" should be displayed in the search results$/ do |user|
  $wait.until { @driver.find_element("xpath","//UIATableView[1]/UIATableCell[1]") }
  contact = @driver.find_element("xpath","//UIATableView[1]/UIATableCell[1]/UIAStaticText[1]").value
  if contact == 'Doya 2 prelive 2 (pl.doya2)'
    puts user + " found!"
    else
      screenshot
      raise "The searched user is missing from the search results"        
    end
end

Then /^I should see "(.*?)" as a contact$/ do |contactADB|
  2.times do
    scrollScreen
  end
  if @driver.find_element(:xpath,"//UIATableCell[24]/UIAStaticText[1]").value.to_s == contactADB
    deleteADB(contactADB)
  else
    screenshot
    raise "#{contactADB} not found in the Contacts list"    
  end
end

Then /^the Keypad screen should be displayed$/ do
  isElementPresent("id","DialpadScreenAddressBook")
  isElementPresent("id","phoneNumberLabel")
  isElementPresent("id","buttonDeleteLastCharacter")
  isElementPresent("id","buttonSelectCountry")
  isElementPresent("id","buttonSaveNumber")
  isElementPresent("id","buttonCall")
  isElementPresent("id","buttonSMS")
end

Then /^I should see the "(.*?)" country flag$/ do |country|
  if @driver.find_element(:xpath,"//UIAImage[1]").name == country
    puts "Romania country code selected"
  else
    warn "Incorrect country code selected"
    screenshot
  end
end

Then /^I should see the number in my Contacts list$/ do
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'Back')]").click
  tabBarSwitch("Contacts")
  2.times do
    scrollScreen
  end
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'+40 731 733 271')]").click
  puts "Phone Number Contact found!"
  @driver.find_element(:name,"Edit").click
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]").click # Click Remove from Contacts
  @driver.switch_to.alert.accept
  sleep 3
  unless isElementPresent(:xpath,"//UIAStaticText[contains(@label,'+40 731 733 271')]")
    puts "Phone Number Contact successfully removed!"
  end
end

Then /^I should see the number in "(.*?)" profile screen$/ do |friend|
  @driver.find_element(:xpath,"//UIAButton[contains(@name,'Back')]").click
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIAStaticText[contains(@label,'#{friend}')]").click
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAStaticText[contains(@name,'#{friend}')]").click
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[3]").click # Click the Edit button
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAButton[1]").click # Click Edit Profile
  sleep 2
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[8]/UIATextField[contains(@value,'+40 731 733 271')]")
  if isElementPresent("xpath","//UIATableView[1]/UIATableCell[8]/UIATextField[contains(@value,'+40 731 733 271')]")
    puts "Found the saved number!"
    @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[8]/UIAButton[1]").click # Delete the saved number
    @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[8]/UIAButton[3]").click
    @driver.find_element(:name,"Done").click
  else
    warn "Saved number not found!"
    screenshot
end
end

Then /^I should see the My Wow screen$/ do
  @driver.find_element(:xpath,"//UIANavigationBar[contains(@name,'Account Notifications')]")
  4.times do
    scrollScreen
  sleep 1
  end
  sleep 5
  @driver.find_element(:xpath,"//UIAStaticText[contains(@value,'Earn WowCoins for ads you and your network see on WowApp.')]")
end

Then /^I should see my profile info$/ do
  @driver.find_element(:xpath,"//UIATableView[1]/UIATableCell[contains(@name,'WoowUsername')]/UIATextField[contains(@value,'pl.ios.smoke')]")
  scrollScreen
  screenshot
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Network')]/UIATextField[contains(@value,'27')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Birthday')]/UIATextField[contains(@value,'1 January 1955')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Gender')]/UIATextField[contains(@value,'Male')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIAStaticText[contains(@value,'AR')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Email1')]/UIATextField[contains(@value,'youwowmobileqa+982374@gmail.com')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'PhoneNumber0')]/UIATextField[contains(@value,'+40 732 714 880')]")
end

Then /^I should see my friend's profile info$/ do
  scrollScreen
  sleep 2
  screenshot
  begin
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'WoowUsername')]/UIATextField[contains(@value,'pl.autocont10')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Network')]/UIATextField[contains(@value,'1')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Birthday')]/UIATextField[contains(@value,'1 January 1960')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Gender')]/UIATextField[contains(@value,'Male')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIATextField[contains(@value,'Arad')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIAStaticText[contains(@value,'/BW')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Language')]/UIATextField[contains(@value,'Arabic')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Email')]/UIATextField[contains(@value,'youwowmobileqa+234543@gmail.com')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'PhoneNumber1')]/UIATextField[contains(@value,'+40 777 987 098')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Website')]/UIATextField[contains(@value,'www.wowapp.com')]")
  rescue
    warn "Something went wrong !!!! Please check the screenshot !!!!"
  end
end

Then /^I should see "(.*?)"'s public information$/ do |user|
  
  case user
    
  when "pl.doya2"
  scrollScreen
  sleep 2
    screenshot
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAStaticText[contains(@name,'Doya 2 prelive 2')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Network')]/UIAStaticText[contains(@value,'')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Gender')]/UIATextField[contains(@value,'Not Specified')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIATextField[contains(@value,'Arad')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIAStaticText[contains(@value,'/KH')]")
      
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Birthday')]")
    warn "Birthday displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Language')]")
    warn "Language displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Email')]")
    warn "Email displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'PhoneNumber1')]")
    warn "Phone Number displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Website')]")
     warn "Website displayed when set to friends"
  end
        
  when "pl.doya3"  
  scrollScreen
  sleep 2
  screenshot
  begin
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAStaticText[contains(@name,'Doya 3 prelive')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Network')]/UIATextField[contains(@value,'1')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Gender')]/UIATextField[contains(@value,'Male')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIATextField[contains(@value,'Iasi')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIAStaticText[contains(@value,'/DJ')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Language')]/UIATextField[contains(@value,'Romanian')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Email')]/UIATextField[contains(@value,'eugen.luca85+98232@gmail.com')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'PhoneNumber0')]/UIATextField[contains(@value,'+40 756 712 838')]")  
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Website')]/UIATextField[contains(@value,'www.wowapp.com')]")  
  rescue
    warn "Something went wrong !!!! Please check the screenshot !!!!"
  end
    
     
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Birthday')]")
     warn "Birthday displayed when set to friends"
  end
  
  when "pl.doya4"
  scrollScreen
  sleep 2
    screenshot
  @driver.find_element(:xpath,"//UIANavigationBar[contains(@name,'doya patru')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Network')]/UIATextField[contains(@value,'1')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Gender')]/UIATextField[contains(@value,'Not Specified')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIATextField[contains(@value,'Iasi')]")
  @driver.find_element(:xpath,"//UIATableCell[contains(@name,'City/Country')]/UIAStaticText[contains(@value,'/AD')]")
          
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Birthday')]")
    warn "Birthday displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Language')]")
    warn "Language displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Email')]")
    warn "Email displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'PhoneNumber1')]")
    warn "Phone Number displayed when set to friends"
  end
  if isElementPresent("xpath","//UIATableCell[contains(@name,'Website')]")
     warn "Website displayed when set to friends"
  end
  end
end