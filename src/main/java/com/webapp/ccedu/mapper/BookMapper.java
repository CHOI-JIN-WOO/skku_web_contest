package com.webapp.ccedu.mapper;

import java.util.List;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("BookMapper")
public interface BookMapper {		
	List<EduMap> selectTotalBookList() throws Exception;	
	
	EduMap selectBookInfo(DataMap data) throws Exception;

	Integer getBookPrice(String pNo) throws Exception;	
}