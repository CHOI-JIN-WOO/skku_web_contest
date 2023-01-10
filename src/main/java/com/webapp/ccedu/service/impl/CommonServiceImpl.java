package com.webapp.ccedu.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.ccedu.mapper.CommonMapper;
import com.webapp.ccedu.service.CommonService;

@Service("CommonService")
public class CommonServiceImpl implements CommonService {

    @Resource(name = "CommonMapper")
    private CommonMapper commonMapper;
    
    public List<EduMap> selectMtCodeSub(DataMap data) throws Exception{
	   return commonMapper.selectMtCodeSub(data);
    }
}
