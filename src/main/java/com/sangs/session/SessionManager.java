package com.sangs.session;

import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.sangs.support.SangsProperties;

public class SessionManager implements HttpSessionListener, HttpSessionBindingListener {
	
	private static SessionManager sessionManager; 
	private static ConcurrentHashMap<String, HttpSession> loginSessionFrontMap = new ConcurrentHashMap<String, HttpSession>();	
	public final static int SESS_RCODE_PASS = 100;
	public final static int SESS_RCODE_DOUBLE = -1;	
	protected Log log = LogFactory.getLog(this.getClass());	
	
    public SessionManager() {
    	super();
	}

	public static ConcurrentHashMap<String, HttpSession> getLoginSessionFrontMap() {
		return loginSessionFrontMap;
	}
	
	public static void setLoginSessionFrontMap(
			ConcurrentHashMap<String, HttpSession> loginSessionFrontMap) {
		SessionManager.loginSessionFrontMap = loginSessionFrontMap;
	}
	
    public static synchronized SessionManager getInstance(){
    	if (sessionManager == null) {
    		sessionManager = new SessionManager();
    	}
    	return sessionManager;
    }
    
    public void sessionCreated(HttpSessionEvent event){
    }
 
    public void valueBound(HttpSessionBindingEvent event) {
    }
	
    public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();	
 
		try {
			UserSessionVO userVo = (UserSessionVO)session.getAttribute(SangsProperties.getProperty("Globals.loginSessionNm"));
			loginSessionFrontMap.remove(userVo.getUserId());
		} 
		catch(Exception ex){ 
			log.debug(ex.getMessage()); 
		}		
	}

    public void valueUnbound(HttpSessionBindingEvent event) {
    }    
    
    public void setLoginSessionFront(HttpServletRequest req, String userId) {
    	HttpSession session = req.getSession();
    	loginSessionFrontMap.put(userId, session);
    }
    
    public int executeFrontSessionCheck(HttpServletRequest req) {
    	int result = 0;    	
    	if (SangsProperties.getProperty("Globals.frontDupLoginCheckYn").equals("N")) {
    		return result;
    	}
    	
    	try {
    		HttpSession reqSession = req.getSession();
    		UserSessionVO reqVo = UserSessionManager.getUserSessionVO(req);
    		
    		if(reqVo != null) {
	    		HttpSession mapSession = (HttpSession)loginSessionFrontMap.get(reqVo.getUserId());
	    		
				if (mapSession != null && !(reqSession.getId()).equals(mapSession.getId())) {
					result = SESS_RCODE_DOUBLE;
		    		UserSessionManager.deleteUserSessionVO(req);
				}
    		}
    		return result;
    	} 
    	catch(Exception ex){ log.debug(ex.getMessage());
    		return result;
    	}
    }
}
