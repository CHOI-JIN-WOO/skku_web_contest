<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.sangs.support.SangsProperties"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<script>
			$(document).ready(function(){
				$(".gnb_items li").on("mouseover",function(e){
				    if($(e.currentTarget).hasClass("target_s_layer")){
				        if($(e.currentTarget).hasClass("course_layer")){
				            $(".gnb_s_layer").removeClass("on");
				            $(".gnb_course_layer").addClass("on");
				        }
				    }
				    else{
				        $(".gnb_s_layer").removeClass("on");
				    }
				});
				
				$(".gnb_s_layer").on("mouseleave",function(){
				    $(".gnb_s_layer").removeClass("on");
				});
				
				$(".top_gnb > li").hover(
					function(){
						$(this).find("ul").show();
					},
					function(){
						$(this).find("ul").hide();
					}
				);
			});
		</script>
	</head>
	<body>
	<div id="wrap">
		<header id="header">
			<section class="util_section">
				<div class="cm_wrapper h100">
					<a href="/main/main.do" class="top_logo_link">
						<img src="/cmmn/images/logo.png" class="top_logo" alt="logo" />
					</a>
					<div class="top_category_menu">
						<div class="top_category">
							<img src="/cmmn/images/btn_gnb_menu.png" class="top_gnb_btn" alt="menubtn" />
							<span>Category</span>
						</div>
						<ul class="top_gnb">
							<li>
								<a href="/online/onlineEducationInfo.do" onclick="return false;">Lecture</a>
								<ul class="top_gnb_layer">
									<li><a href="/online/onlineEducationInfo.do">Algorithms</a></li>
									<li><a href="/online/onlineEducationInfo.do?courseno=2">Computer Architecture</a></li>
									<li><a href="/online/onlineEducationInfo.do?courseno=3">Operating System</a></li>
									<li><a href="/online/onlineEducationInfo.do?courseno=4">Web Programming</a></li>
								</ul>
							</li>
							<li>
								<a href="/book/main.do">Book</a>
							</li>
							<li class="">
								<a href="/bbs/notice/main.do" onclick="return false;">Board</a>
								<ul class="top_gnb_layer">
									<li><a href="/bbs/notice/main.do">Notice</a></li>
									<li><a href="/bbs/faq/main.do">FAQ</a></li>
									<li><a href="/bbs/qna/main.do">Q&A</a></li>
								</ul>
							</li>
							<li>
								<a href="https://icampus.skku.edu">Classroom</a>
							</li>
						</ul>
					</div>					
					<div class="top_r">					
						<ul class="util_sec_r">
						
							<!-- Logout -->
							<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
								<li>
									<a href="/bbs/notice.do" onclick="return false;">Customer Service</a>
									<div class="util_ly">
			                            <ul>
											<li><a href="/bbs/notice/main.do">Notice</a></li>
											<li><a href="/bbs/faq/main.do">FAQ</a></li>
											<li><a href="/bbs/qna/main.do">Q&A</a></li>
			                            </ul>
			                        </div>
								</li>
								<li><a href="/user/login.do">Login</a></li>
							</c:if>
							
							<!-- Login -->
							<c:if test="${REQUEST_DATA.SES_USERNO > 0}">
								<li style="font-size: 12px;"><b style="margin-right:1px;"><c:out value="${REQUEST_DATA.SES_USERNAME}"/></b>, welcome!</li>	
								<li>
									<a href="/bbs/notice.do" onclick="return false;">Customer Service</a>
									<div class="util_ly">
			                            <ul>
											<li><a href="/bbs/notice/main.do">Notice</a></li>
											<li><a href="/bbs/faq/main.do">FAQ</a></li>
											<li><a href="/bbs/qna/main.do">Q&A</a></li>
			                            </ul>
			                        </div>
								</li>	
								<li>
									<a href="/user/modiCheck.do" onclick="return false;">Mypage</a>
									<div class="util_ly">
			                            <ul>
											<li><a href="/user/modiCheck.do">Account</a></li>
											<li><a href="/user/payList.do">Order</a></li>
			                            </ul>
			                        </div>
								</li>					
								<li><a href="/user/logout.do">Logout</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</section>
			<div class="util_section_mg"></div>		
			
			<!-- Mobile  -->
			<div class="mobile_head">
				<div class="wrapper">
					<div class="mobile_top_wrapper">
						<button class="btn_allmenu" onclick="location.href='/common/siteMap.do';">Main Menu Open/Close</button>
						<div class="mobile_logo_wrapper">
							<a href="/main/main.do" class="mobile_logo_link" style="display:inline-block;width:auto;height:100%;">
								<img class="mobile_logo" src="/cmmn/images/logo.png" alt="logo" />
							</a>
						</div>
						<div class="login_state">
							<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
								<a href="/user/login.do">
									<img src="/cmmn/images/m_btn_login.png" alt="before login" />				
								</a>
							</c:if>
							<c:if test="${REQUEST_DATA.SES_USERNO > 0}">	
								<a href="/user/logout.do">
									<img src="/cmmn/images/m_btn_logout.png" alt="after login" />				
								</a>
							</c:if>			
						</div>
					</div>
				</div>
			</div>
		</header>
		<c:set var="serverMode" value='<%=SangsProperties.getProperty("Globals.ServerMode")%>'/>