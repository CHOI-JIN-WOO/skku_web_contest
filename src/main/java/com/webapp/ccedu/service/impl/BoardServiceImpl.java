package com.webapp.ccedu.service.impl;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.webapp.ccedu.mapper.BoardMapper;
import com.webapp.ccedu.service.BoardService;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
    @Resource(name = "BoardMapper")
    private BoardMapper boardMapper;

    public List<EduMap> getBoardList(DataMap data) throws Exception {        
        int bbsCount = 10;        
        if(!data.get("bbsCount").equals("")){
            bbsCount = data.getInt("bbsCount");
        }
        
    	data.setInt("rowCount", bbsCount);
        ParamUtil.setPagingValue(data);
        return boardMapper.getBoardList(data);
    }
    
    public int getBoardListCnt(DataMap data) throws Exception {
        return boardMapper.getBoardListCnt(data);
    }
    
    public EduMap getBoardView(DataMap data) throws Exception {
        return boardMapper.getBoardView(data);
    }
    
    public List<EduMap> getLateBoardList(DataMap data) throws Exception {
    	return boardMapper.getLateBoardList(data);
    }
    
    public void insertBoardInfo(HttpServletRequest request, DataMap data) throws Exception {
        try{
            data.setInt("bbsNo", boardMapper.getMaxBoardNo(data));
            boardMapper.insertBoardInfo(data);
        } 
        catch(Exception e){
            throw new FrontException(e);
        }        
    }
    
    public void updateBoardViewCnt(DataMap data) throws Exception {
        boardMapper.updateBoardViewCnt(data);
    }

    public void updateBoardInfo(HttpServletRequest request, DataMap data) throws Exception {
        data.putString("execFlag", "UPDATE");
        boardMapper.updateBoardInfo(data);
    }
    
    public void deleteBoardInfo(DataMap data) throws Exception {
    	this.deleteBoardReply(data);
        boardMapper.deleteBoardInfo(data);
    }

    public void insertBoardReply(DataMap data) throws Exception {
    	boardMapper.insertBoardReply(data);
    }
    
    public void changeBoardReplyStatus(DataMap data) throws Exception {
    	boardMapper.changeBoardReplyStatus(data);
    }
    
    private String stringToHtmlSign(String str){
	    String data =  str.replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&quot;", "\"").replaceAll("&#39;", "\\");
	    return data.replaceAll("<([pP]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","").replaceAll("</p>","<br/>");
	}
    
    public void deleteBoardReply(DataMap data) throws Exception {
    	boardMapper.deleteBoardReply(data);
    }
    
    public EduMap getLmsEdBbsCmtInfo(DataMap data) throws Exception {
    	return boardMapper.getLmsEdBbsCmtInfo(data);
    }
}
