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
				$("#frm").attr("action", "/bbs/qna/view.do").submit();
			}		
			function fnMoveForm(type) {
				$("#type").val(type);
				$("#frm").attr("action", "/bbs/qna/form.do");
				$("#frm").submit();
			}	
			function move_page(cPage){
				$('#cPage').val(cPage);
				$('form[name=frm]').attr('action', '/bbs/qna/main.do').submit();			
			} 
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">	
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Q&A</h3>
					</div>			
				</div>
				<div id="content">			
					<div class="wrapper">	
						<div class="cont_body">
							<div class="c_section">
								<form name="frm" id="frm" action="" method="post">
									<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
									<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
									<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
									<input type="hidden" name="type" id="type" value=""/>
								</form>
								<br/><br/>
								<div class="board_list">
									<table>
										<colgroup>
											<col width="15%"/>
											<col width=""/>
											<col width="20%" class="btn_col" />
										</colgroup>
										<tbody>
											<c:if test="${not empty listData}">
												<c:forEach items="${listData}" var="result" varStatus="status">
													<tr>
														<td><strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong></td>
														<td class="align_left">
															<div class="tit">
																<a href="#" onclick="fnView('<c:out value="${REQUEST_DATA.bcateno}"/>','<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/></a>
															</div>
															<span class="t_c t_wr">Writer<span class="dd"><c:out value="${result.WRITER}" /></span></span>
															<span class="t_c">Posted<span class="dd"><c:out value="${result.WDATE}" /></span></span>
														</td>
														<td class="btn_col">
															<c:if test="${result.ANYN eq 'Y'}"><span class="btn_blueline">Replied</span></c:if>
															<c:if test="${result.ANYN eq 'N'}"></c:if>
														</td>
													</tr>
												</c:forEach>
											</c:if>
											
											<c:if test="${empty listData}">
												<tr>
													<td colspan="3">There is no post.</td>
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
								<br><br>
								<div class="c_btn_right03">
									<button onclick="fnMoveForm('insert'); return false;" class="btn_bluebg03">Write</button>
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