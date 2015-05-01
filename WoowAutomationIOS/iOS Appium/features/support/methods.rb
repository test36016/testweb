require 'rspec/expectations'
require 'selenium-webdriver'
require 'appium_lib'
require 'rubygems'
require 'etc' # used for the screenshot method to return the currently logged user

def tabBarSwitch(tabName)
  
  case tabName
    
  when "Menu"
    begin
       @driver.find_element(:xpath, "//UIATabBar[1]/UIAButton[1]").click
    rescue
       screenshot
       while isElementPresent("xpath", "//UIAAlert[1]")
          @driver.switch_to.alert.accept
          sleep 2
       end
       @driver.find_element(:xpath, "//UIATabBar[1]/UIAButton[1]").click
    end
    
  when "Chats"
       @driver.find_element(:xpath, "//UIATabBar[1]/UIAButton[2]").click
    
  when "Contacts"
    begin
       @driver.find_element(:xpath, "//UIATabBar[1]/UIAButton[3]").click
    rescue
      screenshot
      while isElementPresent("xpath", "//UIAAlert[1]")
        @driver.switch_to.alert.accept
        sleep 2
      end
      @driver.find_element(:xpath, "//UIATabBar[1]/UIAButton[3]").click
    end
    
  end
end

def isElementPresent(locatorType, element)
  case locatorType
   
  when "xpath"
    begin 
        @driver.find_element(:xpath, ""+element+"")
#        puts "#{element} is present"
        return true
      rescue  
        screenshot
#        warn "#{element} is not present"
        return false  
      end
      
  when "id"
    begin 
        @driver.find_element(:id, ""+element+"")
#        puts "#{element} is present"
        return true
      rescue 
      screenshot 
#      warn "#{element} is not present"
        return false  
      end
      
  when "name"
    begin 
      @driver.find_element(:id, ""+element+"")
#        puts "#{element} is present"
        return true
      rescue
      screenshot  
#      warn "#{element} is not present"
        return false  
      end
    end
end

def waitForElementPresent(locatorType, element)
    i=1
    while i<60
    flag = isElementPresent(locatorType, element)
    if flag==true
      break
    else
      sleep 1
      i=i+1
    end   
   end
   @element = isElementPresent(locatorType, element)
end

def elementNotPresent(locatorType, element)
  flag = isElementPresent(locatorType, element)
  assert(false == flag,"Failed due to element being displayed")
end

def typeMessage
  timeStamp = Time.now.strftime("%D - %H:%M")
  $message = "Current date #{timeStamp}"
  $wait.until { @driver.find_element(:xpath, "//UIAApplication[1]//UIATextView[1]").click }
  @driver.find_element(:xpath, "//UIAApplication[1]//UIATextView[1]").send_keys "#{$message}"
  @driver.find_element(:name, "Send").click
end

def generateChatsEvents(eventsNumber)

# Generating group chat events
  generated = 0
   
  begin   
  until generated == eventsNumber
    @driver.find_element(:id,"groupChatButton").click
    @driver.find_element(:id,"groupSubjectTextField").click
    @driver.find_element(:id,"groupSubjectTextField").send_keys "Group #{generated + 1}" #enter group topic
    @driver.find_element(:id,"contactNameTextField").send_keys "S"
    sleep 1
    @driver.find_element(:name,"Smoke iPhone").click
    @driver.find_element(:name,"Done").click
    @driver.find_element(:xpath,"//UIAButton[contains(@name,'Back')]").click
    generated += 1
    sleep 2
  end
    $generatedEvents = generated
      puts "Generated '#{$generatedEvents}' events"
  rescue    
  $generatedEvents = generated
  puts "Generated '#{$generatedEvents}' events"
    raise "Did not generate all entries. Please check!!!"
  end
end
 
def scrollScreen
  @driver.execute_script("mobile: scroll" , :start_x => 155, :start_y => 385, :end_x => 161, :end_y => 99)
end

def checkContactsList(cellNumber)
  contact  = read_config(cellNumber)
      if @driver.find_element(:xpath,"//UIATableCell[#{cellNumber}]/UIAStaticText[1]").value.to_s == contact
        puts contact + " found!"
      else
        warn contact + " not found!!!"
      end
end
 
def loadMoreActivity(pagesNumber)
  until pagesNumber <=0
    sleep 1
    scrollScreen
    pagesNumber -= 1
    sleep 2
  end
end 

def deleteChats(eventsNumber)
  sleep 1
  @driver.find_element(:name,"Edit").click
  
  eventsNumber.times do
  sleep 1
  @driver.find_element(:xpath,"//UIATableCell[1]/UIAButton[1]").click
  @driver.find_element(:xpath,"//UIATableCell[1]/UIAButton[2]").click
  end
    puts "All " + eventsNumber.to_s + " Chats entries were deleted"  
  
end

def deleteADB(name)
  @driver.find_element(:xpath,"//UIATableCell/UIAStaticText[contains(@value,'#{name}')]").click
  @driver.find_element(:name,"Edit").click
  @driver.find_element(:xpath,"//UIAWindow[4]/UIAActionSheet[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]").click # Click the Remove option in the action sheet
  @driver.switch_to.alert.accept
end

def devalidateAccount
  @driver.find_element(:name,"Edit").click
  sleep 1
  scrollScreen
  @driver.find_element(:xpath,"//UIATableCell[8]/UIAButton[1]").click
  @driver.find_element(:xpath,"//UIATableCell[8]/UIAButton[3]").click
  @driver.switch_to.alert.accept
  @driver.find_element(:name,"Done").click
  $wait.until { @driver.find_element(:id,"labelCountryName") }
