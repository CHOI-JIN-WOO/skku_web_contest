package com.sangs.util;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.regex.Pattern;

public class FileUtil {

    private static final Pattern dosSeperator = Pattern.compile("\\\\");
    private static final Pattern lastSeperator = Pattern.compile("/$");

    public static String getFileNameChop(String s) {
        if(s == null)
            return null;
        s = dosSeperator.matcher(s).replaceAll("/");
        int i = s.lastIndexOf("/");
        if(i > -1)
            return s.substring(i + 1);
        else
            return s;
    }

    public static String getCompleteLeadingSeperator(String s) {
        if(s == null)
            return null;
        s = dosSeperator.matcher(s).replaceAll("/");
        if(!s.endsWith(File.separator))
            s = s + "/";
        return s;
    }

    public static File getConvertFile(File file) {
        if(!file.exists()) {
            return file;
        }

        String s = file.getName();
        int i = s.lastIndexOf('.');
        String s1 = i != -1 ? s.substring(i) : "";
        String s2 = i != -1 ? s.substring(0, i) : s;

        int j = 0;
        do {
            
            file = new File(getCompleteLeadingSeperator(file.getParent()) + s2 + "[" + j + "]" + s1);
           
        	
            j++;
        } while(file.exists());

        return file;
    }
    
    public static boolean deleteFile(String path, String delFileName) throws Exception{

    	boolean returnValue = false;

		File fileDir = new File(path); //저장 디렉토리.
		if(fileDir.exists() && fileDir.isDirectory()){
			File[] datafile= fileDir.listFiles();
			for(int n=0;n<datafile.length;n++){
				if (datafile[n].getName().equals(delFileName)){
					datafile[n].delete();
					break;
				}
			}
			returnValue = true;
		}else{
			returnValue = true;
		}

    	return returnValue;
    }

    public static void deleteFile(String fileInfo) throws Exception {
    	if(fileInfo == null || fileInfo.equals(""))
    		return;
    	
    	File delFile = new File(fileInfo);

    	if(delFile.exists() && delFile.isFile()){
    		delFile.delete();
    	}
    	
    }
    
    public static void commonDeleteGroupfile(int fileGroupNo) throws Exception {

    	
    	Connection con = null;
    	
    	try{
    		/*
	    	//Connection
	    	con = DBManager.getConnection();
	        con.setAutoCommit(false);
	        CommonDAO dao = new CommonDAO(con);
	        
	        //파일정보
	        DataMap fileMap = dao.getListUploadFile(fileGroupNo);
	        if(fileMap == null) return;
	        fileMap.setNullToInitialize(true);
	        
			if(fileMap.keySize("fileGroupNo") > 0){
				
				//DB의 기존 파일의 모든 정보
				for(int i=0; i < fileMap.keySize("fileGroupNo"); i++){
					//파일 삭제.
					deleteFile(fileMap.getString("filePath", i));
				}
				
				//기존 groupFile 삭제.
				dao.deleteUploadFileGroupNo(fileGroupNo);  
			}
			
			con.commit();
			*/
        } catch (Exception e) { 
        	if(con != null) con.rollback();
            throw new Exception(e);
        } finally {
            if (con != null) {
                try {
                	con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e1) {
                }
            }
        }
    }   
    
    public static boolean fileYn(String path, String fileNm) throws Exception{

    	boolean returnValue = false;

		File fileDir = new File(path); //저장 디렉토리.
		if(fileDir.exists() && fileDir.isDirectory()){
			File[] datafile= fileDir.listFiles();
			for(int n=0; n<datafile.length; n++){
				if (datafile[n].getName().equals(fileNm)){
					break;
				}
			}
			returnValue = true;
			
		}else{
			returnValue = false;
		}

    	return returnValue;
    }
}

