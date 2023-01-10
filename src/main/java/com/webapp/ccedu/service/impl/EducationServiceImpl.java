package com.webapp.ccedu.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sangs.support.EduMap;
import com.webapp.ccedu.mapper.EducationMapper;
import com.webapp.ccedu.service.EducationService;

@Service("EducationService")
public class EducationServiceImpl implements EducationService{	
	@Resource(name = "EducationMapper")
	private EducationMapper educationMapper;

    public String selectOnlineDetailTitle(Integer courseno) throws Exception{
    	return educationMapper.selectOnlineDetailTitle(courseno);
    }	

    public List<EduMap> getMainCourseList() throws Exception {
        return educationMapper.getMainCourseList();
    }
}