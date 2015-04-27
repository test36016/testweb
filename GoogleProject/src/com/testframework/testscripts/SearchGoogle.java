package com.testframework.testscripts;


import org.testng.annotations.Test;
import com.testframework.helper.SearchGoogleHelper;
import com.testframework.util.DriverTestCase;

public class SearchGoogle extends DriverTestCase{

	SearchGoogleHelper helperSearchGoogle = new SearchGoogleHelper();
	
	@Test
	public void testSearchGoogle()
	{
		// Enter the Search text
		helperSearchGoogle.enterTextOnSearch("facebook");
		
		// Click on search icon
		helperSearchGoogle.clickOnSearchIcon();
		
		// Click on Search Result
		helperSearchGoogle.clickOnSearchResult();
		
		//Verify title of the page
		helperSearchGoogle.verifyPageTitle("facebook - Google Search");
	}
}
