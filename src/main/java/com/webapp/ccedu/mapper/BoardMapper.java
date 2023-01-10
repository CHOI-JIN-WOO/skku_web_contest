package com.webapp.ccedu.mapper;

import java.util.List;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("BoardMapper")
public interface BoardMapper {
    List<EduMap> getBoardList(DataMap data) throws Exception;

    int getBoardListCnt(DataMap data) throws Exception;

    List<EduMap> getLateBoardList(DataMap data) throws Exception;
    
    void insertBoardInfo(DataMap data) throws Exception;

    EduMap getBoardView(DataMap data) throws Exception;

    void updateBoardViewCnt(DataMap data) throws Exception;

    void updateBoardInfo(DataMap data) throws Exception;

    void deleteBoardInfo(DataMap data) throws Exception;

    void insertBoardReply(DataMap data) throws Exception;
   
    void changeBoardReplyStatus(DataMap data) throws Exception;

    int getMaxBoardNo(DataMap data) throws Exception;
    
    List<EduMap> getListReply(DataMap data) throws Exception;
    
    void deleteBoardReply(DataMap data) throws Exception;
    
    EduMap getLmsEdBbsCmtInfo(DataMap data) throws Exception;
}