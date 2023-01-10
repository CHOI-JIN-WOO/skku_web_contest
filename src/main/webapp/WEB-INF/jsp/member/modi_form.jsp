<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>	
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:9999;-webkit-overflow-scrolling:touch;">
			<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>		
		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
		<script>
			function isMobile() {
			    return /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
			}			
		    var element_layer = document.getElementById('layer');		
		    function closeDaumPostcode() {
		        element_layer.style.display = 'none';
		    }		
		    function openDaumPostcode() {		    	
		    	daum.postcode.load(function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			                var fullAddr = data.address;
			                var extraAddr = ''; 
			
			                if(data.addressType === 'R'){
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
		
		    function initLayerPosition(){		    	
		        var width = 300; 
		    	if (!isMobile()) {
		    		width = 620;
		    	}		    	
		        var height = 400; 
		        var borderWidth = 2; 
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth - 6) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		</script>		
		<script type="text/javascript">
			$(document).ready(function(){
				onlyNum2('moblphon2');
				onlyNum2('moblphon3');
			});			
			function fnGoSubmit(){		
				if(!fnValiCheck($('#userPassword'),'Please enter the password.')) return false;
				if(!fnValiCheck($('#userPassword2'),'Please verify the password.')) return false;
				if(!passwordCheck($('#userPassword'))){
					return false;
				}
				if(!passwordCompare($('#userPassword'),$('#userPassword2'))) return false;	
				if(!fnValiCheck($('#userName'),'Please enter your name.')) return false;
				if(!fnValiCheck($('#moblphon1'),'Please enter the first part of your mobile number.')) return false;
				if(!fnValiCheck($('#moblphon2'),'Please enter the second part of your mobile number.')) return false;
				if(!fnValiCheck($('#moblphon3'),'Please enter the last part of your mobile number.')) return false;		
				$("#moblphon").val($('#moblphon1').val()+"-"+$('#moblphon2').val()+"-"+$('#moblphon3').val());
	
				if(!fnValiCheck($('#lnmZip'),'Please enter your zipcode.')) return false;
				if(!fnValiCheck($('#lnmAdres1'),'Please enter your home address.')) return false;
				if(!fnValiCheck($('#lnmAdres2'),'Please enter your specific home address.')) return false;
	
				$("#sex").val($("input[name^='sex']:checked").val());	
				if(!fnValiCheck($('#sex'), 'Please check your gender.'))
					return false;
	
				$("#brthdy").val($("#brthYear").val()+$("#brthMonth").val()+$("#brthDay").val());	
				if(!fnValiCheck($('#brthYear'),'Please enter the year of your date of birth.')) 
					return false;
				if(!fnValiCheck($('#brthMonth'),'Please enter the month of your date of birth.')) 
					return false;
				if(!fnValiCheck($('#brthDay'),'Please enter the day of your date of birth.')) 
					return false;				
				if($('input[name=isMobile]').val() == 'true')	mtk.fillEncData();
				
			    frm.submit();			    
			    submitted = false;			    
				return; 			
			}
			function secsnAtY() {
				fnConfirm("Do you really want to withdraw?", function(result) {				
					if(result) {
						$("#frm").attr("action", "/user/secsnForm.do");
						$("#frm").submit();
					}
					else{
						return false;
					}
				});
			}		
		</script>
	</head>	
	<body>
		<form name="frm" id="frm" action="/user/modiExec.do" method="post">
			<fieldset>
				<input type="hidden" name="email" id="email" value=""/>
				<input type="hidden" name="isMobile" value=""/>
				<input type="hidden" id="moblphon" name="moblphon" value=""/>
				<input type="hidden" id="telno" name="telno" value=""/>	
				<input type="hidden" name="sex" id="sex" value="" />
				<input type="hidden" name="brthdy" id="brthdy" value="" />					
		
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
										<ul class="c_txtlist">
											<li>Please enter the information precisely.</li>
											<li>Your information will not be provided to the third.</li>
										</ul>
										<div class="table_style_row">
											<table>
												<colgroup>
													<col class="col2_1" />
													<col />
												</colgroup>
												<tr>
													<th scope="row"><span class="required"></span>Name</th>
													<td>
														<div class="form_field">
															<input type="text" title="Name" id="userName" name="userName" maxlength="50" class="input_pw_wid" value="<c:out value="${uMap.USERNAME}"/>"/>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>ID</th>
													<td><c:out value="${uMap.USERID }"/></td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>Password</th>
													<td>
														<div class="form_field">
															<input type="password" title="password" id="userPassword" name="userPassword" class="input_pw_wid enKey_qwer" maxlength="14" />
															<p class="nt_pw">9~14 Eng/Num/Special letter(Except for the blank, &)</p>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>Confirm Password</th>
													<td>
														<div class="form_field">
															<input type="password" title="password check" id="userPassword2" name="userPassword2" class="input_pw_wid enKey_qwer" maxlength="14" />
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>Gender</th>												
													<td>													
														<div class="form_field">
															<div class="ff_radio">
																<input type="radio" name="sex" id="jSexM" value="M" <c:if test="${uMap.SEX eq 'M'}"> checked="checked"</c:if>/><label for="jSexM">Male</label>
															</div>
															<div class="ff_radio">
																<input type="radio" name="sex" id="jSexF" value="F" <c:if test="${uMap.SEX eq 'F'}"> checked="checked"</c:if>/><label for="jSexF">Female</label>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>Date of birth</th>
													<td>
														<div class="form_field">
															<select title="year" id="brthYear" name="brthYear" class="wid_date">
				                                           		<option value="">Select</option>
				                                           		<c:forEach var="i" begin="15" end="100" step="1">
				                                           			<option value="<c:out value="${REQUEST_DATA.nowYear - i}"/>" <c:if test="${REQUEST_DATA.nowYear - i eq fn:substring(uMap.BRTHDY,0,4)}"> selected </c:if>> <c:out value="${REQUEST_DATA.nowYear - i}"/> </option>
				                                           		</c:forEach>
															</select>
															<select title="month" id="brthMonth" name="brthMonth" class="wid_date">
				                                          		<option value="">Select</option>
				                                           		<c:forEach var="i" begin="1" end="12" step="1">
				                                           			<option value="<fmt:formatNumber value="${i}" pattern="00"/>" <c:if test="${i eq fn:substring(uMap.BRTHDY,4,6)}"> selected </c:if>> <c:out value="${i}"/> </option>
				                                           		</c:forEach>
															</select>
															<select title="day" id="brthDay" name="brthDay" class="wid_date">
				                                        		<option value="">Select</option>
				                                        		<c:forEach var="i" begin="1" end="31" step="1">
				                                        			<option value="<fmt:formatNumber value="${i}" pattern="00"/>" <c:if test="${i eq fn:substring(uMap.BRTHDY,6,8)}"> selected </c:if>> <c:out value="${i}"/>  </option>
				                                        		</c:forEach>
															</select>															
														</div>	
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>Email</th>
													<td>
														<c:out value="${uMap.EMAIL1}"/>@<c:out value="${uMap.EMAIL2}"/>
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="required"></span>Mobile phone</th>
													<td>
														<div class="form_field maxwid360">
															<select title="Mobile 1st" style="width:22%;" name="moblphon1" id="moblphon1">
																<option value="010" <c:if test="${uMap.MOBLPHON1 eq '010'}"> selected="selected"</c:if>>010</option>
						                                        <option value="011" <c:if test="${uMap.MOBLPHON1 eq '011'}"> selected="selected"</c:if>>011</option>
						                                        <option value="016" <c:if test="${uMap.MOBLPHON1 eq '016'}"> selected="selected"</c:if>>016</option>
						                                        <option value="017" <c:if test="${uMap.MOBLPHON1 eq '017'}"> selected="selected"</c:if>>017</option>
						                                        <option value="018" <c:if test="${uMap.MOBLPHON1 eq '018'}"> selected="selected"</c:if>>018</option>
						                                        <option value="019" <c:if test="${uMap.MOBLPHON1 eq '019'}"> selected="selected"</c:if>>019</option>
															</select>
															<span class="widbox" style="width:8%;">-</span>
															<input type="tel" title="Mobile 2nd" value="<c:out value="${uMap.MOBLPHON2 }"/>" maxlength="4" style="width:31%;" id="moblphon2" name="moblphon2"/>
															<span class="widbox" style="width:8%;">-</span>
															<input type="tel" title="Mobile 3rd" value="<c:out value="${uMap.MOBLPHON3 }"/>" maxlength="4" style="width:31%;" id="moblphon3" name="moblphon3"/>
														</div>
													</td>
												</tr>									
												<tr>
													<th scope="row"><span class="required"></span>Address</th>
													<td>
														<div class="form_field">
															<input type="text" title="zip" class="input_postal_code" id="lnmZip" name="lnmZip" value="<c:out value="${uMap.LNM_ZIP }"/>" readonly="readonly"/>
															<button class="btn_graybg02 btn_postal_code" onclick="openDaumPostcode(); return false;">Search zipcode</button>
															<div class="address_box">
																<input type="text" title="address" class="input_address" id="lnmAdres1" name="lnmAdres1" value="<c:out value="${uMap.LNM_ADRES1 }"/>" readonly="readonly"/>
																<input type="text" title="specific address" class="input_detail_address" id="lnmAdres2" name="lnmAdres2" value="<c:out value="${uMap.LNM_ADRES2 }"/>" maxlength="300"/>
															</div>
														</div>
													</td>
												</tr>
											</table>
										</div>
										<div class="c_btn_center">
											<a href="#none" onclick="location.href='/main/main.do'"  class="btn_graybg03">Cancel</a>
											<a href="#none" onclick="fnGoSubmit();return false;" class="btn_bluebg03">Confirm</a>
											<a href="#" onclick="secsnAtY(); return false;" class="btn_bluebg03 pc_position_right">Withdraw</a>
										</div>	
									</div>
								</div>
							</div>		
						</div>	
					</div>
				</div>
				<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
			</fieldset>
		</form>
	</body>
</html>