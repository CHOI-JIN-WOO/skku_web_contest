package com.sangs.util;


import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginManager implements HttpSessionBindingListener{ 
   private static LoginManager loginManager = null; 
   
   private static Hashtable<HttpSession, String> loginUsers = new Hashtable<HttpSession, String>(); 
   
   
   private LoginManager(){
       super();
   }
   
   public static synchronized LoginManager getInstance(){ 
       if(loginManager == null){ 
           loginManager = new LoginManager(); 
       } 
       return loginManager; 
   } 
   
   public void valueBound(HttpSessionBindingEvent event) { 
       //session값을 put한다. 
       loginUsers.put(event.getSession(), event.getName()); 
   } 
   
   public void valueUnbound(HttpSessionBindingEvent event) { 
       //session값을 찾아서 없애준다. 
       loginUsers.remove(event.getSession()); 
   } 
   
   public void removeSession(String userId){ 
         Enumeration<HttpSession> e = loginUsers.keys(); 
         HttpSession session = null; 
         while(e.hasMoreElements()){ 
             session = e.nextElement(); 
             if(loginUsers.get(session).equals(userId)){ 
                 //세션이 invalidate될때 HttpSessionBindingListener를 
                 //구현하는 클레스의 valueUnbound()함수가 호출된다. 
                 session.invalidate(); 
             } 
         } 
   } 
   
   public boolean isValid(String userId, String userPw){ 
       
       /* 
         * 이부분에 Database 로직이 들어간다. 
         */ 
       return true; 
   } 


   public boolean isUsing(String userID){ 
       return loginUsers.containsValue(userID); 
   } 
   
   public void setSession(HttpSession session, String userId){  
       session.setAttribute(userId, this);
   } 
   
   public String getUserID(HttpSession session){ 
       return loginUsers.get(session); 
   } 
   public int getUserCount(){ 
       return loginUsers.size(); 
   } 
   public Collection<String> getUsers(){ 
       Collection<String> collection = loginUsers.values(); 
       return collection; 
   } 
} 