<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<% pageContext.setAttribute("newline", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript">
			$(document).ready(function(){
				$('.modal-backdrop').click(function(){
					$('.modal-backdrop').hide();
					$('#layer_01').attr('style','display:none;');
					$('#layer_02').attr('style','display:none;');
				})
			});
			function changeQty(val){
				var num = Number($("#amount").val());
				var result = num + val;
				if(result <= 0){
					return;
				}
			
				var original_price = ${result.PRICE};
				var real_price = ${result.PRICE_REAL};
				var appendHTML = "";
				appendHTML += '<span style="text-decoration:line-through;">'+original_price*result+'Won</span>';
				appendHTML += '<span style="color:#E2450E;font-weight:700;margin-left:5px;">'+real_price*result+'Won</span>';
				
				$("#amount").val(num + val);
				$("#book_price").html(appendHTML);
			
				$("#bookcount").val(result);
				$("#price").val(result * real_price);
			}
			function fnList() {
				location.href = "/book/main.do";
			}
			function fnLogin(){
				$('#returnUrl').val("/online/onlineDetailForm.do");
				$('form[name=frm]').attr('action', '/user/login.do').submit();
			}
			
			function ftn_approval(){
				if($("#amount").val() <= 0){
					fnModalMsg("The book is currently out of stock.<br/>Please contact the customer service.");
					return;
				}
				$("#frm").submit();	
			}
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Book Store</h3>
					</div>			
				</div>
				<div id="content">
					<div class="wrapper">		
						<div class="cont_body">
							<form name="frm" id="frm" method=POST action="/payment/main.do">
								<input type="hidden" name="productCd" value="TT0002"/>					
								<input type="hidden" name="userid" value="<c:out value="${REQUEST_DATA.SES_USERID}"/>"/>
								<input type="hidden" name="userno" value="<c:out value="${REQUEST_DATA.SES_USERNO}"/>"/>
								<input type="hidden" name="usernm" value="<c:out value="${REQUEST_DATA.SES_USERNAME}"/>"/>
								<input type="hidden" name="bookno" value="<c:out value="${result.BOOKNO}"/>"/>
								<input type="hidden" name="booknm" value="<c:out value="${result.TITLE}"/>"/>
								<input type="hidden" name="price" id="price" value="<c:out value="${result.PRICE_REAL}"/>"/>
								<input type="hidden" name="bookcount" id="bookcount" value="1"/>
										
								<div class="c_section" style="overflow:hidden;">
									<h4 class="c_tit">Base Information</h4>
									<div class="table_style_row book_info_table">
										<table>
											<colgroup>
												<col width="25%"/>
												<col width="10%"/>
												<col width="20%"/>
												<col width="10%"/>
												<col width="20%"/>
											</colgroup>
											<tr>
												<td rowspan="6" class="book_info_img"><img style="max-width:100%;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>" /></td>
												<th scope="row">Name</th>
												<td colspan="3"><c:out value="${result.TITLE}"/></td>
											</tr>
											<tr>
												<th scope="row">Writer</th>
												<td><c:out value="${result.B_WRITER}"/></td>
												<th scope="row">Publisher</th>
												<td><c:out value="${result.B_COMP}"/></td>
											</tr>
											<tr>
												<th scope="row">Page</th>
												<td><c:out value="${result.B_PAGE}"/></td>
												<th scope="row">Published</th>
												<td><c:out value="${result.B_PUBD}"/></td>
											</tr>
											<tr>
												<th scope="row">ISBN</th>
												<td colspan="3"><c:out value="${result.B_ISBN}"/></td>
											</tr>
											<tr>
												<th scope="row">Amount</th>
												<td colspan="3">		
													<input type="text" id="amount" name="amount" value="1" style="border: 1px solid #EDEDED;width:100px;"/>
													<button type="button" class="button" onclick="changeQty(1);" style="width:30px;">＋</button>
													<button type="button" class="button" onclick="changeQty(-1);" style="width:30px;">-</button>
												</td>
											</tr>
											<tr>
												<th scope="row">Price</th>
												<td id="book_price" colspan="3">
													<span style="text-decoration:line-through;"><c:out value="${result.PRICE}"/>Won</span>
													<span style="color:#E2450E;font-weight:700;margin-left:5px;"><c:out value="${result.PRICE_REAL}"/>Won</span>									
												</td>
											</tr>	
										</table>
									</div>
								</div>		
													
								<div class="c_section" style="margin-top:100px;">
									<h4 class="c_tit">More Information</h4>
									<div class="table_style_row">
										<table>
											<colgroup>
												<col class="col2_1" />
												<col />
											</colgroup>
											<tr>
												<th scope="row" style="text-align:center;">Details</th>
												<td id="book_cont">
													<c:out value="${result.CONTENT}" escapeXml="false"/>
												</td>
											</tr>
										</table>
									</div>
								</div>			
								<div class="c_btn_center">
								    <c:if test = "${REQUEST_DATA.SES_USERID ne '' }">
										<button type="button" class="btn_bluebg03" onclick="ftn_approval();return false;" >Purchase</button>
								    </c:if>			
									<c:if test = "${REQUEST_DATA.SES_USERID eq '' }">
										<button type="button" class="btn_bluebg03" data-tooltip="alertpop01">Purchase</button>
									</c:if>						
									<button type="button" class="btn_blueline03" onclick="fnList(); return false;" title="Back">Back</button>
								</div>
								
								<div class="layerpop alertpop01" tabindex="0" data-tooltip-con="alertpop01" data-focus="alertpop01" data-focus-prev="alertpop01-close">
									<div class="layer_mask tooltip-close"></div>
									<div class="layer_cont">
										<div class="lc_head"></div>
										<div class="lc_cont">		
											<p class="alert_txt">You need to login for the purchase.<br/>Proceed?</p>		
											<div class="p_btn_center">
												<a href="#none" class="btn_graybg02 tooltip-close">Cancel</a>
												<a href="#none" onclick="fnLogin();return false;" class="btn_bluebg02">Confirm</a>
											</div>		
										</div>
									</div>
									<button class="btn_close tooltip-close" data-focus="alertpop01-close" data-focus-next="alertpop01">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>			
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>