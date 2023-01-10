package com.webapp.ccedu.ctrl;

import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.SangsUtil;
import com.webapp.ccedu.service.BoardService;

@Controller
public class BoardController{   
    @Resource(name = "BoardService")
    private BoardService boardService; 
    
    @RequestMapping(value = "/bbs/qna/main.do")
    public String qnaMain(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{    	
    	try{    
			rMap.putString("bcateno", "13");	
			
            request.setAttribute("listData", boardService.getBoardList(rMap));            
            request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));    	    
			request.setAttribute("REQUEST_DATA", rMap);		
    	}
    	catch(Exception e){
            throw new FrontException(e);
        }		    			
    	return "/bbs/qna/main";
    }
    
    @RequestMapping(value = "/bbs/qna/view.do")
    public String qnaView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{    	
    	try{    	    
            EduMap boardMap = boardService.getBoardView(rMap);
    	        	    
	    	if(boardMap != null){
            	rMap.setString("userInfoDiv","N");
                if((rMap.getInt("SES_USERNO") == boardMap.getInt("USERNO")) || rMap.getInt("SES_USERNO") == 1){	
                	if(rMap.getInt("SES_USERNO") == boardMap.getInt("USERNO")){
                		rMap.setString("userInfoDiv","Y");
                	}
			    	request.setAttribute("rowData", boardMap);
			    	request.setAttribute("title", SangsUtil.removeScriptTag(stringToHtmlSign(boardMap.getString("TITLE"))));
			    	request.setAttribute("content", SangsUtil.removeScriptTag(stringToHtmlSign(boardMap.getString("CONTENT"))));
								    	
			    	EduMap cmtRowData = boardService.getLmsEdBbsCmtInfo(rMap);	                
	                if(cmtRowData != null){
	                	cmtRowData.put("REPLY", SangsUtil.removeScriptTag(stringToHtmlSign(cmtRowData.getString("REPLY"))));
		                request.setAttribute("cmtRowData", cmtRowData);
	                }	                
		    	}
                else{
					request.setAttribute("msg", "Only the author can see the post."); 
					request.setAttribute("url", "/bbs/qna/main.do"); 
					return "forward:/common/msgForward.do";
				}
            	request.setAttribute("REQUEST_DATA", rMap); 
    		}
	    	else{
    			request.setAttribute("msg", "Post is not present."); 
    			request.setAttribute("url", "/bbs/qna/main.do"); 
    			return "forward:/common/msgForward.do";
    		}			
    	}
    	catch(Exception e){ 
            throw new FrontException(e);
        }
    	return "/bbs/qna/view";    	
    }   
    
    @RequestMapping(value = "/bbs/qna/form.do")
    public String qnaForm(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws FrontException {
        try{        	
        	if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1){      
                request.setAttribute("msg", "Need login.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }        	
        	
        	if(rMap.getString("type").equals("update")){
            	EduMap boardMap = boardService.getBoardView(rMap);
            	
                if(rMap.getInt("SES_USERNO") != boardMap.getInt("USERNO")){
                	request.setAttribute("msg", "Cannot be edit."); 
                	request.setAttribute("url", "/bbs/qna/main.do"); 
                	return "forward:/common/msgForward.do";
                }                
                request.setAttribute("rowData", boardMap);
        	}        	
        	request.setAttribute("REQUEST_DATA", rMap);        
        } 
        catch (Exception e){
            throw new FrontException(e);
        }       
        return "/bbs/qna/form";
    }
    
    @RequestMapping(value = "/bbs/qna/exec.do")
    public String qnaExec(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws FrontException{        
        String url = "";
        
        try{        	
        	if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1){
                request.setAttribute("msg", "Need login.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }      	    	      
        	
        	if("13".equals(rMap.getString("bcateno"))){
        		url = "/bbs/qna/main.do";
        	} 
        	else{
        		request.setAttribute("msg", "Abnormal approach.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
        	}
        	
        	
        	if(rMap.getString("type").equals("update")){
                boardService.updateBoardInfo(request, rMap);
                request.setAttribute("REQUEST_DATA", rMap);
        	}
        	else{		// insert
                boardService.insertBoardInfo(request, rMap);
                request.setAttribute("REQUEST_DATA", rMap);
        	}        	
        }
        catch(Exception e){
            throw new FrontException(e);
        }
        
        request.setAttribute("url", url);
        return "forward:/common/msgForward.do";
    }

	@RequestMapping(value = "/bbs/qna/del.do")
	public String qnaDel(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception{
		try{		   		
			boardService.deleteBoardInfo(rMap);
			request.setAttribute("msg", "Post deleted.");
			request.setAttribute("url", "/bbs/qna/main.do");
		}	
		catch(Exception e){
		}   
		return "forward:/common/msgForward.do";		
	}    
	
    @RequestMapping(value="/bbs/qna/replyIns.do")
    public void insertReply(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws Exception{    	
    	response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String json = null;
        try{        	      	
        	if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1){
				json = gson.toJson("FAIL");        	     
				out.print(json);
				out.flush();
				out.close();
            }        	 
        	if(rMap.getInt("SES_USERNO") == 1){	  
    			String status = "Y";
    			rMap.putString("status",status);
    			
    			boardService.insertBoardReply(rMap);        		
    			boardService.changeBoardReplyStatus(rMap);              		
	            json = gson.toJson("SUCCESS"); 
        	}       
        	else{
	            json = gson.toJson("FAIL"); 
        	}
        } 
        catch (Exception ex){
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();    	
    }
    
    @RequestMapping(value="/bbs/qna/replyDel.do")
    public void deleteReply(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws Exception{    	
    	response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String json = null;
        try{        	
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") != 1){
                json = gson.toJson("FAIL");                
                out.print(json);
                out.flush();
                out.close();
            }
            
            if(rMap.getInt("SES_USERNO") == 1){
    			String status = "N";
    			rMap.putString("status",status);	
    			
                boardService.deleteBoardReply(rMap);
    			boardService.changeBoardReplyStatus(rMap);    
                json = gson.toJson("SUCCESS");           	
            }
            else{
                json = gson.toJson("FAIL");            	
            }            
        }
        catch (Exception ex){
            json = gson.toJson("FAIL");
        }
        out.print(json);
        out.flush();
        out.close();    	
    }
    
    @RequestMapping(value = "/bbs/notice/main.do")
    public String noticeMain(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{    	
    	try{    
			rMap.putString("bcateno", "1");			
            request.setAttribute("listData", boardService.getBoardList(rMap));            
            request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));    	    
			request.setAttribute("REQUEST_DATA", rMap);		
    	}
    	catch(Exception e){
            throw new FrontException(e);
        }		    			
    	return "/bbs/notice/main";
    }    

    @RequestMapping(value = "/bbs/notice/view.do")
    public String noticeView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{    	
    	try{   		
    		boolean flag = Pattern.matches("^[0-9]*$", rMap.getString("bcateno"));    		
    		if(flag == true) {    			
	    		boardService.updateBoardViewCnt(rMap);
		    	EduMap boardMap = boardService.getBoardView(rMap);
		    	
		    	if(boardMap != null) {
			    	request.setAttribute("rowData", boardMap);
					
					int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
					int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
					
					rMap.setInt("bbsNo", bbsnoPrev);
					request.setAttribute("prevData", boardService.getBoardView(rMap));
					
					rMap.setInt("bbsNo", bbsnoNext);
					request.setAttribute("nextData", boardService.getBoardView(rMap));
		    	}				
		    	else{
	    			request.setAttribute("msg", "Post does not exist."); 
	    			request.setAttribute("url", "/bbs/notice/main.do"); 
	    			return "forward:/common/msgForward.do";		    		
		    	}
				request.setAttribute("REQUEST_DATA", rMap);
    		
    		} 
    		else{
    			request.setAttribute("msg", "Post does not exist."); 
    			request.setAttribute("url", "/bbs/notice/main.do"); 
    			return "forward:/common/msgForward.do";
    		}
			
    	} 
    	catch(Exception e){
            throw new FrontException(e);
        }    	
    	return "/bbs/notice/view";    	
    }    

    @RequestMapping(value = "/bbs/faq/main.do")
	public String faq(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws FrontException{		
		try{			
			rMap.putString("bcateno", "5");	
			
            request.setAttribute("listData", boardService.getBoardList(rMap));            
            request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));    	    
			request.setAttribute("REQUEST_DATA", rMap);
		}
		catch(Exception e){
			throw new FrontException(e);
		}		
		return "/bbs/faq/main";		
	} 
    
    @RequestMapping(value = "/bbs/faq/view.do")
    public String faqView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{    	
    	try{   		
    		boolean flag = Pattern.matches("^[0-9]*$", rMap.getString("bcateno"));    		
    		if(flag == true) {    			
	    		boardService.updateBoardViewCnt(rMap);
		    	EduMap boardMap = boardService.getBoardView(rMap);
		    	
		    	if(boardMap != null) {
			    	request.setAttribute("rowData", boardMap);
					
					int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
					int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
					
					rMap.setInt("bbsNo", bbsnoPrev);
					request.setAttribute("prevData", boardService.getBoardView(rMap));
					
					rMap.setInt("bbsNo", bbsnoNext);
					request.setAttribute("nextData", boardService.getBoardView(rMap));
		    	}				
		    	else{
	    			request.setAttribute("msg", "Post does not exist."); 
	    			request.setAttribute("url", "/bbs/faq/main.do"); 
	    			return "forward:/common/msgForward.do";		    		
		    	}
				request.setAttribute("REQUEST_DATA", rMap);
    		
    		} 
    		else{
    			request.setAttribute("msg", "Post does not exist."); 
    			request.setAttribute("url", "/bbs/faq/main.do"); 
    			return "forward:/common/msgForward.do";
    		}
			
    	} 
    	catch(Exception e){
            throw new FrontException(e);
        }    	
    	return "/bbs/faq/view";    	
    }   

	private String stringToHtmlSign(String str){
	    String data =  str.replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&quot;", "\"").replaceAll("&#39;", "\'");
	    return data.replaceAll("<([pP]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","").replaceAll("</p>","<br/>");
	}	
}