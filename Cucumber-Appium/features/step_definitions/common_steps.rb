require 'test/unit/assertions'
require 'test/unit/assertions.rb'
World(::Test::Unit::Assertions)

def close_pop_up
    wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
    sleep(5)
    begin
    	phoneAccess = "//UIAApplication[1]//UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[1]"
    	wait.until { @driver.find_element(:xpath, phoneAccess) }
    	# Click on phone Access pop-up
   		@driver.find_element(:xpath, phoneAccess).click
    rescue
    end
    begin
    	wait.until { @driver.find_element(:xpath, "//UIAApplication[1]//UIAAlert[1]//UIACollectionCell[1]/UIAButton[1]") }
   		@driver.find_element(:xpath, "//UIAApplication[1]//UIAAlert[1]//UIACollectionCell[1]/UIAButton[1]").click
   rescue
    end
    #Click on first Ok pop-up
    begin
    	wait.until { @driver.find_element(:name, "OK") }
   		@driver.find_element(:name, "OK").click
   rescue
    end
   #Click on Access the contact pop-up
    begin
    	#wait.until { @driver.find_element(:name, "Agree") }
   		sleep(1)
   		@driver.find_element(:name, "Agree").click
   	rescue
    end
   #Click on second Ok pop-up
   begin
   #wait.until { @driver.find_element(:name, "OK") }
   sleep(1)
   @driver.find_element(:name, "OK").click
   rescue
    end
    #Click pop-up for iOS 7.1.2
    closepop_up
end

def closepop_up
	 wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
	begin
    	wait.until { @driver.find_element(:name, "Push_Close") }
   		@driver.find_element(:name, "Push_Close").click
   rescue
    end
end

def isElementPresent(locatorType, element)
	case locatorType
		when "xpath"
		begin 
  			@driver.find_element(:xpath, ""+element+"")
  			return true
  		rescue  
    		return false  
    	end
    	when "id"
		begin 
  			@driver.find_element(:id, ""+element+"")
  			return true
  		rescue  
    		return false  
    	end
    	when "name"
		begin 
			@driver.find_element(:name, ""+element+"")
  			return true
  		rescue  
    		return false  
    	end
    end
end

def assertElementPresent(element)
		element
	end

def waitForElementPresent (locatorType, element)
		i=1
		while i<20
		flag = isElementPresent(locatorType, element)
		if flag==true
			break
		else
			sleep (1)
			i=i+1
		end		
   end
   	@ele = isElementPresent(locatorType, element)
end

def waitForElementNotPresent (locatorType, element)
		i=1
		while i<60
		flag = isElementPresent(locatorType, element)
		if flag==false
			break
		else
			sleep (1)
			i=i+1
		end		
   end
end

def isElementNotPresent(locatorType, element)
	flag = isElementPresent(locatorType, element)
	assert(false == flag,"Failed due to element is displayed")
end

When(/^I set First device$/) do
	@driver = nil
	@driver = @driverFirst
end

When(/^I set Second device$/) do
	@driver = nil
	@driver = @driverSecond
end

When(/^I set Third device$/) do
	@driver = nil
	@driver = @driverThird
end

When(/^I set simulator device$/) do
	@driver = nil
	@driver = @driverSimulator
end

When(/^I select First device$/) do
	step "I set First device"
end

When(/^I select Second device$/) do
	step "I set Second device"
end

When(/^I select Third device$/) do
	step "I set Third device"
end

When(/^I select simulator device$/) do
	step "I set simulator device"
end

When(/^I switch to First device$/) do
	step "I set First device"
end

When(/^I switch to Second device$/) do
	step "I am on second device"
end

When(/^I switch to Third device$/) do
	step "I am on third device"
end

When(/^I switch to simulator device$/) do
	step "I am on simulator device"
end

When(/^I am on second device$/) do
	secondDeviceLaunch
	step "I set Second device"  	
end

When(/^I am on third device$/) do
	thridDeviceLaunch
	step "I set Third device"	
end

When(/^I am on simulator device$/) do
	simulatorDeviceLaunch
	step "I set simulator device"	
end

When(/^I tap on Ok button$/) do
	begin
	 	wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
    	wait.until { @driver.find_element(:name, "OK") }
   		@driver.find_element(:name, "OK").click
   rescue
    end
end

When(/^I tap on back button$/) do
  	waitForElementPresent("name", "Back")
	@driver.find_element(:name,"Back").click
end

When(/^I tap on edit button$/) do
  	waitForElementPresent("name", "Edit")
	@driver.find_element(:name,"Edit").click
end

When(/^I tap on done button$/) do
  	waitForElementPresent("name", "Done")
	@driver.find_element(:name,"Done").click
end

When(/^I tap on cancel button$/) do
  	waitForElementPresent("name", "Cancel")
	@driver.find_element(:name,"Cancel").click
end

def scroll_screen_until_element_not_exist(locatorType, element)
  i=1
    while i<100
      flag = isElementPresent(locatorType, element)
		if flag==true
         break
      else
         scrollScreen
         i=i+1
      end
   end
end

def scrollScreen
  @driver.execute_script("mobile: scroll" , :start_x => 155, :start_y => 385, :end_x => 161, :end_y => 99)
end

def screenshot
  name = Time.now.strftime("%d_%m_%Y_%H_%M_%S")
  @driver.save_screenshot(absolute_image_path+"/#{name}.png")
  puts "Saved screenshot: " + name + ".png"
end
