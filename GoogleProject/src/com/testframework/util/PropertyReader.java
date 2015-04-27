package com.testframework.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

public class PropertyReader {

	public String readConfig(String key)
	{
			String value = ""; 
			
			try {
				FileInputStream file = new FileInputStream(getPath()+"\\src\\com\\testframework\\configuration\\readApplication.properties");
				Properties prob = new Properties();
				prob.load(file);
				value = prob.getProperty(key);
			} catch (Exception e) {
				// TODO: handle exception
			}
			return value;
	}
	
	public String getPath()
	{
		String path = "";
		File file = new File("");
		path = file.getAbsolutePath();
		return path;
	}
}