end

#def screenshot
#  name = Time.now.strftime("%Y%m%d%H%M")
#  loggedUser = Etc.getlogin 
#  @driver.save_screenshot("/Users/#{loggedUser}/Desktop/screenshots/#{name}.png")
#  puts "Saved screenshot: " + name + ".png"
#end

def screenshot
  name = Time.now.strftime("%d_%m_%Y_%H_%M_%S")
  @driver.save_screenshot(absolute_image_path+"/#{name}.png")
  puts "Saved screenshot: " + name + ".png"
end

def validateAccountWithNumber(number)
  if $realDevice
      sleep 10
      countryCode = @driver.find_element(:id,"textFieldCountryCode").value
      if countryCode.to_s == '+40'
        @driver.find_element(:id,"textFieldPhoneNumber").send_keys number
        else
      warn "Default country code not displayed" 
        screenshot
      end
    sleep 1
    @driver.find_element(:xpath,"//UIAWindow[2]/UIANavigationBar[1]/UIAButton[2]").click # Done button
    sleep 1
    @driver.switch_to.alert.accept
    sleep 30
    
      if isElementPresent("xpath","//UIAWindow[4]/UIAAlert[1]/UIAScrollView[1]/UIAStaticText[contains(@name,'Your number has been validated and was assigned as your Caller ID')]")
          warn "Number validated without a validation code!!!!"
          @driver.switch_to.alert.accept
          else
            $wait.until { @driver.find_element(:xpath, "//UIAAlert[1]/UIAScrollView[1]/UIAStaticText[2]") }
            smsText = ''
            smsText = @driver.find_element(:xpath, "//UIAAlert[1]/UIAScrollView[1]/UIAStaticText[2]").value
            smsText.slice! "Hi from YouWowMe! Here is the code you requested: "
            validationCode = smsText.slice(0..4).chop # Get the first 4 characters -> validation code
            @driver.switch_to.alert.dismiss
            sleep 1
            puts "The validation code is: " + validationCode
            @driver.find_element(:id,"textFieldCode").send_keys validationCode
            sleep 3
            @driver.find_element(:xpath,"//UIAWindow[4]/UIAAlert[1]/UIAScrollView[1]/UIAStaticText[contains(@name,'Your number has been validated and was assigned as your Caller ID')]")
            @driver.switch_to.alert.accept
      end
      
  else warn "Cannot validate account on simulator!!!"
  end
end

def currentScreen(screen) #verifies the screen

  case screen
    
  when "Menu"
    unless menuButton("My Wow").displayed? and menuButton("Send Invite").displayed? and menuButton("Keypad").displayed? and menuButton("Settings").displayed? and menuButton("Send Feedback").displayed? and menuButton("About").displayed?
        warn "Menu screen not displayed"
      end
      
  when "Invite"
    unless @driver.find_element(:id, "buttonViewInvites").displayed? and @driver.find_element(:id, "checkBox").displayed? and @driver.find_element(:id, "textFieldName")
        warn "Invite screen not displayed"
    end
  
  when "Chats"
    sleep 10
    unless @driver.find_element(:id,"dialpadButton").displayed? and @driver.find_element(:id,"groupChatButton").displayed?
        warn "Chats screen not displayed"
    end
  end
end

def buttonClick(button_name)
  case button_name
  ## Menu buttons ##
  when "My Wow"
    @driver.find_element(:id, "menuMyWowCell").click
          
  when "Send Invite"
    @driver.find_element(:id, "menuCellInvites").click  
      
  when "Keypad"
    @driver.find_element(:id, "menuCellKeypad").click
  
  when "Settings"
    @driver.find_element(:id, "menuCellSettings").click
    
  when "Send Feedback"
    @driver.find_element(:id, "menuCellFeedback").click
  
  when "Send" #from the Send Feedback screen    
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click
    
  when "About"
    @driver.find_element(:id, "menuCellAbout").click
  
  when "Invite"
    @driver.find_element(:id, "invitesButton").click
 ## Contacts buttons ##   
  when "+"
    @driver.find_element(:name,"nav bar add contact").click
        
  when "Search"
    @driver.find_element(:name,"nav bar search").click
        
  when "Make Calls"
    @driver.find_element(:id,"makeCalls").click 
  ## Chats buttons ##
  when "Create Group"
    @driver.find_element(:id,"groupChatButton").click
  end 
end

def cutTextInField(element)
  2.times do 
    element.click
  end
  @driver.find_element(:xpath, "//UIAWindow[4]/UIAEditingMenu[1]/UIAElement[contains(@name,'Select All')]").click
  @driver.find_element(:xpath, "//UIAWindow[4]/UIAEditingMenu[1]/UIAElement[contains(@name,'Cut')]").click
end

def callNumber(number,duration)
  @driver.find_element(:id,"dialpadButton").click
  sleep 2
  2.times do
    @driver.find_element(:id,"buttonDeleteLastCharacter").click # Deleting default country code
    sleep 1
  end
  phoneNumber = number.split ""
  phoneNumber.each do |digit|
    @driver.find_element(:name,"#{digit}").click
  end
  @driver.find_element(:id,"buttonCall").click
  while isElementPresent("xpath","//UIAAlert[1]")
        @driver.switch_to.alert.accept
  end
  sleep 5 # Waiting for the call to be answered
  if isElementPresent("id","microphoneToggle")
    sleep duration
    @driver.find_element(:id,"hangup").click
  else
    warn "Paid call not working"
    screenshot
  end
end
