package com.testframework.util;

import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.testng.ITestResult;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;


public abstract class DriverTestCase {

	enum driverType
	{
		Firefox,IE
	}

	// Initialize variable
	private static WebDriver driver;
	String screenshotName ;
	// Initialize object
	PropertyReader propertyReader = new PropertyReader();
	
	public void setDriver(String browserName)
	{
		if(driverType.Firefox.toString().equalsIgnoreCase(browserName))
		{
			driver = new FirefoxDriver();
		}else if(driverType.IE.toString().equalsIgnoreCase(browserName))
		{
			System.setProperty("webdriver.ie.driver", getPath()+"/Driver/IEDriverServer.exe");
			driver = new InternetExplorerDriver();
		}
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		driver.manage().timeouts().pageLoadTimeout(60, TimeUnit.SECONDS);
	}
	
	public WebDriver getDriver()
	{
		return driver;
	}

	@BeforeMethod
	//@BeforeClass
	public void setUp() throws IOException
	{
		setDriver(propertyReader.readConfig("BrowserName"));
		driver.get(propertyReader.readConfig("ApplicationURL"));
	}
	

	//@AfterClass
	@AfterMethod
	public void tearDown()
	{
		driver.quit();
	}
	
	@AfterMethod
	public void getScreenshotOnFailed(ITestResult testResult)
	{
		if(testResult.getStatus()==ITestResult.FAILURE)
		{
			screenshotName = testResult.getMethod().getMethodName();
			System.out.println("Failed Test Case ==> " +screenshotName);
			getScreenshot();
		}
	}
	public void getScreenshot() 
	{
		File screenShotPath = new File(getPath()+"\\Screenshot"+"\\Screenshot_"+currentDate());
		screenShotPath.mkdir();
		File screenShot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		try {
			FileUtils.copyFile(screenShot, new File(screenShotPath+"\\"+screenshotName+"_"+currentTime()+".png"));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public String currentTime()
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd_MM_yyyy_HH_mm a");
		Date date = new Date();
		String time = dateFormat.format(date);
		return time;
	}
	
	public String currentDate()
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd_MM_yyyy");
		Date date = new Date();
		String currDate = dateFormat.format(date);
		return currDate;
	}
	
	public String getPath()
	{
		String path = "";
		File file = new File("");
		path = file.getAbsolutePath();
		return path;
	}

}
