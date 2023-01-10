package com.webapp.ccedu.service;

import java.util.List;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

public interface CommonService {
    List<EduMap> selectMtCodeSub(DataMap data) throws Exception;
}
