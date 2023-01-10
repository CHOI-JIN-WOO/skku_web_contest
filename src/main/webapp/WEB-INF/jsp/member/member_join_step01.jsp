<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript">
			var searching = false;
			
			function checkEmail(){
				if(!searching){
					if($("#userEmail1").val() == "" || $("#userEmail2").val() == ""){
						fnModalMsg('Please enter your email address.');	
						return false;
					}		
					
					searching = true;	
					
					var email = $("#userEmail1").val() +"@"+ $("#userEmail2").val();
					$.ajax({
					    url : "/user/ajaxMailConfirm.do",
					    data : {
							email : email
					  	},
					    dataType : "json",
					    type : 'post',
					    success : function(data){	
					    	if(data.result == "SUCCESS"){ 
					    		fnModalMsg("Authentication code sent.");
		
					    		$.ajax({
								    url : "/user/sendEmail.do",
								    data : {
										email : email
								  	},
								    dataType : "json",
								    type : 'post',
								    success : function(data){	
								    	if(data.result == "FAIL"){
								    		fnModalMsg("Error");
								    	}	
										searching = false;			    
								    },
								    error : function(e){
							    		fnModalMsg("Error");
										searching = false;	
								    }
							    });
					    	}
					    	else if(data.result == "FAIL"){
					    		fnModalMsg("The email address has already been registered.");	
								searching = false;		    		
					    	}
					    },
					    error : function(e) {
				    		fnModalMsg("Error");
							searching = false;	
					    }
				    });	
				}
			}
			
			function checkCode(){	
				$.ajax({
				    url : "/user/ajaxAuthCodeCheck.do",
				    data : {
				    	authNumber : $("#authNumber").val()
				  	},
				    dataType : "json",
				    type : 'post',
				    success : function(data){	
				    	if(data.result == "SUCCESS"){ 
			    			$('#email').val($("#userEmail1").val()+"@"+$("#userEmail2").val());	   
			    			$('#emailDupCheck').val("Y");	
			    			
				    		fnModalMsg("Authentication completed.",function(){
				    			$('#frm').attr('action', '/user/memberJoinStep02.do');
				    			frm.submit();			
				    		});
				    	}
				    	else if(data.result == "FAIL"){
				    		fnModalMsg("Authentication failed.");			    		
				    	}
				    },
				    error : function(e) {
			    		fnModalMsg("Error");
				    }
			    });	
			}
			
			function fnEmailDomainSet(){
				var selectedDomain = $('#userEmail3').val();
				$('#userEmail2').val('');
		
				if(selectedDomain == ''){
					$('#userEmail2').removeAttr('readonly');
				}
				else{
					$('#userEmail2').val(selectedDomain);
					$('#userEmail2').attr('readonly', 'readonly');
				}
			}
			
			function cancle(){
				fnConfirm("Cancel sign in?", function(result) {
					if(result){
						location.href = "/main/main.do";
					}
					else{
						return false;
					}
				});
			}
			
			$(document).ready(function(){
				onlyNumAlpha('userEmail1');
			});
		</script>
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
					<form name="frm" id="frm" action="" method="post">		
						<input type="hidden" name="email" id="email" value="" /> 	
						<input type="hidden" name="emailDupCheck" id="emailDupCheck" value="" />
						<div class="wrapper">
							<div class="cont_body">
							<div class="c_section">
								<div class="c_head_step">
									<ol>
										<li class="on"><span class="num_wrap"><span class="num">1. </span>Authentication</span></li>
										<li><span class="num_wrap"><span class="num">2. </span>Register</span></li>
										<li><span class="num_wrap"><span class="num">3. </span>Complete</span></li>
									</ol>
								</div>
							</div>
							<div class="c_section">
								<ul class="c_txtlist mgt_first">
									<li>Enter your email address for the authentication.</li>
								</ul>
								<div class="table_style_row table_style_row1">
									<table>
										<colgroup>
											<col class="col2_1" />
											<col />
										</colgroup>		
										<tr class="emailTr">
											<th rowspan="2" scope="row">Email authentication</th>
											<td>
												<div class="form_field">
													<input type="text" title="Email address" id="userEmail1" name="userEmail1" maxlength="30" class="input_email_id" />
													<span class="widbox widbox_email">@</span>
													<input type="text" title="domain" id="userEmail2" name="userEmail2" maxlength="50" class="input_email_domain" />
														<select title="manual" class="select_email_domain" id="userEmail3" name="userEmail3" onchange="fnEmailDomainSet(); return false;">
														<option value="">Manual</option>
														<c:forEach var="emap2" items="${mailDomainCodeList}" varStatus="status2">
															<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
														</c:forEach>
													</select>
													<button class="btn_graybg02 btn_postal_code checkEmailBtn" onclick="checkEmail();return false;">Authenticate</button>
												</div>
											</td>
										</tr>
										<tr class="emailAuthTr">
											<td>
												<div class="form_field">
													<input type="text" title="code" id="authNumber" name="authNumber" maxlength="6" class="authNumber" />
													<button class="btn_graybg02 btn_postal_code checkEmailBtn" onclick="checkCode();return false;">Confirm</button>
												</div>
											</td>
										</tr>	
									</table>	
								</div>							
								<div class="c_btn_center">
									<button onclick="cancle(); return false;" class="btn_graybg03">Cancel</button>
								</div>
							</div>	
						</div>
				   </form>
				</div>		
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>