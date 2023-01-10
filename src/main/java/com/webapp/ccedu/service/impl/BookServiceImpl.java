package com.webapp.ccedu.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.ccedu.mapper.BookMapper;
import com.webapp.ccedu.service.BookService;

@Service("BookService")
public class BookServiceImpl implements BookService {	
	@Resource(name = "BookMapper")
	private BookMapper bookMapper;	 

	public List<EduMap> selectTotalBookList() throws Exception{
		return bookMapper.selectTotalBookList();
	}

	public EduMap selectBookInfo(DataMap data) throws Exception{
		return bookMapper.selectBookInfo(data);
	}	
	
	public Integer getBookPrice(String pNo) throws Exception{
		return bookMapper.getBookPrice(pNo);
	}
}
