require 'rspec/expectations'
require 'selenium-webdriver'
require 'appium_lib'
require 'rubygems'
require 'etc'


#Simulator build path
#APP_PATH = '/../../YowWowMe/YouWowMe.app'

#Real device build
APP_PATH = '/../../YowWowMe/YouWowMe.ipa'

#Path for screenshot
IMAGE = "/../../Screenshot/"

def absolute_image_path
  File.join(File.dirname(__FILE__), IMAGE)
end

#Device UDID
$firstDeviceUDID = '755c301229aab3180b62e574b8ebb7d06f4b97f1' #Device connected to Main Mac
$secondDeviceUDID = '17006b330e705035909a2e1b33b6ebbdb5b86893' #Device connected to VM
$thirdDeviceUDID = '17006b330e705035909a2e1b33b6ebbdb5b86893' #Device connected to Second Mac


# capabilities for first driver
def  firstDeviceLaunch
	capabilities =
  		{
    		'browserName' => '',
    		'platform' => 'Mac',
    		'version' => '8.1.2',
    		'deviceName' => "755c301229aab3180b62e574b8ebb7d06f4b97f1",
    		'platformName' => 'iOS',        
    		'app' => '/Users/chirags/Documents/WoowTalk/Cucumber-Appium/YowWowMe/WowApp.ipa',
    		'newCommandTimeout' => '600',
    		'udid' => "755c301229aab3180b62e574b8ebb7d06f4b97f1",
    		'launchTimeout' => '600000',
    		'autoAcceptAlerts' => 'true',	
  		}
  		
  		begin
  			@driverFirst ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)	
		rescue 
			sleep(60)
 			 @driverFirst ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)
 			 puts "First Driver launch after time out"
		end
end

def server_url
  "http://192.168.9.15:4723/wd/hub"
end

# capabilities for second driver
 def secondRealDeviceLaunch
	capabilities1 =
  		{
    		'browserName' => '',
    		'platform' => 'Mac',
    		'version' => '8.0.2',
    		'deviceName' => "17006b330e705035909a2e1b33b6ebbdb5b86893",
    		'platformName' => 'iOS',        
    		#'app' => '/Users/360_macmini/Documents/WoowTalk/Cucumber-Appium/YowWowMe/WowApp.ipa',
    		'app' => '/Users/yosovm1/Documents/Cucumber-Appium/YowWowMe/WowApp.ipa',
    		'newCommandTimeout' => '600',
    		'udid' => "17006b330e705035909a2e1b33b6ebbdb5b86893",
    		'launchTimeout' => '600000',
    		'autoAcceptAlerts' => 'true',
  		}
		begin
  			@driverSecond ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities1, :url => server_url1)	
		rescue 
			sleep(60)
 			 @driverSecond ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities1, :url => server_url1)
 			 puts "Second Driver launch after time out"
		end
end

def server_url1
  "http://192.168.9.18:4723/wd/hub"
  
end

# capabilities for third driver
def  thirdRealDeviceLaunch 
	capabilities2 =
  		{
    		'browserName' => '',
    		'platform' => 'Mac',
    		#'version' => '8.1.2',
    		#'deviceName' => '755c301229aab3180b62e574b8ebb7d06f4b97f1',
    		
    		'version' => '8.0.2',
    		'deviceName' => '17006b330e705035909a2e1b33b6ebbdb5b86893',

    		'platformName' => 'iOS',        
    		'app' => '/Users/360_macmini/Documents/WoowTalk/Cucumber-Appium/YowWowMe/YouWowMe.ipa',
    		'newCommandTimeout' => '600',
    		
    		'udid' => '17006b330e705035909a2e1b33b6ebbdb5b86893',
    		
    		#'fullReset' => 'true',	
    		'launchTimeout' => '300000',
    		'autoAcceptAlerts' => 'true',	
  		}
		begin
  			@driverThird ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities2, :url => server_url2)
		rescue 
			sleep(60)
 			 @driverThird ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities2, :url => server_url2)
 			 puts "Third Driver launch after time out"
		end
end

def server_url2
  "http://192.168.9.5:4723/wd/hub"
end

# capabilities for Simulator driver
def  simulatorLaunch 
	capabilities3 =
  		{
    		'browserName' => 'iOS',
    		'platform' => 'Mac',
    		'version' => '8.2',
    		'deviceName' => 'iPhone 6',
    		'platformName' => 'iOS',        
    		'app' => '/Users/360_macmini/Documents/WoowTalk/Cucumber-Appium/YowWowMe/YouWowMe.app',
    		'newCommandTimeout' => '600',
    		'fullReset' => 'true',	
    		'launchTimeout' => '300000',
    		'autoAcceptAlerts' => 'true',	
  		}
		begin
  			 @driverSimulator ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities3, :url => server_url3)
		rescue 
			sleep(60)
 			 @driverSimulator ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities3, :url => server_url3)
 			 puts "Third Driver launch after time out"
		end
end

def server_url3
  "http://192.168.9.5:4723/wd/hub"
end

def absolute_app_path
  File.join(File.dirname(__FILE__), APP_PATH)
end

# Before Scenario
Before { 
		quiteDriver
		firstDeviceLaunch 
	}

# Method to launch the second device
def secondDeviceLaunch
	secondRealDeviceLaunch 
end 

# Method to launch the third device
def thridDeviceLaunch
	thirdRealDeviceLaunch  
end

# Method to launch the second device
def simulatorDeviceLaunch
	simulatorLaunch 
end 


def quiteDriver
  	begin
  			@driverFirst.quit
  			puts "Driver First is quit"
		rescue 
 			 nil
		end
		begin
  			@driverSecond.quit
			puts "Driver Second is quit"
		rescue 
 			 nil
		end 
		begin
  			@driverThird.quit
  			puts "Driver Third is quit"
		rescue 
 			 nil
		end 
		begin
  			@driverSimulator.quit
  			puts "Driver Simulator is quit"
		rescue 
 			 nil
		end 
end

# After Scenario

After {
	if @ele==false 
  		screenshot
 	end
	quiteDriver
	}

#Install the app for first Device
def installApp
  loggedUser = Etc.getlogin
  result =`ideviceinstaller --udid #{$firstDeviceUDID} --install /Users/chirags/Documents/WoowTalk/Cucumber-Appium/YowWowMe/YouWowMe.ipa`
  if ($?.exitstatus != 0)
    return "not installed"
  end
end

#Un-Install the app for first Device
def uninstallApp
    	result =`ideviceinstaller --udid #{$firstDeviceUDID} --uninstall com.woow.woowapp`
    	if ($?.exitstatus != 0)
    	return "not removed"
    end
end