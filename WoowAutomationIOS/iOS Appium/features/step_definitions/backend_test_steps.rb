# Used devices
$firstBackendDevice = "first"
$secondBackendDevice = "third"
$thirdBackendDevice = "second"

###############################

#####    GIVEN steps    #######

###############################

Given /^the application is launched on two device$/ do
# Please check the hooks.rb file. App will launch on both devices in a Before hook    
end

Given /^I am logged in on two devices$/ do
# Please check the hooks.rb file. App will launch on both devices in a Before hook
# In the first scenario the user also logs in   
end

Given /^I am in the phone validation screen on both devices$/ do
  step "I am in the phone validation screen on \"#{$firstBackendDevice}\" and \"#{$secondBackendDevice}\" device"
end

Given /^I am in the phone validation screen on "(.*?)" and "(.*?)" device$/ do |device1,device2|
  [device1,device2].each do |device| 
  step "I select the \"#{device}\" device"
  if isElementPresent("id","textFieldCountryCode")
    puts "Phone validation screen displayed on \"#{device}\" device" 
  else
    screenshot
    raise "Phone validation screen not displayed on \"#{device}\" device" 
  end
  end
end

Given /^I am in the My Profile screen on two devices$/ do
  step "I am in the My Profile screen on \"#{$firstBackendDevice}\" and \"#{$secondBackendDevice}\" device"
end

Given /^I am in the My Profile screen on "(.*?)" and "(.*?)" device$/ do |device1,device2|
  [device1,device2].each do |device| 
  step "I select the \"#{device}\" device"
  tabBarSwitch("Menu")
  @driver.find_element(:id,"infoButton").click # Click the i button
  sleep 1
  @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click # Click View Profile from the action sheet
end
end

Given /^I am in a friend's profile screen$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIATableCell[1]/UIACollectionView[1]/UIACollectionCell[1]").click #Tap Smoke iPhone's avatar to open the profile
end

Given /^I am in a Telephone Number contact's profile screen$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIATableCell[4]").click #Tap Telephone Number contact
end

Given /^I log in on the simulator with "(.*?)" account and "(.*?)" password$/ do |username,password|
  step 'I am in the login screen on the "simulator" device'
  step "I type my username \"#{username}\" and password \"#{password}\""
  step 'I click the Sign In button'
end

Given /^I am in the Menu screen on two devices$/ do
  [$firstBackendDevice,$secondBackendDevice].each do |device| 
    step "I select the \"#{device}\" device"
    tabBarSwitch("Menu")
end
end

###############################

#####     WHEN steps    #######

###############################

When /^I log in with "(.*?)" account on both devices$/ do |account|
 step "I log in with \"#{account}\" account on \"#{$firstBackendDevice}\" and \"#{$secondBackendDevice}\" device"
end

When /^I log in with "(.*?)" account on "(.*?)" and "(.*?)" device$/ do |account,device1,device2|
  [device1,device2].each do |device| 
  step "I am in the login screen on the \"#{device}\" device"
  step "I type my username \"#{account}\" and password \"automatizare\""
  step 'I click the Sign In button'
  puts "Finished login on \"#{device}\" device!"
  end
end

When /^I go to Menu screen on both devices$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:id,"Skip").click #Click skip for phone validation
  sleep 2
  tabBarSwitch("Menu")
  puts 'Menu selected on first device!'
  step "I select the \"#{$secondBackendDevice}\" device"
  @driver.find_element(:id,"Skip").click #Click skip for phone validation
  sleep 1
  tabBarSwitch("Menu")
  puts 'Menu selected on second device!'
end

When /^I view my profile info on both devices$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  step 'I open my profile screen'
  puts 'My profile opened on first device!'
  step "I select the \"#{$secondBackendDevice}\" device"
  step 'I open my profile screen'
  puts 'My profile opened on second device!'
end

When /^I validate my account with "(.*?)" on one device$/ do |phoneNumber|
  step "I select the \"#{$firstBackendDevice}\" device"
  validateAccountWithNumber(phoneNumber)
end

When /^I delete my validated phone number on one device$/ do
  step "I select the \"#{$secondBackendDevice}\" device"
  tabBarSwitch("Menu")
  step 'I open my profile screen'
  devalidateAccount
  puts "Account devalidated on \"#{$secondBackendDevice}\" device"
end

When /^I set a custom avatar on one device$/ do
  sleep 2
  step "I select the \"#{$firstBackendDevice}\" device"
  warn '!!! Account will be validated !!!'
  step 'I validate my account with "0732714880" on one device'
  tabBarSwitch("Menu")
  step 'I open my profile screen'
  step 'I set the custom avatar using camera'
end

