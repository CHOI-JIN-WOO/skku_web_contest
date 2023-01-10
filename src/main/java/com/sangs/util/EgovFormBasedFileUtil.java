package com.sangs.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;

import egovframework.com.cmm.EgovWebUtil;

public class EgovFormBasedFileUtil {
    private static final int BUFFER_SIZE = 8192;

    private static final String SEPERATOR = File.separator;

    public static String getTodayString() {
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());

	return format.format(new Date());
    }

    public static String getPhysicalFileName() {
	return EgovFormBasedUUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
    }

    protected static String convert(String filename) throws Exception {
    	return filename;
    }

    public static long saveFile(InputStream is, File file) throws IOException {
	if (! file.getParentFile().exists()) {
	    file.getParentFile().mkdirs();
	}

	OutputStream os = null;
	long size = 0L;

	try {
	    os = new FileOutputStream(file);

	    int bytesRead = 0;
	    byte[] buffer = new byte[BUFFER_SIZE];

	    while ((bytesRead = is.read(buffer, 0, BUFFER_SIZE)) != -1) {
		size += bytesRead;
		os.write(buffer, 0, bytesRead);
	    }
	} 
	finally {
	    if (os != null) {
		os.close();
	    }
	}

	return size;
    }

    @Deprecated
    public static List<EgovFormBasedFileVo> uploadFiles(HttpServletRequest request, String where, long maxFileSize) throws Exception {
	List<EgovFormBasedFileVo> list = new ArrayList<EgovFormBasedFileVo>();

	// Check that we have a file upload request
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if (isMultipart) {
	    // Create a new file upload handler
	    ServletFileUpload upload = new ServletFileUpload();
	    upload.setFileSizeMax(maxFileSize);	// SizeLimitExceededException

	    // Parse the request
	    FileItemIterator iter = upload.getItemIterator(request);
	    while (iter.hasNext()) {
	        FileItemStream item = iter.next();
	        String name = item.getFieldName();
	        InputStream stream = item.openStream();
	        if (item.isFormField()) {
	            
	            Logger.getLogger(EgovFormBasedFileUtil.class).info("Form field '" + name + "' with value '" + Streams.asString(stream) + "' detected.");
	        } else {
	            
	            Logger.getLogger(EgovFormBasedFileUtil.class).info("File field '" + name + "' with file name '" + item.getName() + "' detected.");

	            if ("".equals(item.getName())) {
	        	continue;
	            }

	            // Process the input stream
	            EgovFormBasedFileVo vo = new EgovFormBasedFileVo();

	            String tmp = item.getName();

	            if (tmp.lastIndexOf("\\") >= 0) {
	        	tmp = tmp.substring(tmp.lastIndexOf("\\") + 1);
	            }

	            vo.setFileName(tmp);
	            vo.setContentType(item.getContentType());
	            vo.setServerSubPath(getTodayString());
	            vo.setPhysicalName(getPhysicalFileName());

	            if (tmp.lastIndexOf(".") >= 0) {
	        	 vo.setPhysicalName(vo.getPhysicalName() + tmp.substring(tmp.lastIndexOf(".")));
	            }

	            long size = saveFile(stream, new File(EgovWebUtil.filePathBlackList(where) + SEPERATOR + vo.getServerSubPath() + SEPERATOR + vo.getPhysicalName()));

	            vo.setSize(size);

	            list.add(vo);
	        }
	    }
	} 
	else {
	    throw new IOException("form's 'enctype' attribute have to be 'multipart/form-data'");
	}

	return list;
    }
}
