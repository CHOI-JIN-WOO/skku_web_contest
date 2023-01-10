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
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Sign in</h3>
					</div>			
				</div>		
				<div id="content">
					<div class="wrapper">	
						<div class="cont_body">
							<div class="c_section">
								<div class="c_head_step">
									<ol>
										<li><span class="num_wrap"><span class="num">1. </span>Authentication</span></li>
										<li><span class="num_wrap"><span class="num">2. </span>Register</span></li>
										<li class="on"><span class="num_wrap"><span class="num">3. </span>Complete</span></li>
									</ol>
								</div>
							</div>										
							<div class="c_msg_box column mgt_first">
								<div class="img_cpt_talk">
									<strong>Sign in Completed</strong>
								</div>
							</div>	
							<div class="c_btn_center">
								<button onclick="location.href='/user/login.do'" class="btn_bluebg03">Login</button>
								<button onclick="location.href='/main/main.do'" class="btn_blueline03">Home</a>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>