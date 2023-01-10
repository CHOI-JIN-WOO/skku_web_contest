package com.sangs.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.SimpleTimeZone;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateUtil {
	
    public final static String DATE_FORMAT_DEFAULT = "yyyy-MM-dd HH:mm:ss";
    public final static String DATE_FORMAT_DEFAULT24 = "yyyy-MM-dd HH:mm:ss";
    public final static String DATE_FORMAT_TYPE02 = "yyyy-MM-dd";

    public static String getMonthAgoDate(int m) {
        Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
        cal.add(Calendar.MONTH ,m); 
           java.util.Date monthago = cal.getTime();
           SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
           return formatter.format(monthago);
    } 
    
    public static String getNowDate(String format){
        Calendar cal = Calendar.getInstance(); 
	    Date dt = cal.getTime(); 
	    SimpleDateFormat formatter = new SimpleDateFormat(format); 
	    return formatter.format(dt).trim(); 
    }
    
    
    public static String getNowDate(){
        Calendar cal = Calendar.getInstance(); 
        Date dt = cal.getTime();  
        SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT_TYPE02); 
        
        return formatter.format(dt).trim(); 
        
    }
    
    public static String getEndDate (int monthInt) throws Exception {
    	String EndDate = "";
    	Date date = new Date();
    	
    	int year = date.getYear();
    	int month = date.getMonth();
    	int day = date.getDate();
    	String strMonth = "";
    	String strDay = "";
    	Date date2 = new Date(year, month+1, day);
    	year = date2.getYear()+1900;
    	
    	//3개월로 증가
    	month = date2.getMonth()+monthInt;
    	
    	if(month > 12){
    		month -= 12;
    		year += 1;
    	}
    	
    	day = date2.getDate();
    	if(month < 10){
    		strMonth = "0"+month;
    	}else{
    		strMonth = String.valueOf(month);
    	}
    	
    	
    	if(day < 10){
    		strDay = "0"+day;
    	}
    	else{
    		strDay = String.valueOf(day);
    	}    	
    	
    	EndDate = year+"-"+strMonth+"-"+strDay;	

        return EndDate;     	
    }
    
    public static String getStartDate (int monthInt) throws Exception {
    	String EndDate = "";
    	Date date = new Date();
    	
    	int year = date.getYear();
    	int month = date.getMonth();
    	int day = date.getDate();
    	String strMonth = "";
    	String strDay = "";
    	Date date2 = new Date(year, month+1, day);
    	year = date2.getYear()+1900;    	
    	month = date2.getMonth()-monthInt;
    	
    	if(month > 12){
    		month -= 12;
    		year += 1;
    	}
    	
    	day = date2.getDate();
    	if(month < 10){
    		strMonth = "0"+month;
    	}else{
    		strMonth = String.valueOf(month);
    	}
    	
    	
    	if(day < 10){
    		strDay = "0"+day;
    	}else{
    		strDay = String.valueOf(day);
    	}
    	
    	
    	EndDate = year+"-"+strMonth+"-"+strDay;	

        return EndDate; 
    }

    public static String getFormatTime(int r_studytime){
        String c_studytime = "";
        if(r_studytime == 0) { 
            c_studytime = "-";
        } else if(r_studytime >= 3600) {
            c_studytime = DateUtil.getItostr(r_studytime/3600) + ":" + DateUtil.getItostr((r_studytime%3600)/60)  + ":" + DateUtil.getItostr(r_studytime%60);
        } else if(r_studytime >= 60)   {
            c_studytime = "00:"+ DateUtil.getItostr(r_studytime/60)   + ":" + DateUtil.getItostr(r_studytime%60);
        } else {
            c_studytime = "00:00:"+DateUtil.getItostr(r_studytime);
        }
        return c_studytime;
    }

    private static String getItostr(int val){
        String str = "";
        if (val < 10) str = "0";
        else str = "";
        str = str + val;
        return str;
    }
    
    public static long getDateGap(String sStartDate, String sEndDate) throws Exception
	{
		long lStartDate = str2long(getLongDate(sStartDate));
		long lEndDate = str2long(getLongDate(sEndDate));
		
		
		return (lEndDate - lStartDate) / (24*(60*(60*1000)));
	}
    
	public static String getLongDate(String sDate) throws Exception
	{
		Calendar calendar = Calendar.getInstance();
		if (sDate.length() == 8)
		{
			int y = str2int(sDate.substring(0,4));
			int m = str2int(sDate.substring(4,6));
			int d = str2int(sDate.substring(6,8));
			calendar.set(y, m-1, d);
		}
		else if (sDate.length() >= 14)
		{
			int y = str2int(sDate.substring(0,4));
			int m = str2int(sDate.substring(4,6));
			int d = str2int(sDate.substring(6,8));
			int h = str2int(sDate.substring(8,10));
			int mi = str2int(sDate.substring(10,12));
			int s = str2int(sDate.substring(12,14));
			calendar.set(y, m-1, d, h, mi, s);
		}

		return long2str(calendar.getTimeInMillis());
	}
	
	public static String get7DayAgoDate(String pfomat) {
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		cal.add(Calendar.DATE, -7);
		java.util.Date weekago = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat(pfomat, Locale.getDefault());
		
		return formatter.format(weekago);
	}
	
	
	public static String long2str(long val){
		//return (new Long(val).toString());
		return Long.toString(val);
	}
		
	public static long str2long(String val)
	{
		if (isEmptyString(val))
		{
			return 0;
		}
		else
		{
			return (Long.parseLong(val));
		}
	}
	
	public static boolean isEmptyString(String val)
	{
		if (val == null || "".equals(val))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public static int str2int(String val)
	{
		if (isEmptyString(val))
		{
			return 0;
		}
		else
		{
			return (Integer.valueOf(val).intValue());
		}
	}
	
	public static String getDateTimeMinSec() {
		String month = getMonth() + "";
		String day = getDay() + "";
		String hour = getHour() + "";
		String min = getMinute() + "";
		String sec = getSecond() + "";

		if(month.length() == 1) {
		  month = "0" + month;
		}
		if(day.length() == 1) {
		  day = "0" + day;
		}
		if(hour.length() == 1) {
		  hour = "0" + hour;
		}
		if(min.length() == 1) {
		  min = "0" + min;
		}
		if(sec.length() == 1) {
			sec = "0" + sec;
		}		
		return getYear()+""+month+""+day+""+hour+""+min+""+sec;
	}
	
	public static int getYear() { return getNumberByPattern("yyyy"); }

	public static int getMonth() { return getNumberByPattern("MM"); }

	public static int getDay() { return getNumberByPattern("dd"); }

	public static int getHour() {
		Calendar c = Calendar.getInstance();
		return c.get(Calendar.HOUR_OF_DAY);
	}

	public static int getMinute() {
		Calendar c = Calendar.getInstance();
		return c.get(Calendar.MINUTE);
	}

	public static int getSecond() {
		Calendar c = Calendar.getInstance();
		return c.get(Calendar.SECOND);
	}
	
	public static int getNumberByPattern(String pattern) {
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (pattern, java.util.Locale.KOREA);
		String dateString = formatter.format(new java.util.Date());
		//Date date1 = new Date();
		return Integer.parseInt(dateString);
		
	}
	
	public static String dayOfWeekNm(String dayStr) {
		String rtn = "";
		try {
			
			if(dayStr.length() != 10)
				return "";
			
	
		    Calendar calendar = Calendar.getInstance();
		    
		    String year = dayStr.substring(0, 4);
		    String month = dayStr.substring(5, 7);
		    String day = dayStr.substring(8, 10);
		    
		    calendar.set(Integer.parseInt(year), Integer.parseInt(month)-1, Integer.parseInt(day));
		 
		    String[] weekDay = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
		   
		    rtn = weekDay[calendar.get(Calendar.DAY_OF_WEEK) - 1];
			
		} catch(Exception e) {
			 
		}
		return rtn;
	}
}
