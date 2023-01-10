package com.webapp.ccedu.util;

import javax.mail.*;

public class MyAuthentication extends Authenticator{      
    PasswordAuthentication pa; 
    public MyAuthentication(){        
        String id = "skkuonlinecampus@gmail.com";
        String pw = "jcnsmffxcuqqeylt";
        pa = new PasswordAuthentication(id, pw);      
    }    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}