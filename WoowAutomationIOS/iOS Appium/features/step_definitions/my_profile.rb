#########
# GIVEN #
#########

Given /^I am in My Profile screen$/ do
    step 'I am in the Chats screen on the "first" device'
    step 'I go to Menu screen'
    step 'I open my profile screen'
  end
  
Given /^I have a custom Avatar set$/ do
  sleep 30
  avatar = isElementPresent("xpath", "//UIATableView[1]/UIAImage[1]")

  if avatar   
    puts "Custom avatar set!" 
  else
    puts "Custom avatar not set! Taking too long to load." 
  end
end

Given /^I have the Initials Avatar set$/ do
  sleep 30
    noAvatar = isElementPresent("xpath", "//UIATableView[1]/UIAStaticText[1]")
    
    if noAvatar
        puts "No custom avatar"
    else
      puts "Custom avatar present! Taking too long to delete!"
    end
  end

##########
#  WHEN  #
##########
  
When /^I tap the Edit button$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click
end

When /^I tap the Avatar button$/ do
  @driver.find_element(:xpath, "//UIATableCell[1]/UIAStaticText[1]").click
end

When /^I set the custom avatar using camera$/ do 
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  @driver.find_element(:xpath, "//UIATableCell[1]/UIAStaticText[1]").click #tap Avatar
  @driver.find_element(:xpath, "//UIACollectionCell[1]/UIAButton[1]").click #tap Take Photo
  sleep 2
  screenshot
  while isElementPresent("xpath", "//UIAAlert[1]")
    @driver.switch_to.alert.accept
  end
  @driver.find_element(:xpath, "//UIAWindow[1]/UIAButton[6]").click #tap Take Picture
  @driver.find_element(:xpath, "//UIAWindow[1]/UIAButton[4]").click #tap Use Photo
  @driver.find_element(:name, "imagePreview") #check if avatar crop screen is present
  2.times do 
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done buttons
  end
end

When /^I tap View Photo$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  @driver.find_element(:xpath, "//UIATableCell[1]/UIAStaticText[1]").click #tap Avatar
  @driver.find_element(:xpath, "//UIACollectionView[1]/UIACollectionCell[3]").click #taps View Photo
end

When /^I delete my custom avatar$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  @driver.find_element(:xpath, "//UIATableCell[1]/UIAStaticText[1]").click #tap Avatar
  @driver.find_element(:xpath, "//UIACollectionCell[4]/UIAButton[1]").click #tap Delete Photo
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done button
end

When /^I set the custom avatar from gallery$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  @driver.find_element(:xpath, "//UIATableCell[1]/UIAStaticText[1]").click #tap Avatar
  @driver.find_element(:xpath, "//UIACollectionCell[2]/UIAButton[1]").click #tap the Choose Existing
  @driver.find_element(:xpath, "//UIATableCell[contains(@name,'Favorites')]/UIAStaticText[1]").click #tap the Favorites album
  @driver.find_element(:xpath, "//UIACollectionView[1]/UIACollectionCell[1]").click #tap the first photo
  2.times do 
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done buttons
  end
end

When /^I change my First Name$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  $currentFN = @driver.find_element("xpath", "//UIATableCell[2]/UIATextField[1]").value #returns the first name
  puts $currentFN
  @driver.find_element(:xpath, "//UIATableCell[2]/UIATextField[1]").click #taps the First Name
  $currentFN.length.to_i.times { @driver.find_element(:name,"Delete").click }
  partFN = Time.now.strftime("%j%H%M").to_s #gets the day of the year and the hour/minute
      $newFN = 'A' + "#{partFN}"
      @driver.find_element(:xpath, "//UIATableCell[2]/UIATextField[1]").send_keys "#{$newFN}" #types the new First Name
end

When /^I change my Last Name$/ do
  $currentLN = @driver.find_element(:xpath, "//UIATableCell[3]/UIATextField[1]").value #returns last name
      puts $currentLN
  @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[3]").click #taps the last name field
  $currentLN.length.to_i.times { @driver.find_element(:name,"Delete").click }
  partLN = Time.now.strftime("%j%H%M").to_s #gets the day of the year and the hour/minute
  $newLN = 'B' + "#{partLN}"
  @driver.find_element(:xpath, "//UIATableCell[3]/UIATextField[1]").send_keys "#{$newLN}" #types the new Last Name
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
end
  
