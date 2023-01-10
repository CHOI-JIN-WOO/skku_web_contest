<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>	
		<script type="text/javascript">
			function fnView(bcateno, bbsNo){
				$("#bbsNo").val(bbsNo);
				$("#bcateno").val(bcateno);	
				$("#frm").attr("action" , "/bbs/faq/view.do").submit();
			}
			function move_page(cPage){
				$('#cPage').val(cPage);
				$('form[name=frm]').attr('action', '/bbs/faq/main.do').submit();		
			} 		
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">FAQ</h3>
					</div>
				</div>
				<div id="content">
					<div class="wrapper">
						<div class="cont_body">
							<form name="frm" id="frm" action="" method="post">
								<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
								<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
								<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
								<div class="c_section">	
									<div class="board_list">
										<table>
											<colgroup>
												<col width="15%"/>
												<col width=""/>
											</colgroup>
											<tbody>
												<c:forEach items="${listData}" var="result" varStatus="status">
													<tr>
														<c:if test="${result.TOPYN eq 'Y'}">
															<td><strong class="fnt16 po_C2">[Notice]</strong></td>
														</c:if>
														<c:if test="${result.TOPYN ne 'Y'}">
															<td><strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong></td>
														</c:if>
														<td class="align_left">
															<div class="tit"><a href="#" onclick="fnView('<c:out value="${REQUEST_DATA.bcateno}"/>', '<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value='${result.TITLE}'/>">${result.TITLE}</a></div>
															<span class="t_c">Views<span class="dd"><c:out value="${result.RCNT}"/></span></span>
															<span class="t_c">Posted<span class="dd"><c:out value='${result.WDATE}'/></span></span>
														</td>
													</tr>
												</c:forEach>
												<c:if test="${empty listData}">
													<tr>
														<td colspan="2">There is no post.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div>								
									<c:if test="${not empty listData}">
										<div class="paging">
											<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page" />
										</div>
									</c:if>
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