When /^I change the "(.*?)" on one device$/ do |myProfileInfo|
  step "I select the \"#{$firstBackendDevice}\" device"
  case myProfileInfo
  when "status message"
    tabBarSwitch("Menu")
    @driver.find_element(:id,"infoButton").click # Click the i button
    sleep 1
    @driver.find_element(:xpath,"//UIACollectionCell[3]/UIAButton[1]").click # Click Change Status from the action sheet
    sleep 1
    @driver.find_element(:xpath,"//UIATextView[1]").send_keys "This is a custom status!"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #Click Done
  when "first and last name"
    step 'I change my First Name'
    $defaultFN = "Backend"
    step 'I change my Last Name'
    $defaultLN = "Test"  
  when "birthday"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @defaultBirthday = @driver.find_element(:xpath, "//UIATableCell[4]/UIAStaticText[1]").value
    puts @defaultBirthday + " found as default birthday"
    @driver.find_element(:xpath, "//UIATableCell[4]").click  
    @driver.find_element(:xpath, "//UIAPicker[1]/UIAPickerWheel[2]").send_keys "March"
    @driver.find_element(:id, "doneButton").click
    sleep 3
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  when "gender to female"
    step "I select the \"#{$firstBackendDevice}\" device"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    gender = @driver.find_element(:xpath, "//UIATableCell[5]/UIAStaticText[1]").value
    if gender == "Male"
      @driver.find_element(:xpath, "//UIATableCell[5]").click
      @driver.find_element(:xpath, "//UIAPicker[1]/UIAPickerWheel[1]").send_keys "Female"
    elsif gender == "Female"
      @driver.find_element(:xpath, "//UIATableCell[5]").click
      @driver.find_element(:xpath, "//UIAPicker[1]/UIAPickerWheel[1]").send_keys "Male"
      warn "Default gender was Female"
    end
    @driver.find_element(:id, "doneButton").click
    sleep 3
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  when "city"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @defaultCity = @driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]").value
    puts @defaultCity + " found as default city"
    cutTextInField(@driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]"))
    @driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]").send_keys "Gaborone"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done  
  when "country"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @defaultCountry = @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[7]").name
    puts @defaultCountry + " found as default country"
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[7]").click # click the country field
    @driver.find_element(:xpath, "//UIATableView[1]/UIASearchBar[1]").click # click the search bar in the countries list
    @driver.find_element(:xpath, "//UIATableView[1]/UIASearchBar[1]").send_keys "Bot"
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[1]").click #select Botswana from the search results list
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  end
end

When /^I add "(.*?)" on one device$/ do |addInfo|
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  scrollScreen
  case addInfo
  when "a mobile number"
    @driver.find_element(:id,"Insert Add Phone").click #click add new number button 
    @driver.find_element(:xpath,"//UIATableCell[9]/UIATextField[1]").send_keys "40766111222"
    @driver.find_element(:xpath,"//UIATableCell[9]/UIAButton[2]").click #click the phone number type button
    sleep 1
    @driver.find_element(:id,"mobile").click
  when "a website"
    @driver.find_element(:xpath, "//UIATableCell[10]/UIATextField[1]").click #tap Website
    @driver.find_element(:xpath, "//UIATableCell[10]/UIATextField[1]").send_keys "www.wowapp.com"
  end
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
end

When /^I add "(.*?)" for my friend$/ do |friendInfo|
  @driver.find_element(:id,"contactMenu info").click # Click the i button
  @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click #click Edit Profile  
  case friendInfo
  when "a nickname" 
    warn "!!! Due to issue https://developer.woow.com/browse/TIOS-19 
              this step is skipped for now" 
#    @driver.find_element(:xpath,"//UIATableCell[1]").click #click the nickname field
#    @driver.find_element(:xpath,"//UIATableCell[1]/UIATextField[1]").send_keys "smokeNickname"
  when "an email"   
    @driver.find_element(:id,"Insert emailCell").click
    @driver.find_element(:id,"textFieldValue").send_keys "email@gmail.com"
  when "a phone number"  
    @driver.find_element(:id,"Insert phoneCell").click
    @driver.find_element(:id,"textFieldValue").send_keys "40732909101"
  when "notes"   
    @driver.find_element(:id,"textViewNotes").click
    @driver.find_element(:id,"textViewNotes").send_keys "Notes text added to friend's profile"
  end
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
end

When /^I add "(.*?)" for the Telephone Number contact$/ do |telephoneNumberInfo|
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click #click Edit
  case telephoneNumberInfo
  when "a nickname"
    @defaultTelephoneNumberContactName = @driver.find_element(:id,"textFieldName").value.to_s
    cutTextInField(@driver.find_element(:id, "textFieldName"))
    @driver.find_element(:id, "textFieldName").send_keys "telephoneNumberContactNickname"  
  when "an email"
    @driver.find_element(:id,"Insert emailCell").click
    @driver.find_element(:id,"textFieldValue").send_keys "email@gmail.com"
  when "a phone number"
    @driver.find_element(:id,"Insert phoneCell").click
    @driver.find_element(:xpath,"//UIATableCell[4]/UIATextField[1]").send_keys "40766101202"
  when "notes"
    warn "Due to issue https://developer.woow.com/browse/TIOS-44 this step will be implemented when the issue is fixed"
#    @driver.find_element(:xpath,"//UIATableCell[5]/UIATextView[1]").click
#    @driver.find_element(:xpath,"//UIATableCell[5]/UIATextField[1]").send_keys "Notes text for Telephone Number contact"
  end
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  @driver.switch_to.alert.accept
end

When /^I perform a paid call to "(.*?)" on one device$/ do |phoneNumber|
  step "I select the \"#{$firstBackendDevice}\" device"
  @currentCallingCredit = 0
  tabBarSwitch("Menu")
  getCurrentCreditFromMenu
  @currentCallingCredit = @credit.to_i
  puts "Current available calling credit: " + @currentCallingCredit.to_s + " cents"
  tabBarSwitch("Chats")
  callNumber("#{phoneNumber}",6)
