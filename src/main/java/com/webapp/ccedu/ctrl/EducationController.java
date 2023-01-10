package com.webapp.ccedu.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sangs.support.DataMap;
import com.webapp.ccedu.service.EducationService;

@Controller
public class EducationController{
    @Resource(name = "EducationService")
    private EducationService educationService;
    
    @RequestMapping(value = "/online/onlineEducationInfo.do")
    public String info(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        if(rMap.getString("courseno").equals("") || rMap.getString("courseno") == null){
            rMap.setString("courseno", "1");
        }
        String title = educationService.selectOnlineDetailTitle(Integer.parseInt(rMap.getString("courseno")));       
                
        if(title == null || title == ""){
			request.setAttribute("msg", "Bad gateway."); 
			request.setAttribute("url", "/main/main.do"); 
			return "forward:/common/msgForward.do";        	
        }  
        
    	request.setAttribute("title", title);   
        request.setAttribute("REQUEST_DATA", rMap);
        return "/online/online_education_info";
    }
}