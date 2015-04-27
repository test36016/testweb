package com.testframework.util;


import java.io.FileInputStream;
import java.util.Properties;


public class LocatorReader {

	PropertyReader propertyReader = new PropertyReader();
	private FileInputStream file;
	public String getLocator(String locatorsFile, String key)
	{		String value = "";
		try {
			file = new FileInputStream(propertyReader.getPath()+"\\src\\com\\testframework\\locator\\"+locatorsFile);
			Properties prob = new Properties();
			prob.load(file);
			value = prob.getProperty(key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return value;
	}
}