end

When /^I search for a contact on WowApp$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  tabBarSwitch("Contacts")
  step 'I search for "pl.back3" on WowApp'
  step 'I select "pl.back3" from the search results'
end

When /^I send a friend request$/ do
  @driver.find_element(:id, "labelButtonSendContactRequest").click
  @driver.switch_to.alert.accept
end

When /^the contact accepts the friend request$/ do
  step 'I log in on the simulator with "pl.back3" account and "123456" password'
  tabBarSwitch("Contacts")
  waitForElementPresent("id","btnAccept")
  @driver.find_element(:id, "btnAccept").click
end

When /^I remove a friend from my contact's list$/ do
    step "I select the \"#{$firstBackendDevice}\" device"
    tabBarSwitch("Contacts")
    @driver.find_element(:xpath,"//UIATableCell[3]/UIACollectionView[1]/UIACollectionCell[1]/UIAStaticText[1]").click #click the new friend's avatar
    @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[3]").click # click the info button
    @driver.find_element(:xpath,"//UIACollectionCell[4]/UIAButton[1]").click # click Remove from contacts
    @driver.switch_to.alert.accept
    step 'I log in on the simulator with "pl.back3" account and "123456" password'
    tabBarSwitch("Contacts")
    @driver.find_element(:xpath,"//UIATableCell[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAStaticText[1]").click #click the new friend's avatar
    @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[3]").click # click the info button
    @driver.find_element(:xpath,"//UIACollectionCell[4]/UIAButton[1]").click # click Remove from contacts
end

When /^I change the "(.*?)" privacy to "(.*?)"$/ do |info,privacy|
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:id,"infoButton").click # Click the i button
  @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[2]").click #click Edit Privacy
  case info
  when "Birthday"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultBirthdayPrivacy = @driver.find_element(:xpath,"//UIATableCell[3]").value
    if defaultBirthdayPrivacy.to_i != 1
      warn "Default \"#{info}\" privacy not Friends"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    showYearOfBirthStatus = @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").value
    if privacy == "Friends" and showYearOfBirthStatus.to_i == 0
      @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").click #enable Show Year of Birth option
    end
    @changedInfo = info
    @changedPrivacy = privacy
  when "Gender"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultGenderPrivacy = @driver.find_element(:xpath,"//UIATableCell[2]").value
    if defaultGenderPrivacy.to_i != 1
       warn "Default \"#{info}\" privacy not Friends"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    @changedInfo = info
    @changedPrivacy = privacy
  when "Language"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultLanguagePrivacy = @driver.find_element(:xpath,"//UIATableCell[2]").value
    if defaultLanguagePrivacy.to_i != 1
       warn "Default \"#{info}\" privacy not Friends"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    @changedInfo = info
    @changedPrivacy = privacy
  when "Awards"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultAwardsPrivacy = @driver.find_element(:xpath,"//UIATableCell[1]").value
    if defaultAwardsPrivacy.to_i != 1
       warn "Default \"#{info}\" privacy not Public"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    @changedInfo = info
    @changedPrivacy = privacy
  when "Network"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultNetworkPrivacy = @driver.find_element(:xpath,"//UIATableCell[1]").value
    if defaultNetworkPrivacy.to_i != 1
       warn "Default \"#{info}\" privacy not Public"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    @changedInfo = info
    @changedPrivacy = privacy
  when "Email"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultEmailPrivacy = @driver.find_element(:xpath,"//UIATableCell[3]").value
    if defaultEmailPrivacy.to_i != 1
       warn "Default \"#{info}\" privacy not Friends"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    @changedInfo = info
    @changedPrivacy = privacy
  when "Phone Number"
    puts "Changing \"#{info}\" privacy to \"#{privacy}\""
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    defaultPhoneNumberPrivacy = @driver.find_element(:xpath,"//UIATableCell[2]").value
    if defaultPhoneNumberPrivacy.to_i != 1
       warn "Default \"#{info}\" privacy not Friends"
    end
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{privacy}')]").click
    @changedInfo = info
    @changedPrivacy = privacy
  end
end

###############################

#####     THEN steps    #######

###############################

Then /^I should see the same profile info on both devices$/ do
  step "I should see the same profile info on \"#{$firstBackendDevice}\" and \"#{$secondBackendDevice}\" device"
end

Then /^I should see the same profile info on "(.*?)" and "(.*?)" device$/ do |device1,device2|
    [device1,device2].each do |device|  
    step "I select the \"#{device}\" device"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'WoowUsername')]/UIATextField[contains(@value,'pl.ios.backend')]")
    puts "Profile info checked on \"#{device}\" device!"
    end
end

Then /^the validation screen should be dismissed on both devices$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  currentScreen("Chats")
  puts "Phone validation successful on \"#{$firstBackendDevice}\" device"
  
  step "I select the \"#{$secondBackendDevice}\" device"
  currentScreen("Chats")
  puts "Phone validation successful on \"#{$secondBackendDevice}\" device"
end

Then /^I should see the phone validation screen on both devices$/ do
# Validation screen presence checked in the devalidateAccount method for the other device
    step "I select the \"#{$firstBackendDevice}\" device"
    @driver.find_element(:id,"labelCountryName")
    puts "Account devalidated on \"#{$firstBackendDevice}\" device"
end

