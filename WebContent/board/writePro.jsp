<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
	<%
	request.setCharacterEncoding("utf-8");
    %>

    <jsp:useBean id ="boardDto" class="board.BoardDataBean"/>
    	<jsp:setProperty property="*" name="boardDto"/>
    	<!-- writer email subject content ip 5개 -->
    	<!-- num ref re_step re_level  4개 -->
    	
    	
    	<%
    	//reg_date 작성일
    	boardDto.setReg_date( new Timestamp(System.currentTimeMillis() ));
    	%>
    	
		<%
		//조회수
		%>
		
		<%
		//ip
		boardDto.setIp( request.getRemoteAddr());
		%>
		
		<%
		BoardDBBean boardDao = BoardDBBean.getInstance();
		int result = boardDao.insertArticle( boardDto );
		
		if( result==0){
			//작성실패
			%>
			<script type="text/javascript">
				//<!--
				alert( inserterror );
				//-->
			</script>
			<meta http-equiv="refresh" content="0; url='list.jsp'">
			<%
		}else{
			//작성성공
			response.sendRedirect( "list.jsp" );
		}
		%>
		
		
		
		
		
		
		
		
		
		