package com.webapp.ccedu.service;

import java.util.List;
import com.sangs.support.EduMap;

public interface EducationService{
    String selectOnlineDetailTitle(Integer courseno) throws Exception;   

    List<EduMap> getMainCourseList() throws Exception; 
}