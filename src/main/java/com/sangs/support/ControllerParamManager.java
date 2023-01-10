package com.sangs.support;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class ControllerParamManager {
	public static String getParamHtmlFormConvert(Map<String, String> params) {
		
		String form = "";		
		Set<String> keys = params.keySet();
		Iterator<String> iter = keys.iterator(); 
		while (iter.hasNext()) {
			String key = iter.next();
			
			try {
				if (key.indexOf("$") > -1) {
					form += "<input type='hidden' name='"+key.replace("$", "")+"' value='"+params.get(key)+"' />\n";
				} 
			} 
			catch (Exception ex){ ex.printStackTrace();}
		}
		return form;
	}
	
	public static String getParamFormConvert(Map<String, String> params) {
		
		String form = "";
		
		Set<String> keys = params.keySet();
		Iterator<String> iter = keys.iterator(); 
		while (iter.hasNext()) {
			String key = iter.next();
			
			try {
				form += "<input type='hidden' name='"+key+"' value='"+params.get(key)+"' />\n";
			} catch (Exception ex){ ex.printStackTrace();}
		}
		return form;
	}	
}