<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<h2>500 에러페이지</h2>

<%
	response.setStatus(HttpServletResponse.SC_OK);
%>

현재페이지는 500 에러페이지 입니다<br>
서버 내부 오류입니다<br>
코드를 다시확인하세요<br>