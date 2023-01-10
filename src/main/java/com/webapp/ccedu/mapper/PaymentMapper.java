package com.webapp.ccedu.mapper;

import java.util.List;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("PaymentMapper")
public interface PaymentMapper{
	EduMap selectUserInfo(Integer userno) throws Exception;

    Integer selectPaymentLastOrder() throws Exception;
    
    List<EduMap> selectPaymentList(DataMap data) throws Exception;
    
    List<EduMap> selectPaymentHist(String orderNo) throws Exception;
    
    void insertPayment(DataMap data) throws Exception;
}