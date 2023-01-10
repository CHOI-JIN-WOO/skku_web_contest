package com.webapp.ccedu.ctrl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.SangsCryptUtil;
import com.webapp.ccedu.service.BoardService;
import com.webapp.ccedu.service.EducationService;
import com.webapp.ccedu.service.MemberService;
import com.webapp.ccedu.util.MyAuthentication;
import com.webapp.ccedu.service.BookService;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Controller
public class MainController {
    private Logger log = LogManager.getLogger(this.getClass());
    
    @Resource(name = "EducationService")
    private EducationService educationService;

    @Resource(name = "BoardService")
    private BoardService boardService;
    
    @Resource(name = "BookService")
    private BookService bookService;

    @Resource(name = "MemberService")
    private MemberService memberService;
    
    @RequestMapping(value = "/main/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {   
            rMap.putString("bcateno", "1");  
            request.setAttribute("courseList", educationService.getMainCourseList());  
			request.setAttribute("bookList", bookService.selectTotalBookList());
            request.setAttribute("noticeList", boardService.getLateBoardList(rMap));
            request.setAttribute("REQUEST_DATA", rMap);   
        }
        catch(Exception e) { 
        	log.debug(e.getMessage());
            throw new FrontException(e);
        }
        return "/main/main";
    }	
	private char[] ranChar = { 
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
		'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
		'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', 
		'4', '5', '6', '7', '8', '9'
	};
	public String getRandomStr(int len){
	    String str = "";
	
	   for(int i = 0; i < len; i++){
	    	str = str + this.ranChar[getRanIdx()];
	    }	
	    return str;
	}
	
	private int getRanIdx(){
	    int ran = 0;
	    Random r = new Random();
	    ran = Math.abs(r.nextInt(this.ranChar.length));
	    return ran;
	}

    @RequestMapping(value = "/user/ajaxMailConfirm.do")
    public void ajaxMailConfirm(HttpServletRequest request, HttpServletResponse res, DataMap rMap, HttpSession sess) throws Exception{
    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        Map<String,Object> resultMap = new HashMap<String,Object>();

        request.setAttribute("email", memberService.searchMberEmail(rMap));
    	
    	if(request.getAttribute("email") == null){
			resultMap.put("result", "SUCCESS");
    	}
    	else{
    		resultMap.put("result", "FAIL");  	
    	}
        json = gson.toJson(resultMap);
        out.print(json);
    }

    @RequestMapping(value = "/user/ajaxMemberCheck.do")
    public void ajaxMemberCheck(HttpServletRequest request, HttpServletResponse res, DataMap rMap, HttpSession sess) throws Exception{
    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        Map<String,Object> resultMap = new HashMap<String,Object>();
      
    	EduMap map =  memberService.check(rMap);
    	
    	if(map != null) {
    		resultMap.put("loginType", map.getString("SNS_LOGIN_TYPE"));    
    		resultMap.put("result", "SUCCESS");		
    	} 
    	else{
    		resultMap.put("result", "FAIL");
    	} 
    	
        json = gson.toJson(resultMap);
        out.print(json);
    }

    @RequestMapping(value = "/user/sendEmail.do")
    public void sendEmail(HttpServletRequest request, HttpServletResponse res, DataMap rMap, HttpSession sess) throws Exception{
    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        final String FROM = "jihn011258@g.skku.edu";
	    final String FROMNAME = "SKKU Bookstore";
	    FROMNAME.getBytes("UTF-8");
	    final String TO = rMap.getString("email");
	    int PORT = 587;
	    String authNumber = this.getRandomStr(6);	    
	    String SUBJECT = "[SKKU] Authentication Code";    	    
	    String BODY = String.join(
	        System.getProperty("line.separator"),
	        "<div style= 'margin:0 auto; min-width:360px; max-width:600px;'>",
	        	"<div style= 'color:#363a42; font-size:14px; padding:20px 15px'>",
	        		"<img src='https://www.skku.edu/_res/skku//img/common/logo_o.png' style='width:518px; height:97px; display:block; margin:0 auto;'>",
	        		"<strong style= 'display:block; margin:20px auto; font-size:24px; text-align:center;'>Authentication code has been sent.</strong>",
	        		"<hr style='width:100%; height:2px; background:#000; border:none; margin:0px'>",
	        		"<div style='margin:10px; padding:20px; background-color:#f5f5f5; border:1px solid #ededed;'>",
		        		"<div style='width:100%;'>",
		                	"Please authenticate your account using the code below.<br>",
		                "</div>",
		                "<br>",
		                "<div style='width:50%; padding:20px 40px; margin:0 auto; border-radius:5px; font-weight:bold; color:#333; text-align:center; background:#fffdf0; border:2px solid #e1e1e1;'>",
				            "<div style='margin:0; padding:0;'>Code :",
		                		"<span style='color:#ef4449;'>"+authNumber+"</span>",
		                	"</div>",
		        		"</div>",
		        		"<br>",
		        		"<div style='width:100%; margin-bottom:20px;'>",
		        			"Thank you for using SKKU Online Campus.<br>",
		        		"</div>",
		        	"</div>",
	        	"</div>",
	        "</div>"
    	);   
	    
	    Properties props = System.getProperties();
        props.put("mail.smtp.port", PORT); 
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");      
        props.put("mail.smtp.host", "smtp.gmail.com");
        
        Authenticator auth = new MyAuthentication();
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        
        sess.setAttribute("authNumber",authNumber);
 
        try{
            msg.setFrom(new InternetAddress(FROM, FROMNAME));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
            msg.setSubject(SUBJECT, "UTF-8");
            msg.setContent(BODY, "text/html;charset=euc-kr");
            javax.mail.Transport.send(msg);
            
    		resultMap.put("result", "SUCCESS");		
        } 
        catch(Exception ex){
    		resultMap.put("result", "FAIL");
            ex.printStackTrace();     
        } 
    	
        json = gson.toJson(resultMap);
        out.print(json);
    }
    
    @RequestMapping(value = "/user/ajaxAuthCodeCheck.do")
    public void ajaxAuthCodeCheck(HttpServletRequest request, HttpServletResponse res, DataMap rMap, HttpSession sess) throws Exception{
    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        if(rMap.getString("authNumber").equals((String)sess.getAttribute("authNumber"))){
        	resultMap.put("result", "SUCCESS"); 
        }
        else{
    		resultMap.put("result", "FAIL");        	
        }
    	
        json = gson.toJson(resultMap);
        out.print(json);
    } 
    
    @RequestMapping(value = "/user/ajaxAuthCodeCheckId.do")
    public void ajaxAuthCodeCheckId(HttpServletRequest request, HttpServletResponse res, DataMap rMap, HttpSession sess) throws Exception{
    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        if(rMap.getString("authNumber").equals((String)sess.getAttribute("authNumber"))){
        	resultMap.put("result", "SUCCESS");    
        	String checkMberInfo = memberService.check(rMap).getString("UNITY_ID");
        	resultMap.put("checkMberInfo",checkMberInfo);
        }
        else{
    		resultMap.put("result", "FAIL");        	
        }
    	
        json = gson.toJson(resultMap);
        out.print(json);
    } 
    
    @RequestMapping(value = "/user/ajaxChangePW.do")
    public void ajaxChangePW(HttpServletRequest request, HttpServletResponse res, DataMap rMap, HttpSession sess) throws Exception{
    	res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        try{
        	String pass = rMap.getString("mberPw");
        	rMap.putString("pass", SangsCryptUtil.crypt(pass));

        	memberService.changePw(rMap);
	    	
        	resultMap.put("result", "SUCCESS");        	
        }
        catch(Exception e){
    		resultMap.put("result", "FAIL");        	
        }
    	
        json = gson.toJson(resultMap);
        out.print(json);
    }    
}