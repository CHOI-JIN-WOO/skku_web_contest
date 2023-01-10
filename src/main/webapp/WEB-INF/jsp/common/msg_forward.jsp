<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
		 <script type="text/javascript">
		     $(document).ready(function(){
			    if('<c:out value="${type}"/>' == 'POP') {
			        if('<c:out value="${msg}"/>' != '') {
			            fnModalMsg( ( ('<c:out value="${msg}"/>').replace('<br/>', '\n') ).replace('&lt;br&gt;', '\n') , fnTypePop);
			        }
			        else{
			        	fnTypePop();
			        }
			    } 
			    else if('<c:out value="${type}"/>' == 'POP_JS') {
			        if('<c:out value="${msg}"/>' != '') {
			            fnModalMsg( ( ('<c:out value="${msg}"/>').replace('<br/>', '\n') ).replace('&lt;br&gt;', '\n') , fnTypePopJs);
			        }
			        else{
			        	fnTypePopJs();
			        }
			    }
			    else if('<c:out value="${type}" escapeXml='false' />' == 'PARENT') {
			    	if('<c:out value="${msg}"/>' != '') {
			            fnModalMsg( ( ('<c:out value="${msg}"/>').replace('<br/>', '\n') ).replace('&lt;br&gt;', '\n') , fnTypeParent);
			        }
			    	else{
			        	fnTypeParent();
			        }
			    } 
			    else if('<c:out value="${type}" escapeXml='false' />' == 'BACK') {
			    	if('<c:out value="${msg}"/>' != '') {
			            fnModalMsg( ( ('<c:out value="${msg}"/>').replace('<br/>', '\n') ).replace('&lt;br&gt;', '\n') , fnTypeBack);
			        }
			    	else{
			        	fnTypeBack();
			        }
			    } 
			    else {
			    	if('<c:out value="${msg}"/>' != '') {
			            fnModalMsg( ( ('<c:out value="${msg}"/>').replace('&lt;', '<').replace('&gt;', '>') ).replace('&lt;', '<').replace('&gt;', '>'), fnTypeElse);		            
			        }
			    	else{
			        	fnTypeElse();
			        }
			    } 
		    });	    
		    function fnTypePop(){
		    	if('<c:out value="${url}" escapeXml='false' />' != '') {
		            opener.location.href = '<c:out value="${url}" escapeXml='false' />';
		        }
		        self.close();
		    }	    
		    function fnTypePopJs(){
		    	 if('<c:out value="${js}" escapeXml='false' />' != '') {
		             eval('<c:out value="${js}"/>');
		         }           
		         self.close();
		    }	    
		    function fnTypeParent(){
		    	parent.location.href = '<c:out value="${url}" escapeXml='false' />';
		    }	    
		    function fnTypeBack(){
		    	history.go(-1);
		    }   
		    function fnTypeElse(){
		    	if('<c:out value="${url}" escapeXml='false' />' != '') {
		            $('#frm').attr('action' , '<c:out value='${url}' escapeXml='false' />');
		            $('#frm').submit();
		        }
		    }	
		</script>
	</head>
	<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
		<div id="container">
			<div class="con_center">
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title"></h3>
					</div>			
				</div>
				<div id="content">
					<div class="wrapper">
						<h3 class="cont_titile" style="display: none;">Info</h3>				
						<form name="frm" id="frm" method="post" action="<c:out value='${url}' escapeXml='false' />">
						     <c:out value='${paramInputs}' escapeXml='false' />
						 </form>	
					 </div>	
				</div>	
			</div>	
		</div>
		<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	</div>
	</body>
</html>