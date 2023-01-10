package com.webapp.ccedu.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.webapp.ccedu.service.CommonService;
import com.webapp.ccedu.service.BookService;

@Controller
public class BookController {
    @Resource(name = "CommonService")
    private CommonService commonService;
    
    @Resource(name = "BookService")
    private BookService bookService; 
    
    @RequestMapping(value = "/book/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
		try {    
			request.setAttribute("listData", bookService.selectTotalBookList());			
			request.setAttribute("REQUEST_DATA", rMap);			
		} 
		catch (Exception e) {
		    throw new FrontException(e);
		}		
		return "/book/main";        
    }  
    
    @RequestMapping(value = "/book/view.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
		try {    
			EduMap tMap = bookService.selectBookInfo(rMap);
			
            if(tMap == null){
                request.setAttribute("msg", "Abnormal approach.");
                request.setAttribute("url", "/book/main.do");
                return "forward:/common/msgForward.do";
            }		            
            
            request.setAttribute("result", tMap);			
			request.setAttribute("REQUEST_DATA", rMap);			
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "/book/view";        
    }   
}