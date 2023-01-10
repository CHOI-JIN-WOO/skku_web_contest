package com.sangs.util;

public class SangsNumUtil {
    public static double getDecimalValue(double d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
            format += "#";
        }
        format = "#."+format;
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return new Double(df.format(d)).doubleValue();
        }
        catch(Exception ex){ 
            return 0.0d;
        }
    }  
    
    public static String getDecimalStrValue(double d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
        	format += "#";
        }
        format = "#."+format;
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }
        catch(Exception ex){ 
        	return "0."+format;
        }
    }


    public static String getUnitValue(double d, int n) {
        String format = "";
        for(int i=0; i<n; i++) {
        	format += "0";
        }
        
        if (n > 0)
            format = ",###."+format;
        else
            format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }
        catch(Exception ex){ 
            return "0."+format;
        }
    }
    
    public static String getUnitValue(int d, int n) {
        String format = "";
        for(int i=0; i<n; i++){
        	format += "0";
        }
        
        if (n > 0)
            format = ",###."+format;
        else
            format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }
        catch(Exception ex){ 
            return "0."+format;
        }
    }
    
    public static String toString(double d) {
        String format = "";
       
        format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }
        catch(Exception ex){ 
            return "0."+format;
        }
    }
    
    public static String toString(int d) {
        String format = "";
       
        format = ",###";
        
        try{
            java.text.DecimalFormat df = new java.text.DecimalFormat(format);
            return df.format(d).toString();
        }
        catch(Exception ex){ 
            return "0."+format;
        }
    }
}