When /^I delete my first name and try to save$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  $currentFN = @driver.find_element("xpath", "//UIATableCell[2]/UIATextField[1]").value #returns the first name
  puts $currentFN
  @driver.find_element(:xpath, "//UIATableCell[2]/UIATextField[1]").click #taps the First Name
  $currentFN.length.to_i.times { @driver.find_element(:name,"Delete").click }
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
end

When /^I delete my last name and try to save$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  $currentLN = @driver.find_element(:xpath, "//UIATableCell[3]/UIATextField[1]").value #returns last name
        puts $currentLN
  @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[3]").click #taps the Last Name
  $currentLN.length.to_i.times { @driver.find_element(:name,"Delete").click }
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
end

When /^I change my birthday to a previous day$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  $oldBDay = @driver.find_element(:xpath, "//UIATableCell[4]/UIAStaticText[contains(@name,'1 January 1950')]").name
  puts $oldBDay
  @driver.find_element(:xpath, "//UIATableCell[4]/UIAStaticText[1]").click #tap Birthday
  sleep 2
  @driver.execute_script("mobile: scroll" , :start_x => 91, :start_y => 570, :end_x => 90, :end_y => 591)
  @driver.find_element(:xpath, "//UIAToolbar[1]/UIAButton[2]").click #taps the avatar picker's done
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
end


##########
#  THEN  #
##########


Then /^I see the Edit Profile screen$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[contains(@name, 'Edit Profile')]")
end
  
Then /^I should see the Edit button$/ do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]")
end

Then /^I should see the WowApp Action Sheet$/ do
  firstOption = @driver.find_element(:xpath, "//UIACollectionCell[1]/UIAButton[1]").name
  puts "Button " +firstOption+ " found!" if firstOption == 'Take Photo'

  secondOption = @driver.find_element(:xpath, "//UIACollectionCell[2]/UIAButton[1]").name
  puts "Button " +secondOption+ " found!" if secondOption == 'Choose Existing'

  begin
      if (thirdOption == 'View Photo')&&(fourthOption == 'Delete Photo')
       puts "Custom avatar is present" 
       end
       
  thirdOption = @driver.find_element(:xpath, "//UIACollectionCell[3]/UIAButton[1]").name
  puts "Button " +thirdOption+ " found!" if thirdOption == 'View Photo'
  
  fourthOption = @driver.find_element(:xpath, "//UIACollectionCell[4]/UIAButton[1]").name
  puts "Button " +fourthOption+ " found!" if fourthOption == 'Delete Photo'
   
  rescue  
    puts "Custom avatar is not present"
  end 
end

Then /^I should see a custom Avatar$/ do
  sleep 20
    avatar = isElementPresent("xpath", "//UIAImage[1]")
  
    if avatar   
      puts "Custom avatar set!" 
    else
      puts "Custom avatar not set! Taking too long to load." 
    end
end

Then /^I should view a photo$/ do
  @driver.find_element(:xpath, "//UIAImage[1]")
  @driver.find_element(:name, "dismissButton")
end

Then /^I should see the Initials Avatar$/ do
  sleep 20
  noAvatar = isElementPresent("xpath", "//UIAStaticText[1]")
  
  if noAvatar
      puts "No custom avatar"
  else
    puts "Custom avatar present! Taking too long to delete!"
  end
end
  
Then /^I should see the new name$/ do
  @oldName = $currentFN + " " + $currentLN
  puts @oldName
  sleep 10
  @newName = @driver.find_element(:xpath, "//UIANavigationBar[1]").name
  puts @newName
  if @oldName == @newName
    warn "Name not changed"
  else
    puts "Name changed successfully"
  end
end

Then /^I should see an error$/ do
  @driver.find_element(:xpath, "//UIAScrollView[1]/UIAStaticText[contains(@name, 'First name and Last name must not be empty')]")
  @driver.switch_to.alert.accept
end

Then /^I should see the new birthday in my profile$/ do
  sleep 10
  $newBDay = @driver.find_element(:xpath, "//UIATableCell[5]/UIATextField[1]").value.to_s
  puts $newBDay
  if $oldBDay == $newBDay
    puts "Birthday NOT changed"
  else
    puts "Birthday successfully changed"
  end
end





