<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript" src="/cmmn/js/jquery.cookie.js"></script>
		<script type="text/javascript">		
			function enterChk() {
				if(event.keyCode == 13) {
					go_exec();
				}
			}			
			var submitted = false;			
			function submitCheck() {
				if(submitted == true) { 
					fnModalMsg('Please wait.');
					return; 
				}
			  	setTimeout ('go_exec()', 1000);			  	
			}			
			function go_exec(){				
				if($('input[name=isMobile]').val() == 'true')	mtk.fillEncData();
			
				if('' == $('#pwd').val()) {
					fnModalMsg('Check your password');
					$('#pwd').focus();
					return;
				}
			    
			    submitted = true;
			    frm.submit();
				return; 
			}		
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Personal info</h3>
					</div>			
				</div>
				<div id="content">
					<div class="wrapper">
						<div class="cont_body">
							<div class="c_section">
								<form name="frm" id="frm" action="/user/modiForm.do" method="post"  target="_self">
									<input type="hidden" name="isMobile" value=""/>
		 							<div class="c_my_login" style="width:60%;margin:0 auto;">
										<div class="con_login">
											<p class="nt">Enter password for authentication.</p>
											<input type="text" title="id" value="<c:out value="${REQUEST_DATA.userId }"/>" disabled="disabled" />
											<input type="password" title="password" placeholder="PASSWORD" id="pwd" name="pwd" class="enKey_qwer"/>
										</div>
									</div>
									<div class="c_btn_center">
										<button type="button" onclick="history.back(-1);" class="btn_graybg03">Cancel</button>
										<button type="button" onclick="submitCheck()" class="btn_bluebg03">Authenticate</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>		
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>