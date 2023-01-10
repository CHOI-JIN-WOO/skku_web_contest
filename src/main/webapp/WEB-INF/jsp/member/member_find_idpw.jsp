<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	
	<script type="text/javascript">
		var checkEmail = false;
		var searching = false;
		$(document).ready(function(){
			fnSetFindType('id');			
			checkEmail = false;			
		});	
		
	 	function fnFormReset(){			
			$('.findIdSec').hide();	$('.findPwSec').hide();			
			$('#mberId').val('');	$('#mberNm').val('');
			$('#brthYear').val('');	$('#brthMonth').val('');
			$('#brthDay').val('');	$('#moblphon1').val('010');
			$('#moblphon2').val('');$('#moblphon3').val('');
			$('#mail').val('');		$('#mail2').val('');
			$('#mail3').val('');	$('#ruId').val('');
			$('#ruNm').val('');		$('#ruBrthdy').val('');
			$('#ruMoblphon').val('');			
			$('#authYn').val('N');	$('#authNumber').val('');
			$("#certified").hide();	$('#firstNum').val('');
			$("#moblphon2, #moblphon3").removeAttr('readonly');
			$('#time').html('');
		}
		
		function fnSetFindType(type){
			$('#findType').val(type);
			
			if(type == 'id') {
				$('#memberIdTr').hide();
			}
			else{
				$('#memberIdTr').show();
			}
			$(".findPWtable").hide();
			$('.tabMenu').removeClass('on');
			$('#'+type+'Search').addClass('on');
    		$(".c_btn_center").show();
			
			fnFormReset();
		}
						
		function sendResult(){
			if(searching) {
				return;
			}
			searching = true;
			var findType = $('#findType').val();
			
			if(findType == 'pw') if(!fnValiCheck($('#mberId'),'Please enter your ID.')) return false;			
			if(!fnValiCheck($('#mberNm'),'Please enter your name.')) return false;
			if(!fnValiCheck($('#brthYear'),'Please enter the year of your birthday.')) return false;
			if(!fnValiCheck($('#brthMonth'),'Please enter the month of your birthday.')) return false;
			if(!fnValiCheck($('#brthDay'),'Please enter the day of your birthday.')) return false;
			if(!fnValiCheck($('#mail'),'Please enter your email.')) return false;
			
			var ruId = $("#mberId").val();
			var rmNm = $("#mberNm").val();
			var ruBrthdy = $("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val();
			var email = $("#mail").val() + "@" + $("#mail2").val();
			
			$('#authYn').val('N');
			
			$.ajax({
			    url : "/user/ajaxMemberCheck.do",
			    data : {
					rmNm : rmNm,
					ruBrthdy : ruBrthdy,
					email : email
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data) {			    	
			    	if(data.result == "SUCCESS") {
			    		$("#certified").show(); 
			    		$(".c_btn_center").hide();
			    		fnModalMsg("Passcode sent.");	
			    		
			    		$.ajax({
						    url : "/user/sendEmail.do",
						    data : {
								email : email
						  	},
						    dataType : "json",
						    type : 'post',
						    success : function(data){	
						    	if(data.result == "FAIL"){
						    		fnModalMsg("Error.");
						    	}	
								searching = false;			    
						    },
						    error : function(e){
					    		fnModalMsg("Error.");
								searching = false;	
						    }
					    });
			    	}
			    	else if(data.result == "FAIL") {
			    		$("#certified").hide();
			    		fnModalMsg("Information mismatch.");			    		
			    		searching = false;
			    		return false;
			    	}			    
			    },
			    error : function(e) {
		    		fnModalMsg("Error.");
			    }
		    });			
		};
	
		function athnt(){
			var authNumber = $('#authNumber').val();
			var findType = $('#findType').val();
			var ruId = $("#mberId").val();
			var rmNm = $("#mberNm").val();
			var ruBrthdy = $("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val();
			var email = $("#mail").val() + "@" + $("#mail2").val();
			
			$.ajax({
			    url : "/user/ajaxAuthCodeCheckId.do",
			    data : { 
			    	findType : findType,
					rmNm : rmNm,
					ruBrthdy : ruBrthdy,
					email : email,
			    	authNumber : authNumber
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data) {
			    	if(data.result == "SUCCESS") {			    		
			    		fnModalMsg("Authentication approval.");
						$('#authYn').val('Y');			
			    		$("#certified").hide();     		
						
						if(findType == 'id'){
							fnFindIdSuccess(data.checkMberInfo);
						}
						else{
							fnFindPwExec();						
						}
			    	} 
			    	else{			    		
			    		fnModalMsg("Information mismatch.<br>Please check again.");
						$('#authYn').val('N');			    		
			    	}			    
			    },
			    error : function(e) {
		    		fnModalMsg("Error.");
			    }
		    });				
		}
 		function fnFindIdSuccess(id){			
			$('#userId').html(id);
			$('.findIdSec').show();
			return false;
		} 		
		function fnFindPwExec(){
			$(".findPWtable").show();	
			$(".findPWtable .c_btn_center").show();	
		}
		
		function mberPwSet(){
			if($('#authYn').val() != "Y") return false;
			if(!fnValiCheck($('#mberNewPw'),'Please enter the password.')) return false;
			if(!fnValiCheck($('#mberNewPwRe'),'Please enter the password.')) return false;			
			if(!passwordCheck($('#mberNewPw'))) return false;
			if(!passwordCompare($('#mberNewPw'),$('#mberNewPwRe'))) return false;

			var ruId = $("#mberId").val();
			var rmNm = $("#mberNm").val();
			var ruBrthdy = $("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val();
			var email = $("#mail").val() + "@" + $("#mail2").val();
			var mberPw = $("#mberNewPw").val();			
			
			$.ajax({
			    url : "/user/ajaxChangePW.do",
			    data : { 
			    	rmNm : rmNm,
					ruBrthdy : ruBrthdy,
					ruId : ruId,
					email : email,
			    	mberPw : mberPw
			  	},
			    dataType : "json",
			    type : 'post',
			    success : function(data) {
			    	if(data.result == "SUCCESS") {	
			    		fnModalMsg("Password reset complete. Please re-login.",function(){location.href="/user/login.do";});
			    	} 
			    	else{	
			    		fnModalMsg("Error.");		    			    		
			    	}			    
			    },
			    error : function(e) {
		    		fnModalMsg("Error.");
			    }
		    });				
			
		}
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<div id="container">
		<div class="con_center">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">Find ID/PW</h3>
				</div>			
			</div>		
			<div id="content">
				<form name="frm" id="frm" method="post" action="">
					<fieldset>
					    <input type="hidden" name="findType" id="findType" value="id"/>
					    <input type="hidden" name="mberNm"/>
			        	<input type="hidden" name="brthYear"/>
			        	<input type="hidden" name="brthMonth"/>
			        	<input type="hidden" name="brthDay"/>
			        	<input type="hidden" name="mail"/>
			        	<input type="hidden" name="isMobile" value=""/>
			        	<input type="hidden" name="authYn" id="authYn" value="N"/>
			        	<input type="hidden" name="firstNum" id="firstNum" value=""/>
						<div class="wrapper">
							<div class="cont_body">
								<div class="c_section">						
									<div class="c_tab_link">
										<ul>
											<li style="width:50%;"><a href="#none" id="idSearch" onclick="fnSetFindType('id')" class="tabMenu on" title="Find ID">Find ID</a></li>
											<li style="width:50%;"><a href="#none" id="pwSearch" onclick="fnSetFindType('pw')" class="tabMenu" title="Find PW">Find PW</a></li>
										</ul>
									</div>
			
									<div class="table_style_row">
										<table>
											<colgroup>
												<col class="col2_1" />
												<col />
											</colgroup>
											<tr>
												<th scope="row">Name</th>
												<td>
													<div class="form_field">
														<input type="text" title="Name" id="mberNm" name="mberNm" class="wid_1" maxlength="50"/>
													</div>
												</td>
											</tr>
											<tr id="memberIdTr">
												<th scope="row">ID</th>
												<td>
													<div class="form_field">
														<input type="text" title="ID" id="mberId" name="mberId" class="wid_1" maxlength="50"/>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">Date of Birth</th>
												<td>
													<div class="form_field">
														<select title="Bday select" id="brthYear" name="brthYear" class="wid_date">
			                                           		<option value="">Select</option>
			                                           		<c:forEach var="i" begin="15" end="100" step="1">
			                                           			<option value="<c:out value="${REQUEST_DATA.nowYear - i}"/>"> <c:out value="${REQUEST_DATA.nowYear - i}"/></option>
			                                           		</c:forEach>
														</select>
														<select title="Bday select" id="brthMonth" name="brthMonth" class="wid_date">
			                                          		<option value="">Select</option>
			                                           		<c:forEach var="i" begin="1" end="12" step="1">
			                                           			<option value="<fmt:formatNumber value="${i}" pattern="00"/>"> <c:out value="${i}"/></option>
			                                           		</c:forEach>
														</select>
														<select title="Bday select" id="brthDay" name="brthDay" class="wid_date">
			                                        		<option value="">Select</option>
			                                        		<c:forEach var="i" begin="1" end="31" step="1">
			                                        			<option value="<fmt:formatNumber value="${i}" pattern="00"/>"> <c:out value="${i}"/></option>
			                                        		</c:forEach>
														</select>															
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">Email</th>
												<td>
													<div class="form_field">
														<input type="text" title="email ID"  id="mail" name="mail" maxlength="30" class="input_email_id"/>
														<span class="widbox widbox_email">@</span>
														<input type="text" title="domain" id="mail2" name="mail2" maxlength="50" class="input_email_domain"/>
														<select title="manual" class="select_email_domain" id="mail3" name="mail3" onchange="fnEmailDomainSet(); return false;">
			                                                <option value="">Manual</option>
			                                                <c:forEach var="emap2" items="${mailDomainCodeList}" varStatus="status2">
												        		<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
													        </c:forEach>
													    </select>										
													</div>
												</td>
											</tr>
											<tr id="certified">
												<th scope="row">Passcode</th>
												<td>
													<div class="form_field phone_code">
														<input type="text" maxlength="6" title="passcode" id="authNumber" style="width:100%;" />
														<button class="btn_bluebg04" onclick="athnt(); return false;">Confirm</button>
													</div>
												</td>
											</tr>
										</table>
										<span style="color: rgb(239, 84, 0); font-size: 14px;">※ Passcode will be sent only if the information is correct.</span>									
									</div>							
								</div>			
								<div class="c_btn_center">
									<a href="#none" onclick="sendResult();" class="btn_bluebg03">Send</a>
								</div>				
								<div class="find_result findIdSec" style="display:none;">
									<p>Your ID is <strong id="userId"></strong></p>
								</div>	
								<div class="table_style_row findPWtable" style='margin-top:50px;'>
									<table>
										<colgroup>
											<col class="col2_1" />
											<col />
										</colgroup>
										<tr>
											<th scope="row">New Password</th>
											<td>
												<div class="form_field">
													<input type="password" title="password" id="mberNewPw" name="mberNewPw" class="wid_1" maxlength="14"/>
													<p class="nt_pw">9~14 Eng/Num/Special letter(Except for the blank, &)</p>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">Confirm New Password</th>
											<td>
												<div class="form_field">
													<input type="password" title="confirm password" id="mberNewPwRe" name="mberNewPwRe" class="wid_1" maxlength="14"/>
												</div>
											</td>
										</tr>
									</table>		
									<div class="c_btn_center">
										<a href="#none" onclick="mberPwSet();" class="btn_bluebg03">Change</a>
									</div>	
								</div>
							</div>							
						</div>		
					</fieldset>
			  	</form>
			</div>		
		</div>	
	</div>
	<!--// container -->
	
	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
</html>