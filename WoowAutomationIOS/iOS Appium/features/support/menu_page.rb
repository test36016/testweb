

def menuButton(button_name)
  case button_name

  when "My Wow"
    @driver.find_element(:name, "menuMyWowCell")
          
  when "Send Invite"
    @driver.find_element(:name, "menuCellInvites")  
      
  when "Keypad"
    @driver.find_element(:name, "menuCellKeypad")
  
  when "Settings"
    @driver.find_element(:name, "menuCellSettings")
    
  when "Send Feedback"
    @driver.find_element(:name, "menuCellFeedback")
  
  when "Send" #from the Send Feedback screen    
    @driver.find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAButton[3]")
    
  when "About"
    @driver.find_element(:name, "menuCellAbout")
    
  end
end

def menuScreen
  unless menuButton("My Wow").displayed? and menuButton("Send Invite").displayed? and menuButton("Keypad").displayed? and menuButton("Settings").displayed? and menuButton("Send Feedback").displayed? and menuButton("About").displayed?
    puts "Menu screen not displayed"
  end
end

def errorMessage(field)
  case field
    
  when "Summary"
    @driver.find_element(:xpath, "//UIAApplication[1]/UIAWindow[4]/UIAAlert[1]/UIAScrollView[1]/UIAStaticText[contains(@name,'Please write a brief summary.')]")  
  when "Description"
    $wait.until { @driver.find_element(:xpath, "//UIAApplication[1]/UIAWindow[4]/UIAAlert[1]/UIAScrollView[1]/UIAStaticText[contains(@name,'Please write a brief description.')]").displayed? }
  end
  
end