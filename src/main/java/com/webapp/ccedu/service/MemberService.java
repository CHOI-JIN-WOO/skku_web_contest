package com.webapp.ccedu.service;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

public interface MemberService {
    EduMap searchMberEmail(DataMap data) throws Exception;
    
    EduMap searchMberId(DataMap data) throws Exception;

    EduMap getFindId(DataMap data) throws Exception;

    EduMap getFindPw(DataMap data) throws Exception;
	
    void insertUnityMber(DataMap data) throws Exception;
    
    EduMap getLoginUserInfo(DataMap data) throws Exception;
    
    EduMap getUserInfoDuplByEmail(DataMap data) throws Exception;
    
    EduMap getUserLmsInfo(DataMap data) throws Exception;
   
    void insertMbrLoginLog(HttpServletRequest req, String sysGb, String transGb, String summary) throws Exception;
    
    void updateLoginSuccessInfo(DataMap data) throws Exception;
    
    void updateJsessionId(DataMap data) throws Exception;

    void deleteJsessionId(DataMap data) throws Exception;

    String getSessionId2(String loginId) throws Exception;
 
    void updateMemberInfo(DataMap data) throws Exception;

    void updateMemberSecsn(DataMap data) throws Exception;  
    
    EduMap check(DataMap data) throws Exception;
    
    void changePw(DataMap data) throws Exception;
 }
