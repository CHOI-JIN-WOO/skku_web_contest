/*
 * Copyright 2008-2009 MOPAS(MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.com.cmm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HTMLTagFilter implements Filter{
	
	private FilterConfig config;	
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		chain.doFilter(new HTMLTagFilterRequestWrapper((HttpServletRequest)request), response);		
		
//	   HttpServletResponse res = ((HttpServletResponse) response);
//	   //교차 프레임 스크립팅 방어 누락
//	   res.setHeader("X-Frame-Options", "deny");
//	   //HTTP Strict-Transport-Security 헤더 누락
//	   res.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
//	   //Missing "X-Content-Type-Options" header
//	   res.setHeader("X-Content-Type-Options", "nosniff");
//	   //Missing "X-XSS-Protection" header
//	   res.setHeader("X-XSS-Protection", "1");
	}

	public void init(FilterConfig config) throws ServletException {
		this.config = config;		
	}
	
	public void destroy() {
		
	}
}
