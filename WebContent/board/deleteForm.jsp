<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<link href="<%=project%>style.css" type="text/css" rel="stylesheet">
<script src="<%=project%>script.js"></script>

<h2> <%=page_delete%></h2>

<%
	String pageNum = request.getParameter( "pageNum" );
	int num = Integer.parseInt( request.getParameter( "num" ) );		
%>

<form method="post" action="deletePro.jsp" name="passwdform"
	onsubmit="return passwdcheck()">	
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="num" value="<%=num%>">
	<table>
		<tr>
			<th colspan="2"> <%=msg_passwd%> </th>
		</tr>
		<tr>
			<th> <%=str_passwd%> </th>	
			<td>
				<input class="input" type="password" name="passwd" 
					maxlength="30" autofocus>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_del%>">
				<input class="inputbutton" type="button" value="<%=btn_del_cancel%>"
					onclick="location='list.jsp?pageNum=<%=pageNum%>'">
			</th>
		</tr>		
	</table>
</form>











