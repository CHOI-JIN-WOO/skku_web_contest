package com.sangs.util;
 
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

//import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.com.cmm.EgovStringUtil;

public class SangsFileUtil extends EgovStringUtil{
	public static void deleteFile(String fileName, String filePath) throws Exception  {		
		File f = new File(filePath +  File.separator + fileName);
		if( f.exists()) f.delete();
		
		File thumb = new File(filePath + "thumb/" + fileName);
		if( thumb.exists()) thumb.delete();		
	}
	
	public static ArrayList<String> readFile(String filePath) throws Exception{		
		ArrayList<String> temp = new ArrayList<String>();
	
	 	try {
			 BufferedReader in = new BufferedReader(
			           new InputStreamReader(new FileInputStream(filePath), "utf-8"));
				 
				 String str;
			   
			    while ((str= in.readLine())!= null){
			    	str =str.replaceAll(",", ".#");
				temp.add(str);
			}
			
			in.close(); 
			} 
	 	catch (Exception e) {
	 			e.getStackTrace();
	 		}
	 	return temp;	
	}
}
