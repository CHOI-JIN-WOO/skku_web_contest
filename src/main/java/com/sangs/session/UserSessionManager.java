package com.sangs.session;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DateUtil;
import com.webapp.ccedu.service.MemberService;

public class UserSessionManager {	
	private static final String SESSION_KEY = SangsProperties.getProperty("Globals.loginSessionNm");
    private static Logger      log         = LogManager.getLogger(UserSessionManager.class);
    
	public static UserSessionVO getUserSessionInsert(HttpServletRequest req, MemberService memberService, int userNo) {		
		UserSessionVO userSessionVO =  UserSessionManager.getUserSessionVO(req);		
		DataMap rMap = new DataMap();
		rMap.setInt("userNo", userNo);
		rMap.setString("noMtSubCode", null);
		
		try {
			EduMap eMap = memberService.getUserLmsInfo(rMap);
			if (eMap == null) {
				rMap.setString("noMtSubCode", "Y");
				eMap = memberService.getUserLmsInfo(rMap);
			}
			userSessionVO.setIsLogin("Y");
			userSessionVO.setUserNo(eMap.getInt("USERNO"));
			userSessionVO.setUserId(eMap.getString("USERID"));
			userSessionVO.setUserName(eMap.getString("USERNAME"));
			userSessionVO.setEmail(eMap.getString("EMAIL"));
			userSessionVO.setMobile(eMap.getString("MOBILE"));
			userSessionVO.setMobile(eMap.getString("MOBILE"));
			userSessionVO.setGradeCode(eMap.getString("MT_GRADE_CODE"));
			userSessionVO.setGradeNum(eMap.getInt("MT_GRADE_NUM"));
			userSessionVO.setGradeName(eMap.getString("MT_GRADE_NAME"));
			userSessionVO.setMberRegGb(eMap.getString("MBER_REG_GB"));
			userSessionVO.setStatusGb(eMap.getString("STATUS_GB"));
			userSessionVO.settutorAt(eMap.getString("TUTOR_AT"));
			userSessionVO.setBrthdy(eMap.getString("BRTHDY"));
			userSessionVO.setSessionId(eMap.getString("SESSION_ID"));
			userSessionVO.setLoginResult(UserSessionVO.LOGIN_SUCCESS);
			UserSessionManager.setUserSessionVO(req, userSessionVO);			
			return userSessionVO;
			
		} 
		catch (Exception ex) {			 
			return userSessionVO;
		}
	}
	
	public static UserSessionVO getUserSessionVO(HttpServletRequest req){		
		UserSessionVO userSessionVO = null;
		
		try {			
			Gson gson = new Gson();
			userSessionVO = gson.fromJson((String) req.getSession().getAttribute(SESSION_KEY), UserSessionVO.class);
			if(userSessionVO == null){
				userSessionVO = new UserSessionVO();
			}
			return userSessionVO;		
		}
		catch(Exception ex){ 
			log.debug(ex.getMessage());			 
			return new UserSessionVO();
		}
	}
	
	public static void setUserSessionVO(HttpServletRequest req, UserSessionVO userSessionVO){
		try {
			userSessionVO.setIpAddr(req.getRemoteAddr());
			userSessionVO.setLastAccDate(DateUtil.getNowDate(DateUtil.DATE_FORMAT_DEFAULT));
			userSessionVO.setLastAccUrl(req.getServerName()+req.getRequestURI());
			Gson gson = new Gson();
			String input = gson.toJson(userSessionVO, UserSessionVO.class);
			req.getSession().setAttribute(SESSION_KEY, input);
		}
		catch(Exception ex){ 
			log.debug(ex.getMessage());			 
		}
	}
	
    public static void deleteUserSessionVO(HttpServletRequest req) {
        try {
            req.getSession().removeAttribute(SESSION_KEY);
        } 
        catch (Exception ex) {        	 
        }
    }
    
	public static void setSessionString(HttpServletRequest req, String key, String value) {
		req.getSession().setAttribute(key, value);
	}
	
	public static String getSessionString(HttpServletRequest req, String key) {
		try {
			return req.getSession().getAttribute(key).toString();
		} 
		catch (Exception ex) {
			return "-";
		}
	}
}
