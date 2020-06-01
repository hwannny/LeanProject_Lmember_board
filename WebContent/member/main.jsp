<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="<%=project%>style.css" rel="stylesheet" type="text/css">
<script src="<%=project%>script.js"></script>

<h2> <%=page_main%> </h2>

<%
	if( session.getAttribute( "memId" ) == null ) { 
		// 로그인이 안 된 페이지 
	%>
	<form method="post" action="loginPro.jsp" name="mainform" onsubmit="return maincheck()">
		<table>
			<tr>
				<th colspan="2">
					<%=msg_main%>
				</th>
			</tr>
			<tr>
				<th> <%=str_id%> </th>
				<td> 
					<input class="input" type="text" name="id" maxlength="30" autofocus>
				</td>
			</tr>
			<tr>
				<th> <%=str_passwd%> </th>
				<td>
					<input class="input" type="password" name="passwd" maxlength="30">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_login%>">
					<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_input%>"
						onclick="location='inputForm.jsp'">
				</th>
			</tr>
		</table>
	</form>
	<%
	} else {
		// 로그인이 된 페이지
		%>
		<table>
			<tr>
				<td align="center" style="width: 400px"> 
					<span><%=session.getAttribute( "memId" )%></span><%=msg_begin%> 
				</td>
			</tr>
			<tr>
				<th>
					<input class="inputbutton" type="button" value="<%=btn_logout%>"
						onclick="location='logout.jsp'">
					<input class="inputbutton" type="button" value="<%=btn_modify%>"
						onclick="location='modifyForm.jsp'">
					<input class="inputbutton" type="button" value="<%=btn_delete%>"
						onclick="location='deleteForm.jsp'">
				</th>
			</tr>
		</table>		
		<%		
	}
%>












