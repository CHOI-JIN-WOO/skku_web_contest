<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div id="content">
					<div class="wrapper">
						<div class="cont_body">
							<div class="sitemap_section">
								<h4>Lecture</h4>
								<ul class="sitemap_menu">
									<li>
										<a href="/online/onlineEducationInfo.do?courseno=1">Algorithms</a>
									</li>
									<li>
										<a href="/online/onlineEducationInfo.do?courseno=2">Computer Architecture</a>
									</li>
									<li>
										<a href="/online/onlineEducationInfo.do?courseno=3">Operating System</a>
									</li>
									<li>
										<a href="/online/onlineEducationInfo.do?courseno=4">Web Programming</a>
									</li>
								</ul>
							</div>						
							<div class="sitemap_section">
								<h4>Book</h4>
								<ul class="sitemap_menu">							
									<li>
										<a href="/book/main.do">Book</a>
									</li>
								</ul>
							</div>							
							<div class="sitemap_section">
								<h4>Customer Service</h4>
								<ul class="sitemap_menu">							
									<li>
										<a href="/bbs/notice/main.do">Notice</a>
									</li>
									<li>
										<a href="/bbs/faq/main.do">FAQ</a>
									</li>
									<li>
										<a href="/bbs/qna/main.do">Q&A</a>
									</li>
								</ul>
							</div>
							<c:if test="${REQUEST_DATA.SES_USERNO > 0}">	
								<div class="sitemap_section">
									<h4>Mypage</h4>
									<ul class="sitemap_menu">							
										<li>
											<a href="https://icampus.skku.edu">Classroom</a>
										</li>	
										<li>
											<a href="/user/modiCheck.do">Account</a>
										</li>
										<li>
											<a href="/user/payList.do">Payment</a>
										</li>
									</ul>
								</div>										
							</c:if>
						</div>
					</div>	
				</div>
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>