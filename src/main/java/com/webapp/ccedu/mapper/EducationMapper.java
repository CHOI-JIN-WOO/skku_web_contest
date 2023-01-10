package com.webapp.ccedu.mapper;

import java.util.List;
import com.sangs.support.EduMap;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("EducationMapper")
public interface EducationMapper {
    String selectOnlineDetailTitle(Integer courseno) throws Exception;
    
    List<EduMap> getMainCourseList() throws Exception;
}