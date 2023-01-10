<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript">	
			function prevClick(bbsNo){
				if(bbsNo.length != 0){
					$("#bbsNo").val(bbsNo);
				    $('#frm').attr('action', '/bbs/notice/view.do').submit();
				}
				else{
					fnModalMsg("First page.");
					return;
				}
			}
			function nextClick(bbsNo){
				if(bbsNo.length != 0){
					$("#bbsNo").val(bbsNo);
				    $('#frm').attr('action', '/bbs/notice/view.do').submit();
				}
				else{
					fnModalMsg("Last page");
					return;
				}
			}
			function mainList(){
			    $('#frm').attr('action', '/bbs/notice/main.do').submit();
			}
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">Notice</h3>
					</div>
				</div>
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="bcateno" id="bcateno" value="<c:out value='${REQUEST_DATA.bcateno}'/>"/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="mtCateCode" id="mtCateCode"  value="<c:out value='${REQUEST_DATA.mtCateCode}'/>">
					<input type="hidden" name="fileId" id="fileId" value=""/>
					<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
					<input type="hidden" name="SES_USERNO" id="SES_USERNO" value="${REQUEST_DATA.SES_USERNO}"/>				
				</form>
				<div id="content">
					<div class="wrapper">
						<div class="cont_body">
							<div class="c_section">							
								<div class="board_view">	
									<div class="b_info">
										<div class="line">
											<dl style="width:100%;">
												<dt>Title</dt>
												<dd><c:out value="${rowData.TITLE}"/></dd>
											</dl>
										</div>
										<div class="line">
											<dl>
												<dt>Posted</dt>
												<dd><c:out value="${rowData.WDATE}"/></dd>
											</dl>
											<dl>
												<dt>Views</dt>
												<dd><c:out value="${rowData.RCNT}"/></dd>
											</dl>
										</div>
									</div>
		
									<div class="b_content" style="word-wrap:break-word;">
										<p>
											<c:out value="${rowData.CONTENT}" escapeXml="false"/>
										</p>
									</div>	
									<div class="c_btn_right02">
										<a href="#" onclick="mainList();return false" class="btn_blueline03">Back</a>
									</div>								
									<ul class="prev_next">
										<li>
											<span class="view_prev">Prev</span>
											<div class="view_title_box">
												<c:if test="${prevData.TITLE eq null || prevData.TITLE eq ''}">
													<p class="view_title">No previous post.</p>
												</c:if>
												<c:if test="${prevData.TITLE ne null || prevData.TITLE ne ''}">
													<a href="#" onclick="prevClick('<c:out value="${prevData.BBSNO}"/>', '<c:out value="${REQUEST_DATA.bcateno}"/>');return false" class="view_title">
														<c:out value="${prevData.TITLE}"/>
													</a>
												</c:if>
											</div>
										</li>
										<li>
											<span class="view_next">Next</span>
											<div class="view_title_box">
												<c:if test="${nextData.TITLE eq null || nextData.TITLE eq ''}">
													<p class="view_title">No next post.</p>
												</c:if>
												<c:if test="${nextData.TITLE ne null || nextData.TITLE ne ''}">
													<a href="#" onclick="nextClick('<c:out value="${nextData.BBSNO}"/>', '<c:out value="${REQUEST_DATA.bcateno}"/>');return false" class="view_title">
														<c:out value="${nextData.TITLE}"/>
													</a>
												</c:if>
											</div>
										</li>
									</ul>
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