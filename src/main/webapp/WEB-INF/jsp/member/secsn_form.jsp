<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript" src="/cmmn/js/jquery.cookie.js"></script> 
		<script type="text/javascript">				
			function go_exec(){			
				if($('input[name=isMobile]').val() == 'true')mtk.fillEncData();
			
				if($('#secsnCd').val() == ''){
					fnModalMsg('Please select the reason for the withdrawal.',function(){
				        $('#secsnCd').focus();
					});				
					return false;
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
						<h3 class="cont_title">Withdrawal</h3>
					</div>			
				</div>
				<div id="content">
					<div class="wrapper">
						<div class="cont_body">
							<div class="c_section">
								<ul class="c_txtlist">
									<li>
										<h5>Cannot re-register with that ID</h5>
										<ul class="in_txtul">
											<li>If you apply for membership withdrawal, the ID will be withdrawn immediately and the ID will be permanently disabled, so re-registration is not possible with that ID.</li>
										</ul>
									</li>
									<li>
										<h5>The valuable personal information you enter will not be disclosed or provided to a third party without your explicit consent.</h5>
										<ul class="in_txtul">
											<li>Membership information is deleted immediately after membership withdrawal, and in principle, information on the following membership services is also deleted.</li>
											<li>
												All information entered by the member, such as Internet consultation and financial matters, will be deleted, and the information cannot be reused again. <br />
												However, posts of a public nature below will not be deleted even after withdrawal.<br />
												(If you want to delete a post, etc., please be sure to delete it first and then apply for withdrawal.)
											</li>
										</ul>
									</li>
									<li>
										<h5>Bad use and restrictions on use</h5>
										<ul class="in_txtul">
											<li>Inappropriate use record information is kept for a certain period according to the website operation policy of the Credit Education Institute.</li>
											<li>According to the personal information handling policy, records regarding bad use and use restrictions are kept for a certain period of time.</li>
										</ul>
									</li>
								</ul>
								<div class="table_style_row">
									<form name="frm" id="frm" action="/user/secsnExec.do" method="post"  target="_self">
									<input type="hidden" name="userId" value="<c:out value="${REQUEST_DATA.userId }"/>"/>
									<input type="hidden" name="isMobile" id="isMobile"/>
									<table>
										<colgroup>
											<col class="col2_1" />
											<col />
										</colgroup>
										<tr>
											<th scope="row">ID</th>
											<td><c:out value="${REQUEST_DATA.userId }"/></td>
										</tr>
										<tr>
											<th scope="row">Reason for the withdrawal</th>
											<td>
												<div class="form_field">
													<select title="resign" class="select_out_txt" id="secsnCd" name="secsnCd">
														<option value="">Select</option>
		                                                <c:forEach var="emap2" items="${secsnCodeList}" varStatus="status2">
											        		<option value="${emap2.MT_SUB_CODE}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
												        </c:forEach>
													</select>
												</div>
											</td>
										</tr>
									</table>
									</form>
								</div>
							</div>
		
							<div class="c_btn_center">
								<button onclick="history.go(-1);" class="btn_graybg03">Cancel</button>
								<button onclick="go_exec();" class="btn_bluebg03">Confirm</button>
							</div>
						</div>
					</div>
				</div>		
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>