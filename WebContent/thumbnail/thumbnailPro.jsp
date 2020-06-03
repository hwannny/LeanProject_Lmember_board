<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 섬네일 이미지 </h2>
	<%
	String path = application.getRealPath( "/save" );
	new File( path ).mkdir();
		
	MultipartRequest multi = new MultipartRequest( request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy() );
	String name = multi.getParameter( "name" );
	String title = multi.getParameter( "title" );
		
	%>
	실제 경로: <%=path %><br>
	이름 : <%=name%> <br>
	제목 : <%=title%> <br>
	
	<!-- 넘어온 이미지 파일 확인 -->
	<%
	String originName1 = multi.getOriginalFileName( "img_one" );
	String systemName1 = multi.getFilesystemName( "img_one" );
	
	String originName2 = multi.getOriginalFileName( "img_two" );
	String systemName2 = multi.getFilesystemName( "img_two" );
	%>
	
	<br><br>
	오리지널 이름: <%=originName1%> <br>
	<img src="/JSP/save/<%=systemName1%>" border="0">
	
	<br><br>
	오리지널 이름:<%=originName2%> <br>
	<img src="/JSP/save/<%=systemName2%>" border="0">
	
	<br><br>
	
	
	<!-- 썸네일 이미지처리 -->
	<%
	//업로드 파일들의 이름을 가져옴
	Enumeration<String> e =  multi.getFileNames(); //경고는 무시
	
	//img_one, img_two를 가져옴
	while( e.hasMoreElements() ){ 
		String eName = e.nextElement();
		
		String oName = multi.getOriginalFileName(eName);
		String sName = multi.getFilesystemName(eName);
		
		//서버에 저장된 이미지 파일 경로
		String ofName = path + "/" + oName;
		String sfName = path + "/" + sName;	
		
		//시스템 이름으로 파일을 로드해라
		RenderedOp op = JAI.create("fileload", sfName);
		
		//버퍼만들기_원본
		BufferedImage sfBuffer =  op.getAsBufferedImage();
		
		//썸네일 사이즈 설정, 1/16으로 줄인다
		int size = 4;
		int width = sfBuffer.getWidth() / size;
		int height = sfBuffer.getHeight() / size;
		
		//저장될 파일이름생성
		String tName = path + "/t" +sName;
		
		//버퍼만들기_썸네일
		BufferedImage tBuffer = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		//그래픽 생성
		Graphics g = tBuffer.getGraphics();
		g.drawImage(sfBuffer, 0, 0, width, height, null);
		
		//이미지를 그린다, 자기에 해당하는 것만 그린다
		ImageIO.write(tBuffer, "png", new File(tName) );
		ImageIO.write(tBuffer, "jsp", new File(tName) );
		ImageIO.write(tBuffer, "jfif", new File(tName) );
		ImageIO.write(tBuffer, "gif", new File(tName) );
		
		//드디어 출력
		%>
		<%=tName %><br>
		<img src="/JSP/save/t<%=sName %>"border="0"><br><br>
		<%
	}
	
	%>
	
	
	
	 
	
	
	
	



