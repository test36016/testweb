package com.testframework.testscripts;
import com.testframework.helper.GmailLoginHelper;

public class Test1 {
	
	
	public static void main(String[] args) {
		
	

		GmailLoginHelper gmailLoginHelper = new GmailLoginHelper();
		// Click on Gmail
		gmailLoginHelper.clickOnGmail();
		
		//Enter Username
		gmailLoginHelper.enterEmail();
		
		//Enter Password
		gmailLoginHelper.enterPassword();
		
		//Click on Sign In
		gmailLoginHelper.clickOnSignIn();
		
		//Verify User Name
		gmailLoginHelper.verifyUserName("Qa Person");
	}
}
