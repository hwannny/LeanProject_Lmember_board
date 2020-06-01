<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="<%=project%>script.js"></script>

<h2> <%=page_modify%> </h2>
<jsp:useBean id="memberDto" class="member.LogonDataBean"/>
	<jsp:setProperty name="memberDto" property="*"/>
	<!-- passwd -->
<%
	// 이메일
	String email1 = request.getParameter( "email1" );
	String email2 = request.getParameter( "email2" );
	String email = null;
	if( ! email1.equals( "" ) && ! email2.equals( "" ) ) {
		email = email1 + "@" + email2;
	}
	memberDto.setEmail( email );
%>	
<%
	// 전화번호
	String tel1 = request.getParameter( "tel1" );
	String tel2 = request.getParameter( "tel2" );
	String tel3 = request.getParameter( "tel2" );
	String tel = null;
	if( ! tel1.equals( "" ) && ! tel2.equals( "" ) && ! tel3.equals( "" ) ) {
		tel = tel1 + "-" + tel2 + "-" + tel3;
	}
	memberDto.setTel( tel );
%>
<%
	// 아이디 
	memberDto.setId( (String) session.getAttribute( "memId" ) );
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.updateMember( memberDto );	
	if( result == 0 ) {
		// 수정 실패
		%>
		<script type="text/javascript">
			<!--
			alert( updateerror );
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url='main.jsp'">
		<%
	} else {
		// 수정 성공
		response.sendRedirect( "main.jsp" );
	}
%>
















