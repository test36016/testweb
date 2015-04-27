package com.testframework.helper;

import com.testframework.util.DriverHelper;

public class GmailLogoutHelper extends DriverHelper {

	private String locatorFile = "Gmail.properties";
	
	public void clickOnLogout()
	{
		clickOn(locatorFile, "signOut_xpath");
	}
	
	public void verifyGmailPage()
	{
		assertElementPresent(locatorFile,"username_name_xpath");
	}
}