Then /^the avatar will change on both devices$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  step 'I have a custom Avatar set'
  
  step "I select the \"#{$secondBackendDevice}\" device"
  tabBarSwitch("Menu")
  step 'I open my profile screen'
  step 'I have a custom Avatar set'
end

Then /^my friend checks my profile$/ do
  step "I select the \"#{$thirdBackendDevice}\" device"
  step "I am in the login screen on the \"#{$thirdBackendDevice}\" device"
  step 'I type my username "pl.back1" and password "123456"'
  step 'I click the Sign In button'
  sleep 10
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[contains(@label,'Backend Test')]")
end

Then /^my friend will see the custom avatar$/ do
      if isElementPresent("xpath","//UIATableCell[1]/UIACollectionView[1]/UIACollectionCell[1]/UIAImage[1]")
        puts "Custom avatar found on friend device"
      else
        screenshot
        warn "Custom avatar not found on friend device"
      end
  step "I select the \"#{$firstBackendDevice}\" device"
  step 'I delete my custom avatar'
  step 'I have the Initials Avatar set'
end

Then /^my friends should see the "(.*?)"$/ do |info|
  step "I select the \"#{$thirdBackendDevice}\" device"
  sleep 5
  tabBarSwitch("Contacts")
  sleep 3
  begin
  case info
  when "status message"
#    tabBarSwitch("Contacts")
#    @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]/UIAStaticText[contains(@label,'BT')]").click #click the avatar of Backend Test
  warn "For now the text for custom message cannot be obtained"
  when "new first and last name"
    friendName = $newFN.to_s + " " + $newLN.to_s
    puts friendName
    if friendName == @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").value.to_s
       puts "First and last names changed on the friend device"
    else
       screenshot
       warn "First and last names did not changed on the friend device !!!"
    end
  when "new birthday"
    @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]/UIAStaticText[1]").click #click the avatar of Backend Test
    scrollScreen
    friendBirthday = @driver.find_element(:xpath,"//UIATableCell[5]/UIATextField[1]").value
    if friendBirthday.to_s == "1 March 1970"
       puts "Birthday changed on the friend device"
    else
       screenshot
       warn "Birthday did not changed on the friend device !!!"
    end
  when "new gender"
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAStaticText[1]").click #click the avatar of Backend Test
    scrollScreen
    friendGender = @driver.find_element(:xpath,"//UIATableCell[6]/UIATextField[1]").value
    if friendGender.to_s == "Female"
       puts "Gender changed on the friend device"
    else
       screenshot
       warn "Gender did not changed on the friend device !!!"
    end
  when "new city"
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAStaticText[1]").click #click the avatar of Backend Test
    scrollScreen
    friendCity = @driver.find_element(:xpath,"//UIATableCell[7]/UIATextField[1]").value
    if friendCity.to_s == "Gaborone"
       puts "City changed on the friend device"
    else
       screenshot
       warn "City did not changed on the friend device !!!"
    end
  when "new country"
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAStaticText[1]").click #click the avatar of Backend Test
    scrollScreen
    friendCountry = @driver.find_element(:xpath,"//UIATableCell[7]/UIAStaticText[2]").value
    if friendCountry.to_s == "/BW"
       puts "Country changed on the friend device"
    else
       screenshot
       warn "Country did not changed on the friend device !!!"
    end
  when "new mobile number"
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAStaticText[1]").click #click the avatar of Backend Test
    scrollScreen
    friendNumber = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'PhoneNumber2')]/UIATextField[1]").value
    if friendNumber.to_s == "+40 766 111 222"
       puts "New number displayed on the friend device"
    else
       screenshot
       warn "New number not displayed on the friend device !!!"
    end
  when "website"
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAStaticText[1]").click #click the avatar of Backend Test
    scrollScreen
    friendWebsite = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Website')]/UIATextField[1]").value
    if friendWebsite.to_s == "www.wowapp.com"
       puts "Website displayed on the friend device"
    else
       screenshot
       warn "Website not displayed on the friend device !!!"
    end
  end
  rescue
    warn "Step failed, please check !!!"
  end
end

