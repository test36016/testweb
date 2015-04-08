require 'calabash-android/calabash_steps'

When /^I set Second device$/ do
	setDevice('Second_Device')
	shutdown_test_server
	clear_app_data
	start_test_server_in_background
end

When /^I set Third device$/ do
	setDevice('Third_device')
    shutdown_test_server
	clear_app_data
	start_test_server_in_background
end

When /^I Select Second device$/ do
   setDevice('Second_Device')
end

When /^I Select First device$/ do
	setDevice('First_device')
end

When /^I close the app on Second device$/ do
   shutdown_test_server
end

def scrollDown()
  sleep(1.0)
  performAction('scroll_down')
  sleep(1.0)
end

def setDevice(device)
   case device
      when "First_device"
	     set_device_by_user($firstDevice)
      when "Second_Device"
	     set_device_by_user($secondDevice)
      when "Third_device"
	     set_device_by_user($thirdDevice)
	end	 
end  

#--  Set Devices serial number --#
#-- 360logica Devices ---#

#$firstDevice = '420e5f8d'
$firstDevice = '000e3ca11cb7cf'

#$firstDevice = '4d00a4f34b212131'
#$secondDevice = '4d004c05fdcb40a9'
#$thirdDevice= '304D19EFF23CFC7E'

#Jenkins Devices
#$firstDevice = '069bf0370ac98d68'
#$secondDevice ='0234a1515f5515de'
#$thirdDevice= 'YT9004NFL2'

def gotoHomeScreen()
	cmd = "adb -s "+$firstDevice+" shell input keyevent 3"	
	system(cmd)
end 

def scroll_screen_until_element_not_exist(element)
  i=1
    while i<100
      if element_exists(element)
         break
      else
         step "I scroll down"
         i=i+1
      end
   end
end

def adbscroll_screen_until_element_not_exist(element)
i=1
    while i<100
      if element_exists(element)
         break
      else
        cmd1 = "adb -s "+$firstDevice+" shell input keyevent 20"	
		system(cmd1)		
         i=i+1
      end
   end
end

def waitForElementPresent(element)
	i=1	
	while i<120
		if element_exists(element)
			break
		else
			#wait_for(:timeout =>05) { element_exists(element) }
			sleep (1)
			i=i+1
		end		
   end
   check_element_exists(element) 
end
