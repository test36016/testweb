package com.testframework.util;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.testng.Assert;

public abstract class DriverHelper extends DriverTestCase{

	LocatorReader locatorReader = new LocatorReader(); 
	
	public WebElement driverFindElement(String locatorFile,String locator)
	{
		WebElement element = null;
		String arr[] = locator.split("_");
		int len = arr.length;
		String locatorType = arr[len-1];
		if(locatorType.equalsIgnoreCase("xpath"))
		{
			element = getDriver().findElement(By.xpath(locatorReader.getLocator(locatorFile,locator)));
		}else if(locatorType.equalsIgnoreCase("id"))
		{
			element = getDriver().findElement(By.id(locatorReader.getLocator(locatorFile, locator)));
		}
		return element;
	}
	
	public boolean isElementPresent(String locatorFile,String locator)
	{
		boolean result = false;
		try {
			driverFindElement(locatorFile,locator);
			result = true;
		} catch (Exception e) {
			result =false;
		}
		return result;
	}
	
	public void clickOn(String locatorFile,String locator)
	{
		driverFindElement(locatorFile,locator).click();
	}
	
	public void type(String locatorFile,String locator,String text)
	{
		driverFindElement(locatorFile, locator).clear();
		driverFindElement(locatorFile, locator).sendKeys(text);
	}
	
	public String getTitle()
	{
		String title = getDriver().getTitle();
		return title;
	}
	
	public void verifyTitle(String exceptedTitle)
	{
		String actualTitle = getTitle();
		Assert.assertEquals(actualTitle, exceptedTitle);
	}
	
	public String getText(String locatorFile,String locator)
	{
		String text =driverFindElement(locatorFile, locator).getText();
		return text;
	}
	
	public void verifyText(String locatorFile,String locator,String expectedText)
	{
		String actualText = getText(locatorFile,locator);
		Assert.assertEquals(actualText, expectedText);
	}
	
	public void assertElementPresent(String locatorFile,String locator)
	{
		Assert.assertTrue(isElementPresent(locatorFile,locator));
	}
}
