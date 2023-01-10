package com.webapp.ccedu.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

public interface BoardService {
    List<EduMap> getBoardList(DataMap data) throws Exception;
    
    List<EduMap> getLateBoardList(DataMap data) throws Exception;

    EduMap getLmsEdBbsCmtInfo(DataMap data) throws Exception;
    
    int getBoardListCnt(DataMap data) throws Exception;

    EduMap getBoardView(DataMap data) throws Exception;

    void updateBoardViewCnt(DataMap data) throws Exception;

    void updateBoardInfo(HttpServletRequest request, DataMap data) throws Exception;
    
    void insertBoardInfo(HttpServletRequest request, DataMap data) throws Exception;

    void insertBoardReply(DataMap data) throws Exception;

    void changeBoardReplyStatus(DataMap data) throws Exception;
   
    void deleteBoardReply(DataMap data) throws Exception;
    
    void deleteBoardInfo(DataMap data) throws Exception;
}