Then /^I should see the "(.*?)" on the second device$/ do |info|
  step "I select the \"#{$secondBackendDevice}\" device"
  case info
  when "status message"
    warn 'Custom status field value is not the correct one.'
    tabBarSwitch("Menu")
    @driver.find_element(:id,"infoButton").click # Click the i button
    sleep 1
    @driver.find_element(:xpath,"//UIACollectionCell[3]/UIAButton[1]").click # Click Change Status from the action sheet
    sleep 1
    customStatus = @driver.find_element(:xpath,"//UIATextView[1]").value
    if customStatus == "This is a custom status!"
      puts "Custom status found on \"#{$secondBackendDevice}\" device"
    else
      screenshot
      warn "Custom status not found on \"#{$secondBackendDevice}\" device"
    end
    @driver.find_element(:xpath,"//UIATextView[1]").click
    cutTextInField(@driver.find_element(:xpath,"//UIATextView[1]"))
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #Click Done
  when "first and last name change"
    begin
    puts "The second device should display First Name: \"#{$newFN}\" and Last Name: \"#{$newLN}\""
    sleep 15
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @firstName = @driver.find_element("xpath", "//UIATableCell[2]/UIATextField[1]").value
    puts "First Name: " + @firstName
    @lastName = @driver.find_element(:xpath, "//UIATableCell[3]/UIATextField[1]").value
    puts "Last Name: " + @lastName
    if @firstName == $newFN and @lastName == $newLN
      puts "First and last names changed on the \"#{$secondBackendDevice}\" device"
      setDefault("Names")
    else
      screenshot
      warn "First and last names did not changed on the \"#{$secondBackendDevice}\" device!!"
      setDefault("Names")
    end
    rescue
      setDefault("Names")
      raise "Entered rescue block !!!!"
    end
  when "birthday change"
    begin
    sleep 15
    scrollScreen
    newBirthday = @driver.find_element(:xpath, "//UIATableCell[5]/UIATextField[1]").value
      if newBirthday.to_s == "1 March 1970"
         puts "Birthday changed on the \"#{$secondBackendDevice}\" device"
         setDefault("Birthday")
      else
         screenshot
         warn "Birthday did not changed on the \"#{$secondBackendDevice}\" device!!"
         setDefault("Birthday")
      end
    rescue
      setDefault("Birthday")
      raise "Entered rescue block !!!!"
    end
    sleep 5
  when "female gender"
    begin
    sleep 15
    scrollScreen
    newGender = @driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]").value
      if newGender.to_s == "Female"
        puts "Gender changed on the \"#{$secondBackendDevice}\" device"
        setDefault("Gender")
      else
        screenshot
        warn "Gender did not changed on the \"#{$secondBackendDevice}\" device!!"
        setDefault("Gender")
      end
    rescue
      setDefault("Gender")
      raise "Entered rescue block !!!!"
    end
      sleep 5
  when "city"
    begin
    sleep 15
    scrollScreen
    newCity = @driver.find_element(:xpath, "//UIATableCell[7]/UIATextField[1]").value
    if newCity.to_s == "Gaborone"
      puts "City changed on the \"#{$secondBackendDevice}\" device"
      setDefault("City")
    else
      screenshot
      warn "City did not changed on the \"#{$secondBackendDevice}\" device!!"
      setDefault("City")
    end
    rescue
      setDefault("City")
      raise "Entered rescue block !!!!"
    end
  when "country"
    begin
    sleep 15
    scrollScreen
    newCountry = @driver.find_element(:xpath, "//UIATableCell[7]/UIAStaticText[2]").value
    if newCountry.to_s == "/BW"
      puts "Country changed on the \"#{$secondBackendDevice}\" device"
      setDefault("Country")
    else
      screenshot
      warn "Country did not changed on the \"#{$secondBackendDevice}\" device!!"
      setDefault("Country")
    end
    rescue
      setDefault("Country")
      raise "Entered rescue block !!!!"
    end
  when "mobile number"
    begin
    sleep 15
    scrollScreen
    newPhone = @driver.find_element(:xpath, "//UIATableCell[contains(@name,'PhoneNumber1')]/UIATextField[1]").value
    if newPhone.to_s == "+40 766 111 222"
       puts "New phone number is displayed on the \"#{$secondBackendDevice}\" device"
       deleteAddedPhone
    else
       screenshot
       warn "New phone number is not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteAddedPhone
    end
    rescue
      deleteAddedPhone
      raise "Entered rescue block !!!!"
    end
  when "website"
    begin
    sleep 15
    scrollScreen
    @website = @driver.find_element(:xpath, "//UIATableCell[contains(@name,'Website')]/UIATextField[1]").value
    if @website.to_s == "www.wowapp.com"
       puts "Website is displayed on the \"#{$secondBackendDevice}\" device"
       deleteWebsite
    else
       screenshot
       warn "Website is not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteWebsite
    end
    rescue
      deleteWebsite
      raise "Entered rescue block !!!!"
    end
  when "nickname"
    warn "!!! Due to issue https://developer.woow.com/browse/TIOS-19 
              this step is skipped for now" 
#    tabBarSwitch("Contacts")
#    friend = @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[1]").value 
#    if friend.to_s == "smokeNickname"
#       puts "Nickname is displayed on the \"#{$secondBackendDevice}\" device"
#       deleteFriendInfo(info)
#    else
#       screenshot
#       warn "Nickname is not displayed on the \"#{$secondBackendDevice}\" device!!"
#       deleteFriendInfo(info)
#    end
  when "email"
    begin
    tabBarSwitch("Contacts")
    @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click #Tap Backend Contul 1's avatar to open the profile
    @driver.find_element(:id,"contactMenu info").click # Click the i button
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click #click Edit Profile  
    friendAddedEmail = @driver.find_element(:xpath,"//UIATableCell[3]/UIATextField[1]").value
    if friendAddedEmail.to_s == "email@gmail.com"
       puts "Email: " + friendAddedEmail + " is displayed on the \"#{$secondBackendDevice}\" device"
      deleteFriendInfo(info)
    else
       screenshot
       warn "Email: " + friendAddedEmail + " is not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteFriendInfo(info)
    end
    rescue
      deleteFriendInfo(info)
      raise "Entered rescue block !!!!"
    end
  when "phone number"
    begin
    tabBarSwitch("Contacts")
    @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click #Tap Backend Contul 1's avatar to open the profile
    scrollScreen
    friendAddedPhone = @driver.find_element(:xpath,"//UIATableCell[11]/UIATextField[1]").value
    if friendAddedPhone.to_s == "+40 732 909 101"
       puts "Phone Number: " + friendAddedPhone + " is displayed on the \"#{$secondBackendDevice}\" device"
       deleteFriendInfo(info)
    else
       screenshot
       warn "Phone Number: " + friendAddedPhone + " is not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteFriendInfo(info)
    end
    rescue
      deleteFriendInfo(info)
      raise "Entered rescue block !!!!"
    end
  when "notes"
    begin
    tabBarSwitch("Contacts")
    @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click #Tap Backend Contul 1's avatar to open the profile
    @driver.find_element(:id,"contactMenu info").click # Click the i button
    @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click #click Edit Profile  
    friendAddedNotes = @driver.find_element(:xpath,"//UIATableCell[6]/UIATextView[1]").value
    if friendAddedNotes.to_s == "Notes text added to friend's profile"
       puts "Notes displayed on the \"#{$secondBackendDevice}\" device"
       deleteFriendInfo(info)
    else
       screenshot
       warn "Notes not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteFriendInfo(info)
    end
    rescue
      deleteFriendInfo(info)
      raise "Entered rescue block !!!!"
    end
  end
