require 'calabash-android/calabash_steps'

Given /^I am on the login window$/ do 
	#wait_for(:timeout => 20) { element_exists("* id:'login_layout'") }	
	waitForElementPresent("* id:'login_layout'")
	check_element_exists("* id:'login_layout'")   
	check_element_exists("* id:'topbar_gen_backButton'")
	check_element_exists("* id:'edit_username'")   
	check_element_exists("* id:'edit_password'")   
	check_element_exists("* id:'chk_show_password'") 
	check_element_exists("* id:'text_forgot_password'") 
	check_element_exists("* id:'text_sign_in'") 
end

Given /^I am logged in with "([^\"]*)" account$/ do |arg1|
	step "I am on the login window"
	username = read_config(arg1)
	password = read_config('usualPassword')
	query("* id:'edit_username'",{:setText => username})
	#wait_for(:timeout => 20) { element_exists("* id:'edit_password'") }	
	waitForElementPresent("* id:'edit_password'")
	sleep(2)
	touch(query("* id:'edit_password'"))
	sleep(2)
	keyboard_enter_text(password)
	press_back_button
	sleep (3)
	touch(query("* id:'text_sign_in'"))
	sleep (9)
	#wait_for(:timeout => 60) { element_exists("* id:'icon'") }
	waitForElementPresent("* id:'icon'")
end

When /^I enter "([^\"]*)" in username field$/ do |arg1|
   username = read_config(arg1)
   query("* id:'edit_username'",{:setText => username})
end

When /^I enter the usual password in password field$/ do
	password = read_config('usualPassword')
	#wait_for(:timeout => 20) { element_exists("* id:'edit_password'") }	
	waitForElementPresent("* id:'edit_password'")
	touch(query("* id:'edit_password'"))
	keyboard_enter_text(password)
end

When /^I click on login Button$/ do
	press_back_button	
	#wait_for(:timeout => 30) { element_exists("* id:'text_sign_in'") }	
	waitForElementPresent("* id:'text_sign_in'")
	touch(query("* id:'text_sign_in'"))
	
end

Given /^I am logged in with "([^\"]*)" account on second device$/ do |arg1|
	step "I set Second device"
	step "I am on the login window"
	username = read_config(arg1)
	password = read_config('usualPassword')
	query("* id:'edit_username'",{:setText => username})
	#wait_for(:timeout => 20) { element_exists("* id:'edit_password'") }	
	waitForElementPresent("* id:'edit_password'")
	sleep(2)
	touch(query("* id:'edit_password'"))
	sleep(2)
	keyboard_enter_text(password)
	press_back_button
	sleep (3)
	touch(query("* id:'text_sign_in'"))
	sleep (9)
	#wait_for(:timeout => 30) { element_exists("* id:'icon'") }		
	waitForElementPresent("* id:'icon'")
end

Given /^I logged in with "([^\"]*)" account$/ do |us|
	gotoHomeScreen()
	shutdown_test_server
	clear_app_data
	start_test_server_in_background
	steps (%Q(
        Given I am logged in with "pl.automation7" account
 ) )
end

Given /^I log in with "([^\"]*)" account$/ do |arg1|
	gotoHomeScreen()
	shutdown_test_server
	clear_app_data
	start_test_server_in_background
	steps (%Q(
        Given I am logged in with "pl.automation8" account
 ) )
end

Given /^I have logged in with "([^\"]*)" account$/ do |arg1|
	gotoHomeScreen()
	shutdown_test_server
	clear_app_data
	start_test_server_in_background
	steps (%Q(
        Given I am logged in with "pl.automation6" account
 ) )
	#step "I am logged in with \"pl.automation6\" account"
	#step "I am logged in with \"arg1\" account"
end

Given /^I am logged with "([^\"]*)" account$/ do |arg1|
	step "I am on the login window"
	username = read_config(arg1)
	password = read_config('paidAccountPassword')
	query("* id:'edit_username'",{:setText => username})
	#wait_for(:timeout => 20) { element_exists("* id:'edit_password'") }	
	waitForElementPresent("* id:'edit_password'")
	sleep(2)
	touch(query("* id:'edit_password'"))
	sleep(2)
	keyboard_enter_text(password)
	press_back_button
	sleep (3)
	touch(query("* id:'text_sign_in'"))
	sleep (9)
	#wait_for(:timeout => 60) { element_exists("* id:'icon'") }
	waitForElementPresent("* id:'icon'")
end