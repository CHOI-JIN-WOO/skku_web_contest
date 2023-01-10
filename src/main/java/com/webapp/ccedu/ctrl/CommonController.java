package com.webapp.ccedu.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sangs.support.DataMap;
import com.sangs.support.FrontException;

@Controller
public class CommonController {    
    @RequestMapping(value="/common/siteMap.do")
    public String commonMenu(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/common_menu";    	
    }      
    
    @RequestMapping(value="/common/termsConditions.do")
    public String termsConditions(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/terms_conditions";    	
    }     

    @RequestMapping(value="/common/privacy.do")
    public String privacy(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/privacy";    	
    }    

    @RequestMapping(value="/common/copyright.do")
    public String copyright(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/copyright";    	
    }        

    @RequestMapping(value="/common/rejectEmail.do")
    public String rejectEmail(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/reject_email";
    }     
    
    @RequestMapping(value="/common/navigation.do")
    public String navigation(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/navigation";
    }   
    
    @RequestMapping(value="/common/cancel.do")
    public String cancel(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/cancel";
    }
}