end

Then /^I should see the contact's "(.*?)" on the second device$/ do |info|
  step "I select the \"#{$secondBackendDevice}\" device"
  tabBarSwitch("Contacts")
  case info
  when "nickname"
    begin
    adbNickname = @driver.find_element(:xpath,"//UIATableCell[4]/UIAStaticText[1]").value
    if adbNickname.to_s == "telephoneNumberContactNickname"
       puts "Telephone Number contact's nickname displayed on the \"#{$secondBackendDevice}\" device"
       deleteTelephoneNumberContactInfo(info)
    else
       screenshot
       warn "Telephone Number contact's nickname not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteTelephoneNumberContactInfo(info)
    end
    rescue
      deleteTelephoneNumberContactInfo(info)
      raise "Entered rescue block !!!!"
    end
  when "email"
    begin
    @driver.find_element(:xpath,"//UIATableCell[4]").click #Tap Telephone Number contact
    adbEmail = @driver.find_element(:xpath,"//UIATableCell[1]/UIATextField[1]").value
    if adbEmail.to_s == "email@gmail.com"
       puts "Telephone Number contact's email displayed on the \"#{$secondBackendDevice}\" device"
       deleteTelephoneNumberContactInfo(info)
    else
       screenshot
       warn "Telephone Number contact's email not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteTelephoneNumberContactInfo(info)
    end
    rescue
      deleteTelephoneNumberContactInfo(info)
      raise "Entered rescue block !!!!"
    end
  when "phone number"
    begin
    @driver.find_element(:xpath,"//UIATableCell[4]").click #Tap Telephone Number contact
    adbPhone = @driver.find_element(:xpath,"//UIATableCell[1]/UIATextField[1]").value
    if adbPhone.to_s == "+40 766 101 202"
       puts "Telephone Number contact's added phone number displayed on the \"#{$secondBackendDevice}\" device"
       deleteTelephoneNumberContactInfo(info)
    else
       screenshot
       warn "Telephone Number contact's added phone number not displayed on the \"#{$secondBackendDevice}\" device!!"
       deleteTelephoneNumberContactInfo(info)
    end
    rescue
      deleteTelephoneNumberContactInfo(info)
      raise "Entered rescue block !!!!"
    end
  when "notes"
#    @driver.find_element(:xpath,"//UIATableCell[4]").click #Tap Telephone Number contact
#    adbNotes = @driver.find_element(:xpath,"//UIATableCell[2]/UIAStaticText[1]").value
#    if adbNotes.to_s == "Notes text for Telephone Number contact"
#       puts "Telephone Number contact's notes displayed on the \"#{$secondBackendDevice}\" device"
#       deleteTelephoneNumberContactInfo(info)
#    else
#       screenshot
#       warn "Telephone Number contact's notes not displayed on the \"#{$secondBackendDevice}\" device!!"
#       deleteTelephoneNumberContactInfo(info)
#    end
  end
end

Then /^I should see each type of notification$/ do
  sleep 3
  index = 1
# My Wow Contact Feather notification
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'The Silver Feather')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Backend Contul 1 successfully invited 2 people to WowApp and earned The Silver Feather')]")
  
  index += 1
# My Wow new level 1 connection notification -> Send friend request 
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Backend Contul 3 is your LEVEL 1 connection')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Send friend request')]")
  
  index += 1
# My Wow own Feather notification
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'The Silver Feather')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'You are awarded with The Silver Feather and received 2 more invites that were added to your total.')]")
 
  index += 1
# My Wow new level 1 connection -> Contact request sent  
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Backend Contul 2 is your LEVEL 1 connection')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Pending contact requests')]")
   
  index += 1
# My Wow new level 1 connection -> Added to contacts
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Backend Contul 1 is your LEVEL 1 connection')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Added to your contact list')]")
  
  index += 1
# My Wow Critical System Message
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Critical System Message')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'My Wow Critical System Message notification for automation')]")
    
  index += 1
  scrollScreen
  sleep 2
# My Wow Info System Message
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Info System Message')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'My Wow Info System Message notification for automation')]")

  index += 1
# My Wow new contacts added - Autopopulate
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'5 new friends')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'have been added to your network')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Tap here to view new friends')]")

  index += 1
