package com.webapp.ccedu.service;

import java.util.List;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

public interface BookService {
	List<EduMap> selectTotalBookList() throws Exception;
	
	EduMap selectBookInfo(DataMap data) throws Exception;
	
	Integer getBookPrice(String pNo) throws Exception;		
}