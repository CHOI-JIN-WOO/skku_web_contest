<%@page import="java.net.HttpCookie"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	HttpServletRequest req = (HttpServletRequest)request;
	Cookie[] cookies = req.getCookies();
	try{
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("JSESSIONID")){
				response.setHeader("Set-Cookie", "JSESSIONID="+cookies[i].getValue()+";path=/;HttpOnly;Secure;SameSite=none");
			}		
		}
	}
	catch(Exception e){}
%>
	<footer id="footer">
		<div class="footlinks_fmlst">
			<div class="cm_wrapper">
				<ul class="footlinks">
					<li class="point"><a href="/common/termsConditions.do"><span>Terms of use</span></a></li>
					<li class="point"><a href="/common/privacy.do"><span>Privacy policy</span></a></li>
					<li class="point"><a href="/common/copyright.do"><span>Copyrights</span></a></li>
					<li class="point"><a href="/common/rejectEmail.do"><span>Email policy</span></a></li>
					<li class="point"><a href="/common/cancel.do"><span>Refund policy</span></a></li>
					<li class="point"><a href="/common/siteMap.do"><span>Sitemap</span></a></li>
				</ul>
				<div class="fmlst">
					<a href="#family_site" onclick="return false;">Family Site</a>
					<ul id="family_site" class="site_list">
						<li><a href="https://www.skku.edu" target="_blank" title="Open in new tab"><span>SKKU main</span></a></li>
						<li><a href="https://icampus.skku.edu" target="_blank" title="Open in new tab"><span>SKKU iCampus</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="foot_info">
			<div class="wrapper">
				<div class="foot_inner">
					<a href="/main/main.do" class="foot_logo_link">
						<img src="/cmmn/images/logo_footer.png" class="foot_logo" alt="logo"/>
					</a>
					<p class="txt_info">
						YulJeon-dong, JangAn-gu, Gyunggi-do, Korea<br/>
						TEL : 1234-5678<br/>
						Copyright ⓒ 2022 Choi Jin Woo, Shin Yun Seong. All rights reserved
					</p>
				</div>
			</div>
		</div>
	</footer>
</div>