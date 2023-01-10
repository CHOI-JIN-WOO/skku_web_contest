<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<% pageContext.setAttribute("newline", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 9999; -webkit-overflow-scrolling: touch;">
			<button type="button" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 20px; height: 20px; background-image: url( '//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png' );"
				onclick="closeDaumPostcode()" alt="close"></button>
		</div>
		<style>
			.table_style_row table th,
			.table_style_row table td{
				padding:10px;
				text-align:center;
			}
			.table_style_row table tr:last-child h2{
				font-size:18px;
				padding:15px;
			}
			.table_style_row table tr:last-child h2 span{
				color:#FE642E;
			}
			.table_style_row table label{
				margin-left:50px;
				cursor:pointer;
			}
			.table_style_row table input{
				margin-right:5px;
				border: 1px solid #000;
			}
			.table_style_row.book_tb table td{
				text-align:left;
			}
			.table_style_row.book_tb table td{
				text-align:left;
			}
			.same_check{
				float:right;
				font-size:14px;
				overflow:hidden;
			}
			.same_check input{
				float:right;
				margin-top: 4px;
				margin-right: 4px;
			}
			.same_check span{
				float:right;
			}
		</style>
		<script	src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
		<script type="text/javascript">		
			function isMobile() {
				return /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i
						.test(navigator.userAgent);
			}
			var element_layer = document.getElementById('layer');
			function closeDaumPostcode() {
				element_layer.style.display = 'none';
			}
			function openDaumPostcode() {			
				daum.postcode.load(function() {
					new daum.Postcode({
						oncomplete : function(data) {
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
							document.getElementById('pZip').value = data.zonecode;
							document.getElementById('pAddr1').value = fullAddr;
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
			$(document).ready(function(){
				$('.modal-backdrop').click(function(){
					$('.modal-backdrop').hide();
					$('#layer_01').attr('style','display:none;');
					$('#layer_02').attr('style','display:none;');
				})
				$('#pZip, #pAddr1').click(function(){
					openDaumPostcode();
				});
				onlyNum2('mobile2');
				onlyNum2('mobile3');
			});
			
			 function formFill(_this){
				 var isCheck = $(_this).is(":checked");
				 if(isCheck){
					 $("#pReceiptNm").val('${userInfo.MBERNM}');
					 $("#mobile1").val('${userInfo.MOBLPHON1}').prop("selected", true);
					 $("#mobile2").val('${userInfo.MOBLPHON2}');
					 $("#mobile3").val('${userInfo.MOBLPHON3}');
					 $("#pZip").val('${userInfo.LNM_ZIP}');
					 $("#pAddr1").val('${userInfo.LNM_ADRES1}');
					 $("#pAddr2").val('${userInfo.LNM_ADRES2}');
				 }
				 else{
					 $("#pReceiptNm").val("");
					 $("#mobile1 option:eq(0)").prop("selected", true);
					 $("#mobile2").val("");
					 $("#mobile3").val("");
					 $("#pZip").val("");
					 $("#pAddr1").val("");
					 $("#pAddr2").val("");
				 }
			 }
			 
			var isOnProgress = false;
			function ftn_approval(dfm){
				var st = $("input:radio[name=ptype]:checked").val();
				if($("#pReceiptNm").val() == ""){
					fnModalMsg("Please enter recipient.");			
					return;
				}
				else if($("#mobile2").val() == "" || $("#mobile3").val() == ""){
					fnModalMsg("Please enter phone number.");			
					return;
				}
				else if($("#pZip").val() == "" || $("#pAddr1").val() == ""){
					fnModalMsg("Please enter zip code.");			
					return;
				}
				else if($("#pAddr2").val() == ""){
					fnModalMsg("Please enter address.");			
					return;
				}
				else if(st == null){
					fnModalMsg("Please select payment method.");	
					return;
				}
				fnConfirm("Do you really want to purchase?",function(result){
					if(result){
						if(isOnProgress){
							fnModalMsg("Last order is on progress.");					
						}
						else{
							$.ajax({
								type : "post",
					    		url : '/payment/ajaxFindLastOrderIdx.do',
					    		success : function(data) {
					    			var today = new Date();
					    			var year = today.getFullYear().toString();
					    			var month = (today.getMonth()+1).toString();
					    			var date = today.getDate().toString();
					    			var orderIdx = data;					    			
					    			while(orderIdx.toString().length <= 6){
					    				orderIdx = "0" + orderIdx;
					    			}					    			
					    			var orderNo = year+itostr(month)+itostr(date)+orderIdx;
					    			
					    			$("#allat_order_no").val(orderNo);
					    			$("#allat_recp_nm").val($("#pReceiptNm").val());
					    			$("#allat_recp_addr").val($("#pAddr1").val()+$("#pAddr2").val());
					    			$("#allat_pay_type").val(st);
					    			$("#pMobile").val($("#mobile1").val()+"-"+$("#mobile2").val()+"-"+$("#mobile3").val());
									$("#fm").submit();
									isOnProgress = false;
					    		}
					    	}); 	
						}
					}
				});
			}	
			function itostr(_num){
				return _num < 10 ? "0" + _num : _num;
			}
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Payment</h3>
					</div>			
				</div>
				<div id="content">	
					<div class="cont_body">
	   					<form name="fm" id="fm" method="POST" action="/payment/approve.do">
							<input type="hidden" name="allat_order_no" id="allat_order_no" value="">
							<input type="hidden" name="allat_pmember_id" value="<c:out value="${fn:substring(REQUEST_DATA.SES_USERID,0,20)}"/>"/>
							<input type="hidden" name="allat_buyer_nm" value="<c:out value="${REQUEST_DATA.SES_USERNAME}"/>"/>
							<input type="hidden" name="allat_buyer_no" id="allat_buyer_no" value="<c:out value="${REQUEST_DATA.SES_USERNO}"/>"/>
							<input type="hidden" name="allat_product_cd" value="<c:out value="${REQUEST_DATA.productCd}"/>"/>
							<input type="hidden" name="allat_amt" value="<c:out value="${REQUEST_DATA.productPr}"/>"/>
							<input type="hidden" name="allat_product_nm" value="<c:out value="${REQUEST_DATA.productNm}"/>"/>
							<input type="hidden" name="allat_pay_type" id="allat_pay_type" value="">				
							<input type="hidden" name="allat_pay_stat" id="allat_pay_stat" value="">								
							<input type="hidden" id="pCd" name="pCd" value="<c:out value="${REQUEST_DATA.productCd}"/>"/>
							<input type="hidden" id="pNo" name="pNo" value="<c:out value="${REQUEST_DATA.productNo}"/>"/>
							<input type="hidden" id="pCnt" name="pCnt" value="<c:out value="${REQUEST_DATA.productCount}"/>"/>
							<input type="hidden" id="pMobile" name="pMobile" value=""/>		
							<input type="hidden" name="price" value="<%=request.getParameter("price")%>"/>
														
							<div class="wrapper">						
								<div class="c_section">
									<h4 class="c_tit">Product Info</h4>
									<div class="table_style_row">
										<table>
											<colgroup>
												<col width="50%" class="col3_2"/>
												<col width="15%" />
												<col width="35%" />
											</colgroup>
											<tr>
												<th scope="row">Name</th>
												<th scope="row">Amount</th>
												<th scope="row">Price</th>
											</tr>
											<tr>			
												<td><c:out value="${REQUEST_DATA.productNm}"/></td>									
												<td><c:out value="${REQUEST_DATA.productCount}"/></td>
												<td><c:out value="${REQUEST_DATA.productPr}"/></td>
											</tr>				
										</table>
									</div>
								</div>
								
								<div class="c_section" style="margin-top:50px;">
									<h4 class="c_tit">
										Payment Info
										<div class="same_check">
											<span>Same as the login information.</span>
											<input type="checkbox" id="fillCheck" onclick="formFill(this);"/>
										</div>
									</h4>								
									<div class="table_style_row book_tb">
										<table>
											<colgroup>
												<col width="25%" />
												<col width="" />
											</colgroup>
											<tr>
												<th scope="row">Recipient</th>
												<td>
													<input type="text" id="pReceiptNm" name="pReceiptNm" style="width:100px;"/>
												</td>
											</tr>
											<tr>
												<th scope="row">Mobile</th>
												<td>
													<select id="mobile1" name="mobile1" style="width:100px;">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>										
													</select>
													 - 
													<input type="text" id="mobile2" name="mobile2" style="width:100px;"/>
													 - 
													<input type="text" id="mobile3" name="mobile3" style="width:100px;"/>
												</td>
											</tr>
											<tr>
												<th scope="row">Zipcode</th>
												<td style="text-align:left;">
													<input type="text" id="pZip" name="pZip" style="width:100px;"/>
													<button class="btn_graybg02 btn_postal_code" onclick="openDaumPostcode(); return false;">Find zipcode</button>
												</td>
											</tr>
											<tr>
												<th scope="row">Address</th>
												<td>
													<input type="text" id="pAddr1" name="pAddr1" style="width:75%;"/>
												</td>
											</tr>
											<tr>
												<th scope="row">Specific Address</th>
												<td>
													<input type="text" id="pAddr2" name="pAddr2" style="width:75%;"/>
												</td>
											</tr>
											<tr>
												<th scope="row">Requirements</th>
												<td>
													<textarea id="pReq" name="pReq" style="max-width:100%;min-width:100%;"></textarea>
												</td>
											</tr>	
										</table>
									</div>
								</div>
								<div class="c_section" style="margin-top:50px;">
									<h4 class="c_tit">Payment Method</h4>
									<div class="table_style_row">
										<table>
											<tr>
												<th scope="row">
													<label><input type="radio" name="ptype" value="1">Card</label>
													<label><input type="radio" name="ptype" value="2">Bank Transfer</label>
												</th>
											</tr>
										</table>
									</div>
								</div>
								<div class="c_btn_center">
									<button type="button" class="btn_bluebg03" onclick="ftn_approval(document.fm);return false;" >Order</button>
									<button type="button" class="btn_blueline03" onclick="history.back(); return false;" title="back">Back</button>				
								</div>	
							</div>
						</div>	
					</div>			
	   			</form>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>