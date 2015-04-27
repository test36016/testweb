package com.testframework.testscripts;

import org.testng.annotations.Test;
import com.testframework.helper.GmailLoginHelper;
import com.testframework.util.DriverTestCase;

public class GmailLogin extends DriverTestCase {

	GmailLoginHelper gmailLoginHelper = new GmailLoginHelper();
	
	@Test
	public void testGmailLogin()
	{
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
