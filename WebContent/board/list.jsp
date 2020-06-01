<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="<%=project%>style.css" type="text/css" rel="stylesheet">


	<%
	int pageSize = 5; 				//한페이지당 출력한 글개수 
	
	int cnt=0; 							//글개수
	String pageNum = null ;		//현재페이지
	int currentPage = 0;				//계산용 현재페이지
	int start = 0; 						//현재 페이지 시작 rownum(db에서 가져올)
	int end = 0;							//현재 페이지 끝   rownum(db에서 가져올)
	int number = 0;					//출력용 글번호
	%>
	
	
	<%
	BoardDBBean boardDao = BoardDBBean.getInstance();
	cnt = boardDao.getCount();
	pageNum = request.getParameter( "pageNum" );
	if( pageNum== null){
		pageNum="1";
	}
	
	currentPage = Integer.parseInt( pageNum );
	start = ( currentPage - 1 )*pageSize +1;  	//내가 5페이지 보겠다고 가정하면 ( 5-1 ) *10 +1 =41;
	end = start + pageSize -1;						// 41+10 -1 = 50
	if( end >cnt ) end = cnt;
	
	number = cnt - ( currentPage - 1) * pageSize; 	// 50 - ( 1 - 1) * 10
	
	%>
	
	
<h2> <%=page_list%>(<%=str_cnt %>:<%=cnt%>)</h2>


<table>
	<tr>
		<td colspan="6" align="right">
			<a href="writeForm.jsp" ><%=str_write %></a> &nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th style="width: 8%" ><%=str_number %></th>
		<th style="width: 45%" ><%=str_subject %></th>
		<th style="width: 15%" ><%=str_writer %></th>
		<th style="width: 15%" ><%=str_reg_date %></th>
		<th style="width: 9%" ><%=str_readcount %></th>
		<th style="width: 15%" ><%=str_ip %></th>
	</tr>
	<%
	if ( cnt ==0 ){
		//글이 없는 경우
	%>
	<tr>
		<td colspan="6" align="center">
			<%=msg_list_x %>
		</td>
	</tr>
	<%
	}else{
		//글이 있는 경우
		ArrayList<BoardDataBean> boardDtos = boardDao.getArticles( start, end );
		for( int i=0; i<boardDtos.size(); i++){
			BoardDataBean boardDto = boardDtos.get( i );
			%>
			<tr>
				<td align="center">
					<%=number--%>
				</td>
				<td>
					&nbsp;
					<%
						int level = boardDto.getRe_level();
						if( level >1 ){
							int wid = (level - 1) * 10;
							%>
							<img src="<%=project%>images/level.gif" border="0" width="<%=wid%>" height="15">
							<%
						}
						if( level > 0 ){
							%>
							<img src="<%=project%>images/re.gif" border="0" width="20" height="15">
							<%
						}
					%>
					<a href="content.jsp?pageNum=<%=pageNum%>&num=<%=boardDto.getNum()%>">
						<%=boardDto.getSubject() %>
					</a>
				</td>
				<td align="center">
					<%=boardDto.getWriter() %>
				</td>
				<td align="center">
					<%
					SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm");
					%>
					<%=sdf.format(boardDto.getReg_date()) %>
				</td>
				<td align="center">
					<%=boardDto.getReadcount()%>
				</td>
				<td align="center">
					<%=boardDto.getIp()%>
				</td>
			</tr>
			<%
		}
	}
	 %>
</table>














