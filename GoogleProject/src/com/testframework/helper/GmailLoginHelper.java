package com.testframework.helper;

import com.testframework.util.DriverHelper;
import com.testframework.util.PropertyReader;

public class GmailLoginHelper extends DriverHelper{

	private String locatorFile = "Gmail.properties";
	private String locatorFile2 = "GooglePage.properties";
	PropertyReader propertyReader = new PropertyReader();

	public void clickOnGmail()
	{
		clickOn(locatorFile2, "gmail_xpath");
	}

	public void enterEmail()
	{
		type(locatorFile,"username_id",propertyReader.readConfig("userName"));
	}

	public void enterPassword()
	{
		type(locatorFile,"password_id",propertyReader.readConfig("password"));
	}

	public void clickOnSignIn()
	{
		clickOn(locatorFile, "signIn_id");
	}

	public void verifyHomePage()
	{
		assertElementPresent(locatorFile,"username_name_xpath");
	}

	public void verifyUserName(String text)
	{
		clickOn(locatorFile, "username_icon_xpath");
		verifyText(locatorFile, "username_text_xpath",text);

	}
}