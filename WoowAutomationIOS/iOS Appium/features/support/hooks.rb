#######################################################
#                                                     #    
#                                                     #
#         Hooks for smoke_test feature file           # 
#                                                     #
#                                                     #  
#######################################################  

Before('@smoke_test') { launchFirstDevice }
  
#After('@smoke_test') { @driver.quit }

Before('@smoke_test','@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@25,@26') do

  step 'I am in the Chats screen on the "first" device'

end

After('@smoke_test','@lastScenario') do
  devalidateAccount
  @driver.quit
end

#######################################################
#                                                     #    
#                                                     #
#        Hooks for send_feedback feature file          # 
#                                                     #
#                                                     #  
####################################################### 

Before('@send_feedback') { launchFirstDevice }
 
#After('@send_feedback') { @driver.quit }

#######################################################
#                                                     #    
#                                                     #
#        Hooks for backend_test feature file          # 
#                                                     #
#                                                     #  
#######################################################         

Before('@backend_test,@backend_test_2','@singleDevice') { launchFirstDevice }
  
Before('@backend_test_2') { launchSimulator }  
  
Before('@backend_test_2','@thirdDevice') do
  case $thirdBackendDevice
    when "first"
      launchFirstDevice
    when "second"
      launchSecondDevice
    when "third"
      launchThirdDevice
    end
end
  
Before('@backend_test_2','@3') do
  step "I am in the login screen on the \"#{$thirdBackendDevice}\" device"
  step 'I type my username "pl.back1" and password "123456"'
  step 'I click the Sign In button'
end

Before('@backend_test,@backend_test_2','@MDL') do
  
  case $firstBackendDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
  
  case $secondBackendDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
    
end

Before('@backend_test_2','@thirdDevice') do
  step 'I am in the Menu screen on two devices'
end

Before('@backend_test','@threeDevices') do
  
  case $firstBackendDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
  
  case $secondBackendDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
  
  case $thirdBackendDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
    
end

After('@backend_test_2','@lastScenario') do
  step "I select the \"#{$secondBackendDevice}\" device"
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[2]").click
  step 'I delete my validated phone number on one device'
end

#######################################################
#                                                     #    
#                                                     #
#        Hooks for api_test feature file              # 
#                                                     #
#                                                     #  
#######################################################

Before('@api_test','@MDL') do
  
  case $firstApiDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
  
  case $secondApiDevice
  when "first"
    launchFirstDevice
  when "second"
    launchSecondDevice
  when "third"
    launchThirdDevice
  end
end

Before('@api_test','@2') { launchSimulator } 

#######################################################
#                                                     #    
#                                                     #
#        Hooks for send invite feature file           # 
#                                                     #
#                                                     #  
#######################################################

# To run locally
#Before('@firstScenario', '@send_invite') do
#  installApp
#end

Before('@send_invite') { launchSecondDevice }

#######################################################
#                                                     #    
#                                                     #
#          Hooks for settings feature file            # 
#                                                     #
#                                                     #  
#######################################################   
  
Before('@settings') { launchThirdDevice }  
  
#######################################################
#                                                     #    
#                                                     #
#          Hooks for My Profile feature file          # 
#                                                     #
#                                                     #  
#######################################################  
 
Before('@editProfile') do
  launchFirstDevice
end
   
Before('@editProfile','@2,@3,@4,@5,@6,@7,@8,@9,@10,@11') do
# This will only run before scenarios tagged
# with @smoke_test AND (@3 OR @4 OR ...) 
  step 'I am in My Profile screen'
end 

After('@editProfile','@7') do
     step 'I delete my custom avatar'
end

After('@editProfile', '@9,@10') do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[1]").click
end

After('@editProfile','@11') do
  @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Edit
    @driver.find_element(:xpath, "//UIATableCell[4]/UIAStaticText[1]").click #tap Birthday
    sleep 2
#    @driver.execute_script("//UIAApplication[1]/UIAWindow[1]/UIAPicker[1]/UIAPickerWheel[1]: scroll" , :start_x => 95, :start_y => 625, :end_x => 95, :end_y => 598)
    @driver.find_element(:xpath, "//UIAToolbar[1]/UIAButton[2]").click #taps the avatar picker's done
    @driver.find_element(:xpath, "//UIANavigationBar[1]/UIAButton[3]").click #tap Done
    sleep 10
end

#######################################################
#                                                     #    
#                                                     #
#     Hooks for Create Group Chat feature file        # 
#                                                     #
#                                                     #  
#######################################################  

Before('@create_group_chat') { launchSecondDevice }
  
Before('@create_group_chat','@gc_participant_check') do
  launchThirdDevice
  step 'I am logged in with "pl.mariusautomatic3" user and "123456" password'
end

After('@create_group_chat','@gc1') do
@driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click
deleteChats(1)
end

After('@create_group_chat','@gc_topic_chats') do
deleteChats(1)
end

After('@create_group_chat','@gc_participant_check') do
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click
  deleteChats(1)
  step 'I set the second device'
  @driver.find_element(:xpath,"//UIANavigationBar[1]/UIAButton[2]").click
  deleteChats(1)
end
