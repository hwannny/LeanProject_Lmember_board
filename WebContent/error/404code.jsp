<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<h2>404 에러페이지</h2>

<%
	response.setStatus(HttpServletResponse.SC_OK);
%>

현재페이지는 404 에러페이지 입니다<br>
경로에 문제가 있습니다<br>
파일이름이나 폴더를 확인하요<br>