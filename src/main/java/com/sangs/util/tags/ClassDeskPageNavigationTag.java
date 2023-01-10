package com.sangs.util.tags;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ClassDeskPageNavigationTag extends TagSupport {	
	private int cpage;
	private int total;
	private int pageSize;
	private String link;

	public int doStartTag() {
		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() { 
		if(cpage < 1)cpage = 1;
		
		int totalPage = (total-1)/pageSize + 1;
		int prev10 = (int)Math.floor((cpage-1) / 10.0) * 10;
		int next10 = prev10 + 11;
		
		StringBuffer sbuf = new StringBuffer();		
		sbuf.append("<div class='btn-pager'>");
		
		if(prev10 > 0) {
			sbuf.append("<a href=\"").append(link).append("(").append(prev10).append(");").append("\"  class=\"prev on\">Prev</a>");
		}
		else{
			sbuf.append("<a class=\"prev\">Prev</a>");
		}//이전10개
		 
		
		for (int i=1+prev10; i<next10 && i<=totalPage; i++ ) {
			if (i==cpage) {
				sbuf.append("<a href=\"#\" class=\"on\">").append(i).append("</a>");
				if (i != totalPage) sbuf.append("");
			} 
			else {
				sbuf.append(" <a href=\"").append(link).append("(").append(i).append(");\" ").append(">").append(i).append("</a>");
				if (i != totalPage) sbuf.append("");
			}
		}

		if(totalPage >= next10) {
			sbuf.append("<a href=\"").append(link).append("(").append(next10).append(");").append("\"  class=\"next on\">Next</a>");
		}
		else{
			sbuf.append("<a class=\"next\">Next</a>");
		}	
		
		sbuf.append("</div>");

		JspWriter out = pageContext.getOut();
		
		try {
			out.print(sbuf.toString());
		}
		catch (IOException e) {
		}
		return EVAL_PAGE;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
