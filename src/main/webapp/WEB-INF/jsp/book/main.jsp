<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	</style>
	<script type="text/javascript">	
		function bookView(bno){
			$("#bookNo").val(bno);	
			$("#frm").submit();
		}	
	</script>
	</head>
	<body>	
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<form name="frm" id="frm" method="post" action="/book/view.do">
			<input type="hidden" id="bookNo" name="bookNo" value=""/>
		</form>	
		<div id="container">
			<div class="con_center">	
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Book Store</h3>
					</div>			
				</div>			
				<div id="content">
					<div class="wrapper">		
						<div class="cont_body">
							<div class="course_wrapper">
								<h3 class="cont_subtitle">Algorithms</h3>
								<div class="book_list_box">
									<ul class="book_list">
										<c:forEach items="${listData}" var="result">
											<c:if test="${result.BOOKCATENO == 1}">										
												<li>
													<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
														<img style="width:75%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
														<div class="info">
															<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
															<c:if test="${not empty result.PRICE}">
																<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>Won</p>
															</c:if>
															<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>Won</p>
														</div>
													</div>
												</li>							
											</c:if>											
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="course_wrapper">
								<h3 class="cont_subtitle">Computer Architecture</h3>
								<div class="book_list_box">
									<ul class="book_list">
										<c:forEach items="${listData}" var="result">
											<c:if test="${result.BOOKCATENO == 2}">										
												<li>
													<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
														<img style="width:75%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
														<div class="info">
															<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
															<c:if test="${not empty result.PRICE}">
																<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>Won</p>
															</c:if>
															<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>Won</p>
														</div>
													</div>
												</li>							
											</c:if>											
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="course_wrapper">
								<h3 class="cont_subtitle">Operating System</h3>
								<div class="book_list_box">
									<ul class="book_list">
										<c:forEach items="${listData}" var="result">
											<c:if test="${result.BOOKCATENO == 3}">										
												<li>
													<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
														<img style="width:75%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
														<div class="info">
															<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
															<c:if test="${not empty result.PRICE}">
																<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>Won</p>
															</c:if>
															<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>Won</p>
														</div>
													</div>
												</li>							
											</c:if>											
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="course_wrapper">
								<h3 class="cont_subtitle">Web Programming</h3>
								<div class="book_list_box">
									<ul class="book_list">
										<c:forEach items="${listData}" var="result">
											<c:if test="${result.BOOKCATENO == 4}">										
												<li>
													<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
														<img style="width:75%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
														<div class="info">
															<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
															<c:if test="${not empty result.PRICE}">
																<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>Won</p>
															</c:if>
															<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>Won</p>
														</div>
													</div>
												</li>							
											</c:if>											
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>