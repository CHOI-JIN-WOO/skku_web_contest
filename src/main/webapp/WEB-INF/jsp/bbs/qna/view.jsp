<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript">
			function fnList(){
				$("#frm").attr("action", "/bbs/qna/main.do").submit();
			}
			function fnMoveForm(type){
				$('#type').val(type);
				$('form[name="frm"]').attr('action', '/bbs/qna/form.do').submit();
			}
			function fnDel(){
				fnConfirm("Delete?", function(result){
					if(result) {
						bcateno = $("#bcateno").val();
						$("#frm").attr("action", "/bbs/qna/del.do");
						$("#frm").submit();					
					} 
					else{
						return false;
					}				
				});
			}
			function boardReplyExec() {
				if($('#cont').val() == ""){
					fnModalMsg("Please fill in the reply.",function(){
						$('#cont').focus();
					});
					return false;
				}				
				fnConfirm("Do you really want to submit?",function(result){
					if(result){			
						var data = $("#cont").val();					
						var content = data.replace(/\n/gi,"<br/>").replace(/\r\n/gi,"<br/>").replace(/\r/gi,"<br/>");
				
						$.ajax({
							type : "POST",
							dataType : "json",
							url : "/bbs/qna/replyIns.do",
							data : { 
					        	bbsNo : $("#bbsNo").val(),
					        	content : content
					        },					        
						    success : function(data){
					    		if(data == "SUCCESS"){
					    			fnModalMsg("Reply submission succeed.",function(){
					    				$("#frm").attr("action", "/bbs/qna/view.do").submit();
					    			});				    			
					    		} 
					    		else{
					    			fnModalMsg("Reply submission failed.");					    		 
					    		}
							}
					 	});
					}
				});			
			}
			function deleteReply(cmtNo, userId, pthis) {			
				fnConfirm("Do you really want to delete the reply?",function(result){
					if(result){
						$.ajax({
							type : "POST",
							dataType : "json",
							url : "/bbs/qna/replyDel.do",
							data : { 
								cmtNo : cmtNo, 
								userid : userId,
								bbsNo : $("#bbsNo").val()
						    },
						    success : function(data){
					    		if(data == "SUCCESS") {
					    			fnModalMsg("Reply has been deleted.",function(){
					    				$("#frm").attr("action", "/bbs/qna/view.do").submit();
					    			});
					    		} 
							}
					 	});
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
						<h3 class="cont_title">Q&A</h3>
					</div>			
				</div>			
				<div id="content">
					<div class="wrapper">	
						<div class="cont_body">
							<form name="frm" id="frm" action="" method="post">
								<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
								<input type="hidden" name="bbsNo" id="bbsNo" value="${rowData.BBSNO}"/>
								<input type="hidden" name="type" id="type" value=""/>							
								<div class="c_section">								
									<div class="board_view">
										<div class="b_info">
											<div class="line">
												<dl>
													<dt>Title</dt>
													<dd><c:out value="${rowData.TITLE}"/></dd>
												</dl>
											</div>
											<div class="line">
												<dl>
													<dt>Writer</dt>
													<dd><c:out value="${rowData.WRITER}"/></dd>
												</dl>
												<dl>
													<dt>Posted</dt>
													<dd><c:out value="${rowData.WDATE}"/></dd>
												</dl>
											</div>
										</div>	
										<div class="b_content" style="word-wrap:break-word;">
											<p>
												<c:out value="${rowData.CONTENT}" escapeXml="false"/>
											</p>
										</div>
																			
										<c:if test="${rowData.ANYN eq 'Y'}">										
											<div class="answer_section" style="margin-top:100px;">											
												<div class="b_info">
													<div class="line">
														<dl style="width:100%;">
															<dt>Writer</dt>
															<dd>Admin</dd>
														</dl>
													</div>
													<div class="line">
														<dl style="width:100%;">
															<dt>Replied</dt>
															<dd>${cmtRowData.CMTWDATE}</dd>
														</dl>
													</div>
												</div>
												<div class="b_content" style="word-break:break-all;">
													<p>
														<c:out value='${cmtRowData.REPLY}' escapeXml="false"/>
													</p>
												</div>
											</div>
										</c:if>
										<c:if test="${rowData.ANYN ne 'Y'}">
											<c:if test="${REQUEST_DATA.SES_USERNO == 1}">
												<div class="b_comment" style="margin-top:100px;">
													<div class="bc_head">
														<textarea cols="50" rows="10" name="contentText" id="cont" placeholder="Please fill in reply"></textarea>
														<button type="button" onclick="boardReplyExec()" class="btn_cmt_submit">Register</button>
													</div>
												</div>	
											</c:if>									
										</c:if>										
										<div class="c_btn_center">
											<c:if test="${REQUEST_DATA.userInfoDiv eq 'Y'}">
												<button type="button" onclick="fnDel();return false;" class="btn_graybg03">Delete</button>
												<button type="button" onclick="fnMoveForm('update');return false;" class="btn_bluebg03">Edit</button>
											</c:if>
											<c:if test="${REQUEST_DATA.userInfoDiv ne 'Y'}">
												<c:if test="${REQUEST_DATA.SES_USERNO == 1}">
													<button type="button" onclick="fnDel();return false;" class="btn_graybg03">Delete</button>
													<c:if test="${rowData.ANYN eq 'Y'}">
														<button type="button" onclick="deleteReply('<c:out value="${replyResult.CMTNO}"/>','<c:out value="${replyResult.USERID2}"/>',this);return false" class="btn_bluebg03">Delete Reply</button>
													</c:if>
												</c:if>
											</c:if>
											<button type="button" onclick="fnList();return false" class="btn_blueline03">Back</a>
										</div>
									</div>
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