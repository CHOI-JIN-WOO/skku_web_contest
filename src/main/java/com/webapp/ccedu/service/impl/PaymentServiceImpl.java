package com.webapp.ccedu.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.ccedu.mapper.PaymentMapper;
import com.webapp.ccedu.service.PaymentService;

@Service("PaymentService")
public class PaymentServiceImpl implements PaymentService{
	@Resource(name = "PaymentMapper")
	private PaymentMapper PaymentMapper;	 
		
	public EduMap selectUserInfo(Integer userno) throws Exception{
		return PaymentMapper.selectUserInfo(userno);
	}

    public Integer selectPaymentLastOrder() throws Exception{    	
        return PaymentMapper.selectPaymentLastOrder();
    }

    public List<EduMap> selectPaymentList(DataMap data) throws Exception{
    	return PaymentMapper.selectPaymentList(data);
    }
    
    public List<EduMap> selectPaymentHist(String orderNo) throws Exception{
    	return PaymentMapper.selectPaymentHist(orderNo);
    }
    
    public void insertPayment(DataMap data) throws Exception{
    	PaymentMapper.insertPayment(data);
    }    
}