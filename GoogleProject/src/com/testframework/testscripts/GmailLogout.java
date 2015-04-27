package com.testframework.testscripts;

import org.testng.annotations.Test;
import com.testframework.helper.GmailLoginHelper;
import com.testframework.helper.GmailLogoutHelper;
import com.testframework.util.DriverTestCase;

public class GmailLogout extends DriverTestCase{

	GmailLogoutHelper gmailLogoutHelper = new GmailLogoutHelper();
	GmailLoginHelper gmailLoginHelper = new GmailLoginHelper();
	
	@Test
	public void testLogOut()
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
				
				// Click on Signout
				gmailLogoutHelper.clickOnLogout();
				
				// Verify Gmail page
				gmailLogoutHelper.verifyGmailPage();
	}
}
