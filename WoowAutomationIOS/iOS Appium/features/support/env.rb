require 'rspec/expectations'
require 'selenium-webdriver'
require 'appium_lib'
require 'rubygems'
require 'etc'

#Path for screenshot
IMAGE = "/../../Screenshot/"

def absolute_image_path
  File.join(File.dirname(__FILE__), IMAGE)
end

$testEnvironment = "Prelive"


$firstDeviceUDID = '589c46c0679087efbe00b9f95efb218f3284ec5a' #Device connected to Eugen
$secondDeviceUDID = 'c8c167f1e3944cfcde5c66f913d2df7a4074b671' #Device connected to Daniel
#$thirdDeviceUDID = 'd8772e4d6df4d3373d5a36f11dca48a976929886' #Device connected to Marius
$thirdDeviceUDID = '3291b158481083ea5b31a46a795d20ff47754365' #Device connected to MacBook

$wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds (default timeout is 0)
# The wait time is increase so that the test don't return false negatives on physical devices or slower machines
 

################################## 

###### For physical device #######

##################################

def launchFirstDevice

capabilities =
  {
  platformVersion: '8.3',
  deviceName: "#{$firstDeviceUDID}",
  platformName: 'iOS', 
  newCommandTimeout: '600',
  launchTimeout: '600000',
#  autoAcceptAlerts: true,
  sendKeyStrategy: 'grouped', # could also be |`oneByOne`, `grouped` or `setValue`|
  app: 'com.woow.woowapp',
  udid: "#{$firstDeviceUDID}",
  browserName: 'iOS'
  }
  
  $realDevice = true
  
  begin
  @driverOne ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url1) 
  rescue 
  @driverOne ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url1)
  puts "Driver One launched after time out"
  end
end

def launchSecondDevice

capabilities2 =
  {
  platformVersion: '8.2',
  deviceName: "#{$secondDeviceUDID}",
  platformName: 'iOS', 
  newCommandTimeout: '600',
  launchTimeout: '600000',
#  autoAcceptAlerts: true,
  sendKeyStrategy: 'grouped', # could also be |`oneByOne`, `grouped` or `setValue`|
  app: 'com.woow.woowapp',
  udid: "#{$secondDeviceUDID}",
  browserName: 'iOS'
  }
  
  $realDevice = true
  
  begin
  @driverTwo ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities2, :url => server_url2)
  rescue 
  @driverTwo ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities2, :url => server_url2)
  puts "Driver Two launched after time out"
  end
end

def launchThirdDevice

capabilities3 =
  {
  platformVersion: '8.2',
  deviceName: "#{$thirdDeviceUDID}",
  platformName: 'iOS',
  newCommandTimeout: '600',
  launchTimeout: '600000',
# autoAcceptAlerts: true,
  sendKeyStrategy: 'grouped', # could also be |`oneByOne`, `grouped` or `setValue`| 
  app: 'com.woow.woowapp',
  udid: "#{$thirdDeviceUDID}",
  browserName: 'iOS'
  }
  
  $realDevice = true
  
  begin
  @driverThree ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities3, :url => server_url3)
  rescue 
  @driverThree ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities3, :url => server_url3)
  puts "Driver Three launched after time out"
  end
end


#Eugen's Mac Mini - iPhone 6 connected
def server_url1
  "http://172.17.4.112:4723/wd/hub"
end

#Daniel's Mac Mini - iPhone 5C connected
def server_url2
  "http://172.17.4.75:4723/wd/hub"
end

##Marius's Mac Mini - iPhone 4C connected
#def server_url3
#  "http://172.17.4.68:4723/wd/hub"
#end

#MacBook - iPod 5 connected
def server_url3
   "http://172.17.4.126:4723/wd/hub"
end

After {
   
   begin
        @driverOne.quit
     puts "First driver quit"
     rescue 
        nil
   end
    
   begin
        @driverTwo.quit
     puts "Second driver quit"
     rescue 
        nil
   end 
   
   begin
        @driverThree.quit
     puts "Third driver quit"
     rescue 
        nil
   end 
   
  # Simulator 
  begin
        @driverFour.quit
     puts "Simulator quit"
     rescue 
        nil
  end
 }

#AfterStep do |scenario|
#  # Do something after each step.
#  screenshot
#end 
 
#def installApp
#  loggedUser = Etc.getlogin
#  result =`ideviceinstaller --udid #{$firstDeviceUDID} --install /Users/#{loggedUser}/Desktop/YouWowMe.ipa`
#  if ($?.exitstatus != 0)
#    return "not installed"
#  end
#end

#def uninstallApp
#  result =`ideviceinstaller --udid #{$firstDeviceUDID} --uninstall com.woow.woowapp`
#  if ($?.exitstatus != 0)
#    return "not removed"
#  end
#end


################################## 

######    For simulator    #######

##################################

APP_PATH = '/Users/user/Desktop/YouWowMe.app'

def launchSimulator

capabilities4 =
  {
    browserName: 'iOS',
#    fullReset: true,
    newCommandTimeout: '600',
    launchTimeout: '600000',
    autoAcceptAlerts: true,
    sendKeyStrategy: 'grouped', # could also be |`oneByOne`, `grouped` or `setValue`|
    platform: 'Mac',
    version: '8.2',
    deviceName: 'iPhone 5s (1060ECF0-816D-4727-92BF-A0B7FFF7EE3F)',
    platformName: 'iOS',        
    app: APP_PATH
    
  }
  
  $realDevice = false
  
  @driverFour ||= Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities4, :url => server_url4)
end


def server_url4
  "http://172.17.3.213:4723/wd/hub"
end
