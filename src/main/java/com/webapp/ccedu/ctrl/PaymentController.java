package com.webapp.ccedu.ctrl;

import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.webapp.ccedu.service.BookService;
import com.webapp.ccedu.service.PaymentService;

@Controller
public class PaymentController{
    @Resource(name = "BookService")
    private BookService bookService; 
    
    @Resource(name = "PaymentService")
    private PaymentService paymentService; 

    @RequestMapping(value = "/payment/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{  	      
		try{    		
			String pType = rMap.getString("productCd");
			
			if("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))){
				request.setAttribute("msg", "Need login.");
				request.setAttribute("url", "/user/login.do");
				return "forward:/common/msgForward.do";
			}			
			if(pType.equals("") || pType == null){
				request.setAttribute("msg", "Abnormal approach.");
				request.setAttribute("url", "/main/main.do");
				return "forward:/common/msgForward.do";
			}
			
			rMap.putString("productPr", rMap.getString("price"));			
			rMap.putString("productNm", rMap.getString("booknm"));		
			rMap.putString("productNo", rMap.getString("bookno"));		
			rMap.putString("productCount", rMap.getString("bookcount"));			
			request.setAttribute("userInfo", paymentService.selectUserInfo(rMap.getInt("SES_USERNO")));		
			request.setAttribute("REQUEST_DATA", rMap);			
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "/payment/main";        
    }

    @RequestMapping(value = "/payment/approve.do")
    public String onlinePayApprove(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        request.setAttribute("REQUEST_DATA", rMap);
        try{ 		
			String pType = rMap.getString("pCd");
			String pNo = rMap.getString("pNo");
			String pCnt = rMap.getString("pCnt");
			Integer price = 0;
			Integer totalPrice = 0;
        			
			if("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))){
				request.setAttribute("msg", "Need Login.");
				request.setAttribute("url", "/user/login.do");
				return "forward:/common/msgForward.do";
			}  	
			
			if(pType.equals("") || pType == null){
				request.setAttribute("msg", "Abnormal approach.");
				request.setAttribute("url", "/main/main.do");
				return "forward:/common/msgForward.do";
			}
			
			String orderNo = rMap.getString("allat_order_no");
			List<EduMap> orderList = paymentService.selectPaymentHist(orderNo);
			
			if(orderList.size() > 0){
				request.setAttribute("msg", "Already purchased.");
				request.setAttribute("url", "/main/main.do");
				return "forward:/common/msgForward.do";
			}
			else{		
				rMap.putString("pCd","TT0002");	
				rMap.putInt("pAmount", Integer.parseInt(pCnt));
				paymentService.insertPayment(rMap);				
				price = bookService.getBookPrice(pNo);
				totalPrice = Integer.parseInt(pCnt) * price;
	        	request.setAttribute("price",Integer.toString(totalPrice));	 
			}
		}
        catch(Exception e){
		}
        
		return "redirect:/user/payList.do";
    }

    @RequestMapping(value = "/payment/ajaxFindLastOrderIdx.do")
    public void findLastOrderIdx(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null ;

        json =  gson.toJson(paymentService.selectPaymentLastOrder());       

        out.print(json);
        out.flush();
        out.close();        
    }  
}