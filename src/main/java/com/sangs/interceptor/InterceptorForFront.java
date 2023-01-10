package com.sangs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.sangs.session.SessionManager;

public class InterceptorForFront extends HandlerInterceptorAdapter{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        SessionManager sessionManager = SessionManager.getInstance();
        int sessionResult = sessionManager.executeFrontSessionCheck(request);
        if (sessionResult == SessionManager.SESS_RCODE_DOUBLE) {
            ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");
            modelAndView.addObject("msg", "Mutiple login detected.");
            modelAndView.addObject("url", "/main/main.do");
            throw new ModelAndViewDefiningException(modelAndView);
        }   
        return true;
    }

    @Override
	public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		try {
		}
		catch(Exception e){       	 
		}
	}
}