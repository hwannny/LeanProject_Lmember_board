<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 파일업로드 </h2>

<%
	String path = application.getRealPath( "/save" );	
	new File( path ).mkdir();

	MultipartRequest multi 
		= new MultipartRequest( request, path, 1024*1024*5, 
				"utf-8", new DefaultFileRenamePolicy() );
%>

서버 경로 : <%=path%> <br>
<%
	String originName1 = multi.getOriginalFileName( "file_one" );
	String systemName1 = multi.getFilesystemName( "file_one" );
	String originName2 = multi.getOriginalFileName( "file_two" );
	String systemName2 = multi.getFilesystemName( "file_two" );
%>
파일 1 : <%=originName1%> - <%=systemName1%> <br>
파일 2	: <%=originName2%> - <%=systemName2%> <br>

<%
	String name = multi.getParameter( "name" );
	String title = multi.getParameter( "title" );
%>
이름 : <%=name%> <br>
제목 : <%=title%> <br>		

<br>
<h2> 파일 다운로드 </h2>
<%--
파일 1 : <a href='<%="/JSP/save/"+systemName1%>'><%=originName1%></a> <br>
파일 2 : <a href='<%="/JSP/save/"+systemName2%>'><%=originName2%> </a> <br>
--%>

<%
	String eoriginName1 = URLEncoder.encode( originName1, "utf-8" );
	String esystemName1 = URLEncoder.encode( systemName1, "utf-8" );
	String eoriginName2 = URLEncoder.encode( originName2, "utf-8" );
	String esystemName2 = URLEncoder.encode( systemName2, "utf-8" );
%>
파일 1 : <a href="fileDownload.jsp?originName=<%=eoriginName1%>&systemName=<%=esystemName1%>"> <%=originName1%> </a> <br>
파일 1 : <a href="fileDownload.jsp?originName=<%=eoriginName2%>&systemName=<%=esystemName2%>"> <%=originName2%> </a> <br>
 
 





