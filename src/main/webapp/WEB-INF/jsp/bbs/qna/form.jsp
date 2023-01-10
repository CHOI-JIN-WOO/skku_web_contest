<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		<script type="text/javascript">
			function fnList(){
				$('#frm').attr('target', '_self').attr('action', '/bbs/qna/main.do').submit();
			}
			function fnSave(){
				if($('#qu').val() == "update"){
					msg = "edit";
				}
				else{
					msg = "register";
				}
				
				if($('#title').val() == ""){
					fnModalMsg("Please insert the title.",function(){
						$('#title').focus();
					})
					return false;
				}
				if($('#content2').val() == ""){
					fnModalMsg("Please insert the content.",function(){
						$('#content2').focus();
					})
					return false;
				}
				
				fnConfirm("Do you really want to "+msg+"?", function(result){
					if(result){					
						var data = $("#content2").val();
						var content = data.replace(/\n/gi,"<br/>").replace(/\r\n/gi,"<br/>").replace(/\r/gi,"<br/>");
						
						$("#content2").val(content);					
						$('#frm').attr('target', '_self').attr('action', '/bbs/qna/exec.do').submit();
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
							<div class="c_section">
								<form name="frm" id="frm" action="" method="post" enctype="multipart/form-data">
									<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
									<input type="hidden" name="bbsNo" id="bbsNo" value="<c:out value="${rowData.BBSNO}"/>"/>
									<input type="hidden" name="type" id="type" value="<c:out value="${REQUEST_DATA.type}"/>"/>
									<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>								
									<div class="board_write">
										<table>
											<colgroup>
												<col width="20%" />
												<col width="" />
											</colgroup>
											<tr>
												<th scope="row">Title</th>
												<td>
													<input type="text" class="text" id="title" name="title" placeholder="Please fill in the title" title="Please fill in the title" value="<c:out value="${rowData.TITLE}"/>" />
												</td>
											</tr>
											<tr>
												<th scope="row">Content</th>
												<td>														
													<textarea placeholder="Please fill in the content" title="Please fill in the content" name="content" id="content2"><c:out value="${rowData.CONTENT}"/></textarea>											
												</td>
											</tr>
										</table>
									</div>
									<div class="c_btn_center">
										<button type="button" onclick="fnList(); return false;" class="btn_blueline03">Cancel</button>
										<button type="button" onclick="fnSave(); return false;" class="btn_bluebg03">Submit</button>
									</div>
								</form>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</body>
</html>