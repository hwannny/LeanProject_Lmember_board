<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Model2 - 출력 페이지 - default </h2>
<%
	request.setCharacterEncoding( "utf-8" );
%>
결과 : <%=request.getAttribute( "result" )%> <br>