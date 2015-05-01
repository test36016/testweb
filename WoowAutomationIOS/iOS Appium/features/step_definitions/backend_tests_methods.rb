def setDefault(info)
  case info
  when "Names"
    cutTextInField(@driver.find_element(:xpath, "//UIATableCell[2]/UIATextField[1]"))
    @driver.find_element(:xpath, "//UIATableCell[2]/UIATextField[1]").send_keys "#{$defaultFN}"
    cutTextInField(@driver.find_element(:xpath, "//UIATableCell[3]/UIATextField[1]"))
    @driver.find_element(:xpath, "//UIATableCell[3]/UIATextField[1]").send_keys "#{$defaultLN}"
    sleep 5
  when "Birthday"
    step "I select the \"#{$firstBackendDevice}\" device"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @driver.find_element(:xpath, "//UIATableCell[4]").click
    @driver.find_element(:xpath, "//UIAPicker[1]/UIAPickerWheel[2]").send_keys "January"
    @driver.find_element(:id, "doneButton").click
    sleep 3
  when "Gender"
    sleep 5
    step "I select the \"#{$firstBackendDevice}\" device"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @driver.find_element(:xpath, "//UIATableCell[5]").click
    @driver.find_element(:xpath, "//UIAPicker[1]/UIAPickerWheel[1]").send_keys "Male"
    @driver.find_element(:id, "doneButton").click
    sleep 3
  when "City"
    step "I select the \"#{$firstBackendDevice}\" device"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    currentCity = @driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]").value
    cutTextInField(@driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]"))
    @driver.find_element(:xpath, "//UIATableCell[6]/UIATextField[1]").send_keys "#{@defaultCity}"
    sleep 10
  when "Country"
    step "I select the \"#{$firstBackendDevice}\" device"
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[7]").click # click the country field
    @driver.find_element(:xpath, "//UIATableView[1]/UIASearchBar[1]").click # click the search bar in the countries list
    @driver.find_element(:xpath, "//UIATableView[1]/UIASearchBar[1]").send_keys "Rom"
    @driver.find_element(:xpath, "//UIATableView[1]/UIATableCell[1]").click #select Romania from the search results list
    sleep 10
  end
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  sleep 3
end

def deleteAddedPhone
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  scrollScreen
  @driver.find_element(:xpath, "//UIATableCell[9]/UIAButton[1]").click #click the round delete button for the number
  @driver.find_element(:xpath, "//UIATableCell[9]/UIAButton[3]").click #Delete the number
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  sleep 5
end

def deleteWebsite
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  scrollScreen
  cutTextInField(@driver.find_element(:xpath, "//UIATableCell[10]/UIATextField[1]"))
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  sleep 5
end

def deleteFriendInfo(info)
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:id,"contactMenu info").click # Click the i button
  @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click #click Edit Profile
  case info
  when "nickname"
    cutTextInField(@driver.find_element(:id, "textFieldName"))
  when "email" 
    @driver.find_element(:xpath,"//UIATableCell[3]/UIAButton[1]").click #click the round delete button
    @driver.find_element(:xpath,"//UIATableCell[3]/UIAButton[3]").click #click Delete
  when "phone number"
    @driver.find_element(:xpath,"//UIATableCell[5]/UIAButton[1]").click #click the round delete button
    @driver.find_element(:xpath,"//UIATableCell[5]/UIAButton[3]").click #click Delete
  when "notes"
    cutTextInField(@driver.find_element(:id,"textViewNotes"))
  end
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  sleep 5
end

def deleteTelephoneNumberContactInfo(info)
  step "I select the \"#{$firstBackendDevice}\" device"
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
  @driver.find_element(:xpath,"//UIACollectionCell[1]/UIAButton[1]").click #click Edit
  case info
  when "nickname"
    cutTextInField(@driver.find_element(:id, "textFieldName"))
    @driver.find_element(:id, "textFieldName").send_keys "#{@defaultTelephoneNumberContactName}" 
  when "email"
    @driver.find_element(:xpath,"//UIATableCell[2]/UIAButton[1]").click #click the round delete button
    @driver.find_element(:xpath,"//UIATableCell[2]/UIAButton[3]").click #click Delete
  when "phone number"
    @driver.find_element(:xpath,"//UIATableCell[3]/UIAButton[1]").click #click the round delete button
    @driver.find_element(:xpath,"//UIATableCell[3]/UIAButton[3]").click #click Delete
  when "notes"
    cutTextInField(@driver.find_element(:id, "textViewNotes"))
  end
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
  @driver.switch_to.alert.accept
  sleep 5
end

def getCurrentCreditFromMenu
  begin
  @credit = @driver.find_element(:id,"menuCellKeypad").value.to_s
  @credit.slice! "$"
  @credit.slice! ","
  return @credit
  end
end

#def getCurrentEarningsFromMenu
#  begin
#  @earnings = @driver.find_element(:id,"").value.to_s
#  @earnings.slice! ","
#  return @earnings
#  end
#end

def setDefaultPrivacy(info)
  step "I select the \"#{$firstBackendDevice}\" device"
  case info
  when "Birthday"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Friends')]").click
    setDefaultPrivacy("Birth year")
  when "Birth year"
    puts "Changing \"#{info}\" privacy to default"
    showYearOfBirthStatus = @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").value
    if showYearOfBirthStatus.to_i == 0
       @driver.find_element(:xpath,"//UIATableCell[2]/UIASwitch[1]").click #enable Show Year of Birth option
    else
       puts "Show Year of Birth option already enabled on the first device!!!"
    end
  when "Gender"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Friends')]").click
  when "Language"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Friends')]").click
  when "Awards"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Public')]").click
 when "Network"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Public')]").click
 when "Email"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Friends')]").click
 when "Phone Number"
    puts "Changing \"#{info}\" privacy to default"
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'#{info}')]").click
    @driver.find_element(:xpath,"//UIATableCell[contains(@name,'Friends')]").click
  end
  sleep 4
end