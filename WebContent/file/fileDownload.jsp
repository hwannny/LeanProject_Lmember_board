<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



  	<h2>파일 다운로드</h2>
  
	 <%
	 String originName = URLDecoder.decode( request.getParameter("originName" ), "utf-8");
	 String systemName = URLDecoder.decode( request.getParameter("systemName" ), "utf-8");
	 %>

	<%
	out.clear();//버퍼비우기
	String path = application.getRealPath("/save");
	String filename = path +"/" + systemName;
	response.setContentType( "text/unknown" ); //콘텐트 타입을 지금부터 바꾼다 아무거나 줘도되지만 보통 언노운 사용
	response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode( originName,"utf-8" ) + ";" );
	
	BufferedInputStream bis = new BufferedInputStream( new FileInputStream( filename ));
	BufferedOutputStream bos = new BufferedOutputStream( response.getOutputStream());
	byte[] buffer = new byte[1024]; //1KB씩
	int length = 0;
	while( ( length = bis.read(buffer, 0, buffer.length) ) != -1 ){
		bos.write( buffer, 0, length);
	}
	bos.flush(); //아웃한테 쓴다
	bos.close();
	bis.close();
	%>
	
	
	
	
	
	
	
	
	
	