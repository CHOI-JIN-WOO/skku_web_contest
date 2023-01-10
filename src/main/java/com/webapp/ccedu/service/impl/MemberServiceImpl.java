package com.webapp.ccedu.service.impl;

import java.util.Enumeration;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.ccedu.mapper.MemberMapper;
import com.webapp.ccedu.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
    @Resource(name = "MemberMapper")
    private MemberMapper memberMapper;

    public EduMap searchMberEmail(DataMap data) throws Exception {
        return memberMapper.searchMberEmail(data);
    }
    
    public EduMap searchMberId(DataMap data) throws Exception {
        return memberMapper.searchMberId(data);
    }
    
    public EduMap getFindId(DataMap data) throws Exception {
        return memberMapper.getFindId(data);
    }
    public EduMap getFindPw(DataMap data) throws Exception {
        return memberMapper.getFindPw(data);
    }

    public void insertUnityMber(DataMap data) throws Exception {
    	memberMapper.insertUnityMber(data);       
    }
    
    public EduMap getLoginUserInfo(DataMap data) throws Exception {
        return memberMapper.getLoginUserInfo(data);
    }
    
    public EduMap getUserInfoDuplByEmail(DataMap data) throws Exception {
        return memberMapper.getUserInfoDuplByEmail(data);
    }
    
    public EduMap getUserLmsInfo(DataMap data) throws Exception {
        return memberMapper.getUserLmsInfo(data);
    }
    
    public void insertMbrLoginLog(
    		HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary
    		) throws Exception {
    	
    	DataMap data = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		try {			
			data.setString("sysGb", sysGb);
			data.setInt("transUserNo", userVo.getUserNo());
			data.setString("transUserId", userVo.getUserId());
			data.setString("transUserName", userVo.getUserName());
			data.setString("transIp", req.getRemoteAddr());
			data.setString("transGb", transGb);
			data.setString("summary", summary + "\n>: "+getRequesParameters(req)); 
			
			memberMapper.insertMbrLoginLog(data);			
		} 
		catch (RuntimeException e) {
        	 
        } 
		catch (Exception ex){
			 
		}    	
    }
    public void updateLoginSuccessInfo(DataMap data) throws Exception {
		try {
			memberMapper.updateLoginSuccessInfo(data);			
		} 
		catch (RuntimeException e) {        	 
        } 
		catch (Exception ex){			 
		}    	
    }
    
	private String getRequesParameters(HttpServletRequest req) {		
		String result = "";
		try {			
			@SuppressWarnings("rawtypes")
			Enumeration enums = req.getParameterNames();
			String key = "";
			String value[] = null;
			
			while (enums.hasMoreElements()){
				key = (String)enums.nextElement();
				value = req.getParameterValues(key);

				for(int i=0; i<value.length; i++){
					
					if (result.getBytes().length < 4000) {
						if (result.getBytes().length > 500) {
							result += key +"=<LONG DATA>&";
						} else {
							result += key +"="+value[i]+"&";
						}
					}
					
				}
			}
		} 
		catch(Exception ex){ 	 
		}
		return result;
	}	
    
    public void updateJsessionId(DataMap data) throws Exception{
    	memberMapper.updateJsessionId(data);
    }
    
    public void deleteJsessionId(DataMap data) throws Exception{
    	memberMapper.deleteJsessionId(data);
    }
    
    public String getSessionId2(String loginId) throws Exception{
    	return memberMapper.getSessionId(loginId);
    }
    
    public void updateMemberInfo(DataMap data) throws Exception {
    	memberMapper.updateMemberInfo(data);
    }

    public void updateMemberSecsn(DataMap data) throws Exception {
    	memberMapper.updateMemberSecsn(data);
    }
    
   	public EduMap check(DataMap data) throws Exception {
	   return memberMapper.check(data);
   	}
   	
   	public void changePw(DataMap data) throws Exception {
   		memberMapper.changePw(data);
   	}
}
