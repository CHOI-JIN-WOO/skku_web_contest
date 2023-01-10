<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript" src="/cmmn/js/jquery.cookie.js"></script> 
		<script type="text/javascript">		
			$(document).ready(function(){		
				if($.cookie('save_id')){	
					$('#login_id').val($.cookie('save_id'));
					$('#save_id_chk:checkbox').attr('checked','checked');
					$('#pwd').focus();				
				}
				else{
					$('#login_id').focus();	
				}		
			});
			
			function enterChk(){
				if(event.keyCode == 13){
					go_exec();
				}
			}
			
			var submitted = false;			
			function submitCheck(){
				if(submitted == true){ 
					fnModalMsg('Please wait.');
					return; 
				}
			  	setTimeout('go_exec()', 1000);		  	
			}
			
			function go_exec(){			
				if($('input[name=isMobile]').val() == 'true'){
					mtk.fillEncData();
				}
			
				if('' == $('#login_id').val()){
					fnModalMsg('Please enter ID.'
					,function(){
						$('#login_id').focus();
					});
					return;
				}
				if('' == $('#pwd').val()){
					fnModalMsg('Please enter password.'
					,function(){
						$('#pwd').focus();
					});
					return;
				}
				
				if($('#save_id_chk:checkbox').prop('checked')){
					$.cookie('save_id',$('#login_id').val(),{expires:7});
				} 
				else{
				 	$.cookie('save_id', '', { expires: -1 });
				} 
			    
			    submitted = true;
			    $("#isSNS").val("N");
		    	$("#frm").attr("action","/user/loginExec.do");
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
						<h3 class="cont_title">Login</h3>
					</div>			
				</div>
				<div id="content">
					<div class="wrapper">
						<div class="cont_body">
							<div class="c_section c_my_login_wrapper">
								<div class="c_my_login">
									<form name="frm" id="frm" action="" method="post"  target="_self">								
										<input type="hidden" name="isMobile" value=""/>							
										<input type="hidden" name="isSNS" id="isSNS" value=""/>
										<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
										<input type="hidden" name="$returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />	
										<input type="hidden" name="$pageMode" value="<c:out value="${REQUEST_DATA.pageMode}"/>"/>
										<input type="hidden" name="$ccNo" value="<c:out value="${REQUEST_DATA.ccNo}"/>"/>
										<input type="hidden" name="$mtAppType" value="<c:out value="${REQUEST_DATA.mtAppType}"/>"/>
										<input type="hidden" name="$courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>" />
										<input type="hidden" name="$cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>" />
										<input type="hidden" name="$mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>" />		
										<input type="hidden" name="$bcateno" value="<c:out value="${REQUEST_DATA.bcateno}"/>" />
		
										<div class="con_login">
											<div class="con_login_inner">
												<div class="con_login_t">											
													<div class="con_login_t_l">
														<input type="text"  title="Insert ID" placeholder="ID" id="login_id" name="userId" />
														<input type="password" title="Insert PW" placeholder="PASSWORD" id="pwd" name="pwd" class="enKey_qwer"/>
													</div>												
													<button class="btn_login" onclick="submitCheck(); return false;">LOGIN</button>
												</div>
												<div class="con_login_m">
													<div class="saveid">
														<input type="checkbox" id="save_id_chk">
														<label for="save_id_chk">Save ID</label>
													</div>
													<ul class="btns">
														<li><a href="/user/memberJoinType.do" class="btn_link">Sign in</a></li>
														<li><a href="/user/memberFindIdPw.do" class="btn_link">Find ID/PW</a></li>
													</ul>
												</div>
											</div>
										</div>
									</form>
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