# My Wow AD ME disabled notification
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Turn on Advertise Me')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Earn WowCoins for ads you and your network see on WowApp.')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Turn on Advertise Me for Mobile now!')]")
  @driver.find_element(:xpath,"//UIATableCell[#{index}]/UIAStaticText[contains(@label,'Tap here to start')]")
end

Then /^I should see the credit update when the call is ended$/ do
  sleep 3
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click #click Back
  tabBarSwitch("Menu")
  sleep 20
  @credit = 0
  creditUsedByCall = 2
  getCurrentCreditFromMenu
  puts "Available calling credit after the paid call: " + @credit.to_s + " cents"
  @creditAfterCall = @credit.to_i
  if @currentCallingCredit - creditUsedByCall == @creditAfterCall
    puts "Credit updated successfully!"
  else
    warn "Credit did not update !!!"
  end
end

Then /^I should see the updated credit on the second device$/ do
  step "I select the \"#{$secondBackendDevice}\" device"
  tabBarSwitch("Menu")
  getCurrentCreditFromMenu
  creditOnSecondDevice = @credit.to_i
  if creditOnSecondDevice == @creditAfterCall
      puts "Credit updated successfully on the second device!"
  else
      warn "Credit did not update on the second device !!!"
  end
end

Then /^I should see the earnings update when the call is ended$/ do
  warn "Scenario will be implemented when the earnings value can be inspected !!!!!"
#  sleep 3
#  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click #click Back
#  tabBarSwitch("Menu")
#  sleep 20
#  @earnings = 0
#  earningsToBeRecieved = 20
#  getCurrentEarningsFromMenu
#  puts "Available calling credit after the paid call: " + @credit.to_s + " cents"
#  @creditAfterCall = @credit.to_i
#  if @currentCallingCredit - creditUsedByCall == @creditAfterCall
#     puts "Credit updated successfully!"
#  else
#     warn "Credit did not update !!!"
#  end
end

Then /^I should see the new friend on both devices$/ do
  step "I select the \"#{$firstBackendDevice}\" device"
  if isElementPresent("xpath","//UIAAlert[1]")
  @driver.switch_to.alert.accept
  end
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click
  step "I select the \"#{$secondBackendDevice}\" device"
  tabBarSwitch("Contacts")
  [$firstBackendDevice,$secondBackendDevice].each do |device| 
    step "I select the \"#{device}\" device"
    begin
    if isElementPresent("xpath","//UIATableCell[3]/UIAStaticText[contains(@label,'Backend Contul 3')]") 
      elementNotPresent("xpath","//UIATableCell[3]/UIAStaticText[contains(@label,'Contact request sent - Waiting for approval')]")
      puts "New friend found on the \"#{device}\" device"
    end
    rescue
      screenshot
      warn "Friend not found !!!!"
    end
  end
end

Then /^the friend should disappear from Contacts on both devices$/ do
  step "I select the \"#{$secondBackendDevice}\" device"
  tabBarSwitch("Contacts")
  [$firstBackendDevice,$secondBackendDevice].each do |device| 
      step "I select the \"#{device}\" device"
      begin
      unless isElementPresent("xpath","//UIATableCell[3]/UIAStaticText[contains(@label,'Backend Contul 3')]")
        puts "Friend removed on the \"#{device}\" device"
      end
      rescue
        screenshot
        warn "Friend not removed !!!!"
      end
    end
end

Then /^the change should happen on my second device$/ do
  begin
  step "I select the \"#{$secondBackendDevice}\" device"
  sleep 3
  @driver.find_element(:id,"infoButton").click # Click the i button
  @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[2]").click #click Edit Privacy
  if isElementPresent("xpath","//UIATableCell[contains(@name,'#{@changedInfo}')]/UIAStaticText[contains(@label,'#{@changedPrivacy}')]")
    puts @changedInfo + " privacy set to: " + @changedPrivacy + " on my second device !"
  end
  rescue
    warn "Entered rescue block !!! Please check !!!"
  end
end

Then /^the "(.*?)" is visible for friends$/ do |info|
  begin
  step "I select the \"#{$thirdBackendDevice}\" device"
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click #Tap Smoke iPhone's avatar to open the profile
  scrollScreen
  case info
  when "Birthday"
    friendBirthday = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]/UIATextField[1]").value
    if friendBirthday.to_s == "1 January 1970"
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end
  when "Gender"
    friendGender = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]/UIATextField[1]").value
    if friendGender.to_s == "Male"
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end
  when "Language"
    friendLanguage = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]/UIATextField[1]").value
    if friendLanguage.to_s == "Romanian"
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end  
  when "Award"
    @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click
    sleep 2
    if isElementPresent("xpath","//UIATableCell[1]/UIAButton[contains(@name,'featherButton')]")
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end
  when "Network"
    friendNetwork = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]/UIATextField[1]").value
    if friendNetwork.to_i == 6
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end
  when "Email"
    friendEmail = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]/UIATextField[1]").value
    if friendEmail.to_s == 'youwowmobileqa+2738@gmail.com'
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end
  when "Phone Number"
    sleep 4
    friendPhoneNumber = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'PhoneNumber1')]/UIATextField[1]").value
    if friendPhoneNumber.to_s == '+40 732 714 880'
       puts "Friends can see my " + info
    else
       raise "Friends can't see my " + info + " !!!"
    end
  end
  rescue
    warn "Entered rescue block !!! Please check !!!"
  end
