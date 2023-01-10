package com.sangs.util.tags;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class AcademyOffPageNavigationTag extends TagSupport {	
	private static final long serialVersionUID = -8033235528371094919L;
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
		int prev10 = (int)Math.floor((cpage-1) / 5.0) * 5;
		int next10 = prev10 + 6;
		StringBuffer sbuf = new StringBuffer();
		sbuf.append("<div class=\'pagelist\'>");
		sbuf.append("<ul>");
		
		if(prev10 > 0) {
			sbuf.append("<li><a href=\'").append(link).append("(").append(prev10).append(");").append("\' class=\'pre\'></a></li>&nbsp;");
		}
		else{
			sbuf.append("<li><a class=\'first\'></a></li>&nbsp;");
			sbuf.append("<li><a class=\'pre\'></a></li>&nbsp;");
		}
		 		
		for (int i=1+prev10; i<next10 && i<=totalPage; i++ ) {
			if (i==cpage) {
				sbuf.append("<li><a check='"+i+"' class=\'on\' >").append(i).append("</a></li>&nbsp;");
				if (i != totalPage) sbuf.append("");
			} 
			else {
				sbuf.append("<li><a check='"+i+"' href=\'").append(link).append("(").append(i).append(");\' ").append(">").append(i).append("</a></li>&nbsp;");
				if (i != totalPage) sbuf.append("");
			}
		}		
		
		if(totalPage >= next10) {
			sbuf.append("<li><a href=\'").append(link).append("(").append(next10).append(");").append("\' class=\'next\'></a></li>&nbsp;");			
		}
		else{
			sbuf.append("<li><a class=\'next\'></a></li>&nbsp;");
			sbuf.append("<li><a class=\'last\'></a></li>&nbsp;");
		}			
		sbuf.append("</ul>");
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
