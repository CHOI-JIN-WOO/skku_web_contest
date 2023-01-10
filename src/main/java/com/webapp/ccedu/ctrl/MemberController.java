package com.webapp.ccedu.ctrl;

import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.ibm.icu.util.Calendar;
import com.sangs.session.SessionManager;
import com.sangs.session.UserSessionManager;
import com.sangs.support.ControllerParamManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.webapp.ccedu.service.MemberService;
import com.webapp.ccedu.service.CommonService;
import com.webapp.ccedu.service.PaymentService;

@Controller
public class MemberController {	
    private Logger  log = LogManager.getLogger(MemberController.class);

    @Resource(name = "MemberService")
    private MemberService memberService;

    @Resource(name = "CommonService")
    private CommonService commonService;

    @Resource(name = "PaymentService")
    private PaymentService paymentService; 

    @RequestMapping(value = "/user/login.do")
    private String login(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        try{
            if(!("").equals(rMap.getString("SES_USERID"))){
                req.setAttribute("msg", "Already Logged in.");
                req.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            }
            req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/main/main.do") );            
            req.setAttribute("REQUEST_DATA", rMap);
        }
        catch(Exception e){
	       throw new FrontException(e);
	    }
        return "/login/member_login";
    }
    
    @RequestMapping(value = "/user/loginExec.do")
    private String loginExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        try{
            String userId = "";     
            String password = "";   
            userId = rMap.getString("userId");   
            password = rMap.getString("pwd");             
            rMap.setString("pwd",  password);   
            
            Boolean isVerified = false;
            EduMap map = memberService.getLoginUserInfo(rMap);
                        
            if(map != null){
                rMap.setString("regUserId", userId);
                rMap.setInt("comNo", map.getInt("COMNO"));
            }     
            
            isVerified  = (map != null && SangsCryptUtil.isMatch(password, map.getString("PWD"))) ? true : false;
            
            if(isVerified){            	
            	int jsssionChk = 0;
                Cookie[] cookies = req.getCookies();
    			for (int i = 0; i < cookies.length; i++) {
    				cookies[i].getName(); 
    				cookies[i].getValue();
    				
    				if(cookies[i].getName().equals("JSESSIONID")){
    					jsssionChk=i;
    				}    			
    			}
    			String JSESSIONID = cookies[jsssionChk].getValue();
    			rMap.putString("jessionId", JSESSIONID);
    			memberService.updateJsessionId(rMap);    			    			
                UserSessionManager.getUserSessionInsert(req, memberService, map.getInt("USERNO"));
                SessionManager sessionManager = SessionManager.getInstance();
                sessionManager.setLoginSessionFront(req, userId);
                req.setAttribute("USERNAME", map.getString("USERNAME"));
                
                memberService.insertMbrLoginLog(req, "WWW", "S", "Login succeed");                
                memberService.updateLoginSuccessInfo(rMap);                
                req.setAttribute("url", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/main/main.do"));            
            }
            else{    	
		        rMap.setString("msg", "Please check the information.");
		        memberService.insertMbrLoginLog(req, "WWW", "F", "Login failed");
		        req.setAttribute("msg", rMap.getString("msg"));
		        req.setAttribute("url", "/user/login.do" );
		    }
        }
        catch(Exception e){
        	log.debug(e.getMessage());             
            throw new FrontException(e);
        }
        req.setAttribute("paramInputs", ControllerParamManager.getParamHtmlFormConvert(rMap));
        req.setAttribute("REQUEST_DATA", rMap);

        return "forward:/common/msgForward.do";
    }
    
    @RequestMapping(value = "/user/logout.do")
    private String logout(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	memberService.deleteJsessionId(rMap);   
        	memberService.insertMbrLoginLog(req, "WWW", "O", "Logout");
        }
        catch (Exception e){ 
        	throw new FrontException(e);
        }

        UserSessionManager.deleteUserSessionVO(req);