end

Then /^the "(.*?)" is not visible for friends$/ do |info|
  step "I select the \"#{$thirdBackendDevice}\" device"
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[1]").click #Tap Smoke iPhone's avatar to open the profile
  scrollScreen
  case info
    when "Birthday"
      elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
    when "Birth year"
      friendBirthday = @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Birthday')]/UIATextField[1]").value
      if friendBirthday.to_s == '1 January'
        puts "Friends cannot see my birth year"
      else
        raise "Friends can see my birth year !!!"
      end
    when "Email"
        elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
  end
end

Then /^non-friend users can also see the "(.*?)"$/ do |info|
  step 'I log in on the simulator with "pl.back4" account and "123456" password'
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,"//UIATableCell[1]/UIAStaticText[3]").click
  scrollScreen
  case info
  when "Birthday"
     if isElementPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
        puts "Wow users can see my " + info
        warn "There is an issue with the actual Birthday value for non-friends - NEED TO INVESTIGATE !!!"
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  when "Gender"
     if isElementPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
        puts "Wow users can see my " + info
        warn "There is an issue with the actual Gender value for non-friends - NEED TO INVESTIGATE !!!"
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  when "Language"
     if isElementPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
        puts "Wow users can see my " + info
        warn "There is an issue with the actual Language value for non-friends - NEED TO INVESTIGATE !!!"
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  when "Award"
     if isElementPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
        puts "Wow users can see my " + info
        warn "There is an issue with the actual Award value for non-friends - NEED TO INVESTIGATE !!!"
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  when "Network"
     if isElementPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
        puts "Wow users can see my " + info
        warn "There is an issue with the actual Network value for non-friends - NEED TO INVESTIGATE !!!"
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  when "Email"
     contactEmail = @driver.find_element("xpath","//UIATableCell[contains(@name,'Email1')]/UIATextField[1]").value
     if contactEmail.to_s == 'youwowmobileqa+2738@gmail.com'
        puts "Wow users can see my " + info
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  when "Phone Number"
     contactPhoneNumber = @driver.find_element("xpath","//UIATableCell[contains(@name,'PhoneNumber0')]/UIATextField[1]").value
     if contactPhoneNumber.to_s == '+40 732 714 880'
        puts "Wow users can see my " + info
     else
        raise "Wow users can't see my " + info + " !!!"
     end
     setDefaultPrivacy(info)
  end
end

Then /^non-friend users can't see the "(.*?)"$/ do |info|
  step 'I log in on the simulator with "pl.back4" account and "123456" password'
  tabBarSwitch("Contacts")
  @driver.find_element(:xpath,'//UIATableCell[1]/UIAStaticText[3]').click
  scrollScreen
  case info
  when "Birthday"
    elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
    puts "Wow users can't see my birthday"
    setDefaultPrivacy(info)
  when "Birth year"
    warn "There is an issue with the actual birthday value for non-friends - NEED TO INVESTIGATE !!!"
    setDefaultPrivacy(info)
    setDefaultPrivacy("Birthday")
  when "Gender"
    warn "There is an issue with the actual gender value for non-friends - NEED TO INVESTIGATE !!!"
    warn "The Gender field appears but the value is Not Specified"
#    elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
#    puts "Wow users can't see my Gender"
    setDefaultPrivacy(info)
  when "Language"
    elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
    puts "Wow users can't see my Language"
    setDefaultPrivacy(info)
  when "Award"
    warn "There is an issue with the actual award value for non-friends - NEED TO INVESTIGATE !!!"
    warn "The Award field appears but the feather icon is not displayed"
#    elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
#    puts "Wow users can't see my Award"
    setDefaultPrivacy(info)
  when "Network"
    warn "There is an issue with the actual Network value for non-friends - NEED TO INVESTIGATE !!!"
    warn "The Network field appears but the value is missing"
#    elementNotPresent("xpath","//UIATableCell[contains(@name,'#{info}')]")
#    puts "Wow users can't see my Network"
    setDefaultPrivacy(info)
  when "Email"
    elementNotPresent("xpath","//UIATableCell[contains(@name,'Email1')]")
    puts "Wow users can't see my Email"
    setDefaultPrivacy(info)
  when "Phone Number"
    elementNotPresent("xpath","//UIATableCell[contains(@name,'PhoneNumber0')]")
    puts "Wow users can't see my Phone Number"
    setDefaultPrivacy(info)
  end
end

Then /^I disable the Show Year of Birth option$/ do
  showYearOfBirthStatus = @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").value
  if showYearOfBirthStatus.to_i == 1
     @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").click #disable Show Year of Birth option
  else
    puts "Show Year of Birth option already disabled on the first device!!!"
  end
end

Then /^the Show Year of Birth option should be disabled on my second device$/ do
  step "I select the \"#{$secondBackendDevice}\" device"
  @driver.find_element(:id,"infoButton").click # Click the i button
  @driver.find_element(:xpath,"//UIACollectionView[1]/UIACollectionCell[2]").click #click Edit Privacy
  showYearOfBirthStatus = @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").value
  if showYearOfBirthStatus.to_i == 0
     puts "Show Year of Birth option disabled on my second device"
  else
     raise "Show Year of Birth option enabled on my second device !!!"
  end
end