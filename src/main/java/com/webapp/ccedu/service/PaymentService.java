package com.webapp.ccedu.service;

import java.util.List;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

public interface PaymentService{	
	EduMap selectUserInfo(Integer userno) throws Exception;

	Integer selectPaymentLastOrder() throws Exception;
    
    List<EduMap> selectPaymentList(DataMap data) throws Exception;
    
    List<EduMap> selectPaymentHist(String orderNo) throws Exception;
	
	void insertPayment(DataMap rMap) throws Exception;	
}