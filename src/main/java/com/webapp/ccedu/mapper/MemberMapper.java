package com.webapp.ccedu.mapper;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("MemberMapper")
public interface MemberMapper {
    EduMap searchMberEmail(DataMap data) throws Exception;

    EduMap searchMberId(DataMap data) throws Exception;

    EduMap getFindId(DataMap data) throws Exception;

    EduMap getFindPw(DataMap data) throws Exception;

    void insertUnityMber(DataMap data) throws Exception;
    
    EduMap getLoginUserInfo(DataMap data) throws Exception;
    
    EduMap getUserInfoDuplByEmail(DataMap data) throws Exception;
    
    EduMap getUserLmsInfo(DataMap data) throws Exception;
    
    void insertMbrLoginLog(DataMap data) throws Exception;
    
    void updateLoginSuccessInfo(DataMap data) throws Exception;
    
    void updateJsessionId(DataMap data) throws Exception;

    void deleteJsessionId(DataMap data) throws Exception;

    String getSessionId(String loginId) throws Exception;

    void updateMemberInfo(DataMap data) throws Exception;

    void updateMemberSecsn(DataMap data) throws Exception;
    
    EduMap check(DataMap data) throws Exception;

    void changePw(DataMap data) throws Exception;    
}
