package com.testframework.helper;

import com.testframework.util.DriverHelper;

public class SearchGoogleHelper extends DriverHelper{

	private String locatorFile = "GooglePage.properties";
	
	public void enterTextOnSearch(String text)
	{
		type(locatorFile,"search_field_id",text);
	}
	
	public void clickOnSearchIcon()
	{
		clickOn(locatorFile,"search_icon_xpath");
	}
	
	public void clickOnSearchResult()
	{
		clickOn(locatorFile,"search_result_xpath");
	}
	
	public void verifyPageTitle(String Title)
	{
		verifyTitle(Title);
	}
}
