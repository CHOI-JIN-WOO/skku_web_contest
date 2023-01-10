package com.sangs.support;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Properties;
import egovframework.com.cmm.EgovWebUtil;

public class SangsProperties {
    private static final String RELATIVE_PATH_PREFIX 
    	 = SangsProperties.class.getResource("").getPath().substring(0, SangsProperties.class.getResource("").getPath().lastIndexOf("/com/"));
    
    private static final String GLOBALS_PROPERTIES_FILE
	    = RELATIVE_PATH_PREFIX + System.getProperty("file.separator") + "sangs" + System.getProperty("file.separator") + "props" + System.getProperty("file.separator") + "globals.properties";
 
    private static Properties props = null;
    
    public static String getProperty(String key) {
    	
    	String rtnVal = "";
    	if(props == null) {
    		try {
    			props = loadProperties();
    		} 
    		catch(Exception e) {
    		}
    	}
    	
    	if(props.containsKey(key)) 
    		rtnVal = props.getProperty(key).trim();
    	
    	return rtnVal;
    }
    
    public static void properyReload() {
    	try {
	    	props = loadProperties();
    	} 
    	catch(Exception e) {
		}
    }
    
    public static ArrayList<SangsMap> getPropertiyList() {
    	ArrayList<SangsMap> list = new ArrayList<SangsMap>();
    	
    	Enumeration<Object> eu = props.keys();
		while(eu.hasMoreElements()) {
			String key = (String)eu.nextElement();
			SangsMap map = new SangsMap();
			map.put("key", key);
			map.put("value", props.getProperty(key).trim());
			list.add(map);
		}
    	return list;
    }    
	
	public static Properties loadProperties() throws Exception {
		 
		Properties props = new Properties();
		FileInputStream fis = null;
		try {			
			fis = new FileInputStream(EgovWebUtil.filePathBlackList(GLOBALS_PROPERTIES_FILE));
			props.load(new java.io.BufferedInputStream(fis));			
		} 
		catch(Exception e){ 
			throw e;
		} 
		finally {
			try {
				if (fis != null) fis.close();
			} 
			
			catch (Exception ex) {
			}
		}
		return props;
	}	
}
