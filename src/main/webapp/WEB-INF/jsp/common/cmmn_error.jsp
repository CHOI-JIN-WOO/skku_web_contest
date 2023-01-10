<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>SKKU - Online Campus</title>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".gnb_items li").on("mouseover",function(e){
				    if($(e.currentTarget).hasClass("target_s_layer")){
				        if($(e.currentTarget).hasClass("course_layer")){
				            $(".gnb_s_layer").removeClass("on");
				            $(".gnb_course_layer").addClass("on");
				        }
				    }else{
				        $(".gnb_s_layer").removeClass("on");
				    }
				});				
				$(".gnb_s_layer").on("mouseleave",function(){
				    $(".gnb_s_layer").removeClass("on");
				});
			});
			function navi(){
				if($(".new_navi").hasClass("active")){
					$(".new_navi").removeClass("active");
					$(".mobile_head .btn_allmenu").css("background","url('/cmmn/images/m_btn_allmenu.png') no-repeat 100% 100% / 100% 100%");	
				}
				else{
					$(".new_navi").addClass("active");
					$(".mobile_head .btn_allmenu").css("background","url('/cmmn/images/m_btn_allmenu_close.png') no-repeat 100% 100% / 100% 100%");	
				}
			}	
		</script>
		<style>
			.error{height:638px;}
			.box{text-align:center; padding-top:160px;}
			.box h1{font-size:30px; padding:15px 0px; color:#000;}
			.box h3{font-size:15px; line-height:20px; margin-bottom:30px; font-weight:400;}
			.err_btn{background:#072A60; color:#fff; font-size:15px; padding:8px 20px;}
			
			@media (max-width:768px) {
				.box h1 {font-size:20px;}
				.box h3 {font-size:13px;}
			}
			
			@media (max-width:480px){
				.box h1 {font-size:15px;}
				.box h3 {font-size:11px;}
			}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>	
		<div id="content">
			<div class="error">
				<div class="cm_wrapper">
					<div class="box">
						<img src="/cmmn/images/sub/img_error_404.png" alt="Page not found.">
						<h1>Sorry.</br>Page cannot be loaded.</h1>
						<a href="/main/main.do" class="err_btn">Back</a>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>