        return "redirect:/";
    }
    
    @RequestMapping(value = "/common/msgForward.do")
    public String msgForward(HttpServletRequest req, DataMap rMap) throws FrontException {
    	req.setAttribute("paramInputs", (String)req.getAttribute("paramInputs"));
        req.setAttribute("msg", (String)req.getAttribute("msg"));
        req.setAttribute("url", (String)req.getAttribute("url"));
        return "/common/msg_forward";
    }
    
    @RequestMapping(value = "/user/payList.do")
    public String payList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        try {
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {
                request.setAttribute("msg", "Need Login.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            } 
            else{
                request.setAttribute("REQUEST_DATA", rMap);                
                rMap.putString("code", "TT0002");   
                request.setAttribute("code", "TT0002");                      
            	request.setAttribute("result", paymentService.selectPaymentList(rMap));
            }
        }
        catch(Exception e){
        	log.debug(e.getMessage());
            throw new Exception(e);
        }        
        return "/member/pay_list";
    }
    
    @RequestMapping(value = "/user/modiCheck.do")
    private String modiCheck(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        try {
            if(("").equals(rMap.getString("SES_USERID"))){
                rMap.putString("$returnUrl", "/user/modiCheck.do");
                
                DataMap removeDataMap = new DataMap();
        	    removeDataMap = SangsUtil.dataMapRemoveScriptTag(rMap);
                req.setAttribute("paramInputs", ControllerParamManager.getParamHtmlFormConvert(removeDataMap));
                
                req.setAttribute("msg", "Need Login.");
                req.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }
            
            rMap.setString("userId", rMap.getString("SES_USERID"));
            req.setAttribute("REQUEST_DATA", rMap);
        }
        catch(Exception e){
	       throw new FrontException(e);
	    }
        return "/member/modi_check";
    }    
    
    @RequestMapping(value = "/user/modiForm.do")
    public String modiForm(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{       
        try{ 
            if (("").equals(rMap.getString("SES_USERID"))) {
            	req.setAttribute("msg", "Need Login.");
            	req.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }
            
            String password = rMap.getString("pwd");            
        	rMap.setString("userId",  rMap.getString("SES_USERID"));
        	rMap.setString("pwd",  password);        	

            Boolean isVerified = false;  
            EduMap map = memberService.getLoginUserInfo(rMap);
            
        	if(map != null && SangsCryptUtil.isMatch(password, map.getString("PWD"))){
        		isVerified = true;
        	}
        	
            if(isVerified){
        		req.setAttribute("uMap", map);
    	        rMap.setInt("nowYear", Calendar.getInstance().get(Calendar.YEAR));    	        
                req.setAttribute("REQUEST_DATA", rMap);
        	}
        	else{
            	req.setAttribute("msg", "Information mismatch.");
            	req.setAttribute("url", "/user/modiCheck.do");
                return "forward:/common/msgForward.do";
        	}        
        } 
        catch (Exception e) {
            throw new FrontException(e);
        }        
        return "/member/modi_form";
    }
    
    @RequestMapping(value = "/user/modiExec.do")
    public String modiExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
    	if(("").equals(rMap.getString("SES_USERID"))){
        	req.setAttribute("msg", "Need Login.");
        	req.setAttribute("url", "/user/login.do");
            return "forward:/common/msgForward.do";
        }       
        try{            
            rMap.setString("userId",  rMap.getString("SES_USERID"));
    		String password = SangsCryptUtil.crypt(rMap.getString("userPassword"));  
    		rMap.setString("pwd", password);
    		
        	memberService.updateMemberInfo(rMap);
        	
            req.setAttribute("REQUEST_DATA", rMap);            
            req.setAttribute("msg", "Account Info has been modified.");
            req.setAttribute("url", "/main/main.do");        
        } 
        catch (Exception e){
            throw new FrontException(e);
        }        
        return "forward:/common/msgForward.do";       
    }
    
    @RequestMapping(value = "/user/secsnForm.do")
    private String secsnForm(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        if(("").equals(rMap.getString("SES_USERID"))) {
            req.setAttribute("msg", "Need Login.");
            req.setAttribute("url", "/user/login.do");
            return "forward:/common/msgForward.do";
        }

        try{
            rMap.setString("userId", rMap.getString("SES_USERID"));
            rMap.setString("mtCode","PC");
            req.setAttribute("secsnCodeList", commonService.selectMtCodeSub(rMap));            
            req.setAttribute("REQUEST_DATA", rMap);
        }
        catch(Exception e){
	       throw new FrontException(e);
	    }
        return "/member/secsn_form";
    }
    
    @RequestMapping(value = "/user/secsnExec.do")
    private String secsnExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        if(("").equals(rMap.getString("SES_USERID"))) {
            req.setAttribute("msg", "Need Login.");
            req.setAttribute("url", "/user/login.do");
            return "forward:/common/msgForward.do";
        }        
        if(!(rMap.getString("userId")).equals(rMap.getString("SES_USERID"))) {
            req.setAttribute("msg", "Information mismatch.");
            req.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }
        
        try{ 
        	memberService.deleteJsessionId(rMap);
            UserSessionManager.deleteUserSessionVO(req);
        	rMap.putString("secsnID",rMap.getString("SES_USERID")+"_DEL_"+Integer.toString(rMap.getInt("SES_USERNO")));        	
    		memberService.updateMemberSecsn(rMap);        		
    		req.setAttribute("msg", "Withdrawal Completed.");        	
        	req.setAttribute("url", "/main/main.do");
            req.setAttribute("REQUEST_DATA", rMap);
        }
        catch (Exception e) {
	       throw new FrontException(e);
	    }
        return "forward:/common/msgForward.do";
    }
    
    @RequestMapping(value = "/user/memberJoinType.do")
    public String memberJoinType(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
            request.setAttribute("msg", "Cannot proceed while logged in.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }
        
        request.setAttribute("REQUEST_DATA", rMap);

        return "/member/member_join_type";
    }
    
    @RequestMapping(value = "/user/memberJoinStep01.do")
    public String memberJoinStep01(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
    	if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
            request.setAttribute("msg", "Cannot proceed while logged in.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }          
        if(rMap.getString("snsType").equals("") || rMap.getString("snsType") == null){
            request.setAttribute("msg", "Abnormal approach.");
            request.setAttribute("url", "/user/memberJoinType.do");
            return "forward:/common/msgForward.do";        	
        }
		try{
	        rMap.setString("mtCode","MA");
			request.setAttribute("mailDomainCodeList", commonService.selectMtCodeSub(rMap));
		} 
		catch(Exception e){
		}
		
        request.setAttribute("REQUEST_DATA", rMap);

        return "/member/member_join_step01";
    }
    
    @RequestMapping(value = "/user/memberJoinStep02.do")
    public String memberJoinStep02(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{        
        try{
            if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
                request.setAttribute("msg", "Cannot proceed while logged in.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            }           
            if(rMap.getString("email").equals("") || rMap.getString("email") == null){
                request.setAttribute("msg", "Email info missing.");
                request.setAttribute("url", "/user/memberJoinType.do");
                return "forward:/common/msgForward.do";        	
            }
			if(memberService.getUserInfoDuplByEmail(rMap) != null){
    			request.setAttribute("msg", "Email has been already registered.");
    			request.setAttribute("url", "/user/login.do");    			
    			return "forward:/common/msgForward.do";       				
			}            
        	if(!rMap.getString("emailDupCheck").equals("Y")){
                request.setAttribute("msg", "Please verify the email.");
                request.setAttribute("url", "/user/memberJoinStep01.do");
                return "forward:/common/msgForward.do";     
        	}
    		
	        rMap.setInt("nowYear", Calendar.getInstance().get(Calendar.YEAR));	        	        
	        request.setAttribute("REQUEST_DATA", rMap);
		}
        catch(Exception e){
		}    

        return "/member/member_join_step02";
    }
    
    @RequestMapping(value = "/user/memberJoinExec.do")
    public String memberJoinExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try{ 
        	if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
                request.setAttribute("msg", "Cannot proceed while logged in.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            } 
    		if(rMap.getString("email") == null || rMap.getString("email") == ""){
    			request.setAttribute("msg", "Abnormal approach.");
    			request.setAttribute("url", "/user/login.do");    			
    			return "forward:/common/msgForward.do";
    		}	
        	if(memberService.getUserInfoDuplByEmail(rMap) != null){
    			request.setAttribute("msg", "Email already registered.");
    			request.setAttribute("url", "/user/login.do");    
                return "forward:/common/msgForward.do";     
        	}

            String password = SangsCryptUtil.crypt(rMap.getString("userPassword"));
            rMap.setString("userPassword", password);    		    	
            rMap.setString("regAt", "Y");   
            rMap.setString("brthdy",rMap.getString("brthdy").replace(" ", ""));            
        	
            memberService.insertUnityMber(rMap);
            request.setAttribute("REQUEST_DATA", rMap);            
        } 
        catch (Exception e) {
			log.error(e.getMessage());
			throw new FrontException(e);
		}
        return "redirect:/user/memberJoinStep03.do";
    }
    
    @RequestMapping(value = "/user/memberJoinStep03.do")
    public String memberJoinStep04(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {
            request.setAttribute("msg", "Cannot proceed while logged in.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }        
        return  "/member/member_join_step03";
    }
    
    @RequestMapping(value = "/user/searchId.do")
    public void searchId(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {
            request.setAttribute("userId", memberService.searchMberId(rMap));

            int checkStat = 0;
            if (request.getAttribute("userId") != null) {
                checkStat = 1;
            } 
            else {
                checkStat = 0;
            }
            json = gson.toJson(String.valueOf(checkStat));
        }
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }    
    
    @RequestMapping(value = "/user/memberFindIdPw.do")
    public String memberFindIdPw(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
            request.setAttribute("msg", "Cannot proceed while logged in.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }
        rMap.setString("mtCode","MA");
        request.setAttribute("mailDomainCodeList", commonService.selectMtCodeSub(rMap));
        
        rMap.setInt("nowYear", Calendar.getInstance().get(Calendar.YEAR));
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "/member/member_find_idpw";
    }
    
    @RequestMapping(value = "/user/memberFindIdAjax.do")
    public void memberFindIdAjax(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        EduMap eMap = null;
        
        try{        	
        	String authCode = UserSessionManager.getSessionString(request, "authCode");
        	String userAuthNumber = UserSessionManager.getSessionString(request, "userAuthNumber");
        	
        	if(authCode.equals(userAuthNumber)){        		
        		eMap = memberService.getFindId(rMap);
        		json = gson.toJson(eMap);
                UserSessionManager.deleteUserSessionVO(request);        		
        	} 
        	else {
        		json = gson.toJson("CERT_FAIL");
        	}            
        }
        catch(Exception ex){
            UserSessionManager.deleteUserSessionVO(request);
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }
    
    @RequestMapping(value = "/user/memberFindPwAjax.do")
    public void memberFindPwAjax(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        EduMap eMap = null;
        
        try{
        	String authCode = UserSessionManager.getSessionString(request, "authCode");
        	String userAuthNumber = UserSessionManager.getSessionString(request, "userAuthNumber");
        	
        	if(authCode.equals(userAuthNumber)){                
                eMap = memberService.getFindPw(rMap);
                json = gson.toJson(eMap);
        	}
        	else{
        		json = gson.toJson("CERT_FAIL");
        	}            
        } 
        catch(Exception ex){
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }
}