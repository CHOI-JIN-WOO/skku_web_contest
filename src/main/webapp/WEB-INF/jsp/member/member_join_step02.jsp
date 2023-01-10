<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<div id="layer"	style="display: none; position: fixed; overflow: hidden; z-index: 9999; -webkit-overflow-scrolling: touch;">
		<button type="button" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 20px; height: 20px; background-image: url( '//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png' );"
			onclick="closeDaumPostcode()" alt="close"></button>
	</div>
	<script	src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
	<script>
		function isMobile() {
			return /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i
					.test(navigator.userAgent);
		}
	
		var element_layer = document.getElementById('layer');
		function closeDaumPostcode() {
			element_layer.style.display = 'none';
		}
		function openDaumPostcode() {
			daum.postcode.load(function(){
				new daum.Postcode({
					oncomplete : function(data){
						var fullAddr = data.address;
						var extraAddr = '';
	
						if (data.addressType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
									: '');
						}	
						document.getElementById('lnmZip').value = data.zonecode;
						document.getElementById('lnmAdres1').value = fullAddr;	
						element_layer.style.display = 'none';
	
						closeDaumPostcode();
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5
				}).embed(element_layer);
			});
			element_layer.style.display = 'block';
			initLayerPosition();
		}
		function initLayerPosition() {	
			var width = 300;
			if (!isMobile()) {
				width = 620;
			}	
			var height = 400;
			var borderWidth = 2;
	
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)
					/ 2 - borderWidth - 6)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			onlyNum2('moblphon2');
			onlyNum2('moblphon3');
			onlyNumAlpha('userId');
			
			$("#lnmZip").click(function(){
				openDaumPostcode();
			});
		});
		function cancle(){
			fnConfirm("Cancel sign in?", function(result) {
				if(result){
					location.href = "/main/main.do";
				}
				else{
					return false;
				}
			})
		}
		function fnGoSubmit(){	
			$("#sex").val($("input[name^='sex']:checked").val());
			$("#brthdy").val($("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val());	
		
			if(!fnValiCheck($('#userId'), 'Please enter the ID.'))
				return false;		
			if(!fnValiCheck($('#idDupCheck'), 'Please check for the ID duplication.'))
				return false;
			if(!fnValiCheck($('#userPassword'), 'Please enter the password.'))
				return false;
			if(!fnValiCheck($('#userPassword2'), 'Please verify the password.'))
				return false;
			if(!passwordCheck($('#userPassword'))){
				return false;
			}
			if(!passwordCompare($('#userPassword'), $('#userPassword2')))
				return false;	
			if(!fnValiCheck($('#userName'),'Please enter your name.'))
				return false;				
			if(!fnValiCheck($('#sex'), 'Please enter your gender.'))
				return false;
			if(!fnValiCheck($('#moblphon1'), 'Please enter the first part of your mobile number.'))
				return false;
			if(!fnValiCheck($('#moblphon2'), 'Please enter the second part of your mobile number.'))
				return false;
			if(!fnValiCheck($('#moblphon3'), 'Please enter the last part of your mobile number.'))
				return false;		
			if(!fnValiCheck($('#brthYear'),'Please enter the year of your date of birth.')) 
				return false;
			if(!fnValiCheck($('#brthMonth'),'Please enter the month of your date of birth.')) 
				return false;
			if(!fnValiCheck($('#brthDay'),'Please enter the day of your date of birth.')) 
				return false;		
			if(!fnValiCheck($('#lnmAdres1'), 'Please enter your home address.'))
				return false;
			if(!fnValiCheck($('#lnmAdres2'), 'Please enter your specific home address.'))
				return false;
	
			if($('input[name=isMobile]').val() == 'true')
				mtk.fillEncData();
	
			$('#frm').attr('action', '/user/memberJoinExec.do');
			frm.submit();
		}
		
		function searchId(){
			if(!fnValiCheck($('#userId'), 'Please enter ID.'))
				return false;
	
			var tUserId = $.trim($('#userId').val());
			if(tUserId == ''){
				fnModalMsg('Please enter ID.', function() {
					$('#userId').focus();
				});
			}
			else{
				ajaxSubmit('/user/searchId.do', {
					userId : tUserId
				}, 'json', eval('resultSearchId'));
			}
		}
		
		function resultSearchId(data){
			if(data == 1){
				$('#idDupCheck').val('');
				fnModalMsg('Same ID has already been registered.', function() {
					$('#userId').focus();
				});
	
			}
			else if(data == 0){
				$('#idDupCheck').val('Y');
				fnModalMsg('You can use the ID.', function() {
					$('#userId').focus();
				});
			}
		}		
	</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<form name="frm" id="frm" action="/user/memberJoinStep03.do" method="post">
			<input type="hidden" name="isMobile" value="" /> 
			<input type="hidden" name="sex" id="sex" value="" />
			<input type="hidden" name="brthdy" id="brthdy" value="" />
			<input type="hidden" name="idDupCheck" id="idDupCheck" value="" /> 
			
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
											<li class="on"><span class="num_wrap"><span class="num">2. </span>Register</span></li>
											<li><span class="num_wrap"><span class="num">3. </span>Complete</span></li>
										</ol>
									</div>
								</div>
								<div class="c_section">
									<ul class="c_txtlist mgt_first">
										<li>Please enter the information precisely.</li>
										<li>Your information will not be provided to the third.</li>
									</ul>
									<div class="table_style_row table_style_row1">
										<table>
											<colgroup>
												<col class="col2_1" />
												<col />
											</colgroup>																									
											<tr>
												<th scope="row"><span class="required"></span>ID</th>
												<td>
													<div class="form_field">
														<input type="text" title="ID" id="userId" name="userId" maxlemgth="20" class="input_pw_wid" />
														<button class="btn_graybg02 btn_postal_code" onclick="searchId();return false;">Dupl check</button>
													</div>
												</td>
											</tr>	
											<tr>
												<th scope="row"><span class="required"></span>Password</th>
												<td>
													<div class="form_field">
														<input type="password" title="PW" class="input_pw_wid enKey_qwer" id="userPassword" name="userPassword" />
														<p class="nt_pw">9~14 Eng/Num/Special letter(Except for the blank, &)</p>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required"></span>Confirm Password</th>
												<td>
													<div class="form_field">
														<input type="password" title="PW check" class="input_pw_wid enKey_qwer" id="userPassword2" name="userPassword2" />
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required"></span>Name</th>
												<td>
													<div class="form_field">
														<input type="text" title="Name" id="userName" name="userName" maxlength="60" class="input_pw_wid" value="<c:out value="${REQUEST_DATA.userName}"/>"/>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><span class="required"></span>Gender</th>
												<td>													
													<div class="form_field">
														<div class="ff_radio">
															<input type="radio" name="sex" id="jSexM" value="M"/><label for="jSexM">Male</label>
														</div>
														<div class="ff_radio">
															<input type="radio" name="sex" id="jSexF" value="F"/><label for="jSexF">Female</label>
														</div>
													</div>
												</td>
											</tr>											
											<tr>
												<th scope="row"><span class="required"></span>Mobile phone</th>
												<td>
													<div class="form_field maxwid360">
														<select title="Mobile 1st" name="moblphon1" id="moblphon1" style="width: 22%;">
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select>
														<span class="widbox" style="width: 8%;">-</span>
														<input type="text" title="Mobile 2nd" id="moblphon2" name="moblphon2" value="" maxlength="4" style="width: 31%;" /> 
														<span class="widbox" style="width: 8%;">-</span>
														<input type="text" title="Mobile 3rd" id="moblphon3" name="moblphon3" value="" maxlength="4" style="width: 31%;" />
													</div>
												</td>
											</tr>			
											<tr>
												<th scope="row"><span class="required"></span>Date of Birth</th>
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
											<tr class="emailTr">
												<th scope="row"><span class="required"></span>Email</th>
												<td>
													<div class="form_field">
														<input type="text" title="email" id="email" name="email" class="input_pw_wid" readonly value="<c:out value="${REQUEST_DATA.email}"/>"/>
													</div>
												</td>
											</tr>	
											<tr>
												<th scope="row"><span class="required"></span>Address</th>
												<td>
													<div class="form_field">
														<input type="text" title="zip" class="input_postal_code" id="lnmZip" name="lnmZip" readonly/>
														<button class="btn_graybg02 btn_postal_code" onclick="openDaumPostcode(); return false;">Search zipcode</button>
														<div class="address_box">
															<input type="text" title="address" class="input_address" id="lnmAdres1" name="lnmAdres1" title="address" readonly/>
															<input type="text" title="specific address" class="input_detail_address" id="lnmAdres2" name="lnmAdres2" maxlength="300" />
														</div>
													</div>
												</td>
											</tr>
										</table>	
									</div>
								</div>	
								<div class="c_btn_center">
									<button onclick="cancle(); return false;" class="btn_graybg03">Cancel</button>
									<button onclick="fnGoSubmit();return false;" class="btn_bluebg03">Confirm</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
		</form>
	</body>
</html>