<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">Order</h3>
				</div>			
			</div>
			<div class="con_center">
				<div class="wrapper">
					<div id="content">
						<form name="frm" id="frm" action="/user/payList.do" method="post">
							<div class="cont_body">	
								<div class="c_section">
									<div class="table_style_col">
										<table>							
											<thead>
												<tr>							
													<th scope="col">Name</th>
													<th scope="col">Payment type</th>
													<th scope="col">Amount</th>
													<th scope="col">Price</th>
													<th scope="col">Payment date</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty result}">
													<c:forEach var="list" items="${result}" varStatus="status">
														<tr>									
															<td><c:out value="${list.TITLE}" /></td>
															<td class="align_center">
																<c:if test="${list.MT_PAY_TYPE eq '1'}">Card</c:if>
																<c:if test="${list.MT_PAY_TYPE eq '2'}">Bank transfer</c:if>											
															</td>
															<td class="align_center"><c:out value="${list.AMOUNT}" /></td>
															<td class="align_center"><c:out value="${list.PRICE}" /></td>									
															<td class="align_center"><c:out value="${list.REGIST_DT}" /></td>
														</tr>
													</c:forEach>
												</c:if>										
												<c:if test="${empty result}">
													<tr>
														<td colspan="7" class="align_center">No payment list.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>
			
									<c:if test="${not empty listData}">
										<div class="paging">
											<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
										</div>
										<c:if test="${REQUEST_DATA.ispass ne 'Y'}">
											<div class="c_btn_right03">
												<button onclick="fnCancel();" class="btn_blueline03">Cancel</button>
											</div>
										</c:if>
									</c:if>		
								</div>
							</div>				
						</form>
					</div>
				</div>		
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>