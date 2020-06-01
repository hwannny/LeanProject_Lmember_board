<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<link href="<%=project%>style.css" rel="stylesheet" type="text/css">
<script src="<%=project%>script.js"></script>

<h2> <%=page_modify%> </h2>

<%
	String id = (String) session.getAttribute( "memId" );
	String passwd = request.getParameter( "passwd" );	
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.check( id, passwd );
	if( result == 1 ) {
		// 비밀번호가 같다
		LogonDataBean memberDto = memberDao.getMember( id );
		%>
		<form method="post" action="modifyPro.jsp" name="modifyform"
			onsubmit="return modifycheck()">
			<table>
				<tr>
					<th colspan="2"> <%=msg_modify%> </th>
				</tr>
				<tr>
					<th> <%=str_id%> </th>
					<td> &nbsp;<%=memberDto.getId()%> </td>
				</tr>
				<tr>
					<th rowspan="2"> <%=str_passwd%> </th>
					<td>
						<input class="input" type="password" name="passwd" autofocus
							maxlength="30" value="<%=memberDto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="password" name="repasswd"
							maxlength="30" value="<%=memberDto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<th> <%=str_name%> </th>
					<td> &nbsp;<%=memberDto.getName()%> </td>
				</tr>
				<tr>
					<th> <%=str_jumin%> </th>
					<td> 
						&nbsp;<%=memberDto.getJumin1()%> - <%=memberDto.getJumin2()%>
					</td>		
				</tr>
				<tr>
					<th> <%=str_email%> </th>
					<%
					String email = memberDto.getEmail();
					if( email == null || email.equals( "" ) ) {
						%>
						<td>
							<input style="width:100px" class="input" type="text" name="email1" maxlength="25">
							@ <input style="width:100px" class="input" type="text" name="email2" maxlength="25">
						</td>						
						<%
					} else {
						String e[] = email.split("@");
						%>
						<td>
							<input style="width:100px" class="input" type="text" 
								name="email1" maxlength="25" value="<%=e[0]%>">
							@ <input style="width:100px" class="input" type="text" 
								name="email2" maxlength="25" value="<%=e[1]%>">
						</td>						
						<%
					}
					%>				
				</tr>
				<tr>
					<th> <%=str_tel%> </th>
					<%
						String tel = memberDto.getTel();
						if( tel == null || tel.equals( "" ) ) {
							// 전화번호가 없다
							%>
							<td>
							 	<input style="width:25px" class="input" type="text" name="tel1" maxlength="3">
								- <input style="width:35px" class="input" type="text" name="tel2" maxlength="4">
								- <input style="width:35px" class="input" type="text" name="tel3" maxlength="4">
							</td>
							<%
						} else {
							// 전화번호가 있다	
							String t[] = tel.split( "-" );
							%>
							<td>
							 	<input style="width:25px" class="input" type="text" name="tel1" maxlength="3"
							 		value="<%=t[0]%>">
								- <input style="width:35px" class="input" type="text" name="tel2" maxlength="4"
									value="<%=t[1]%>">
								- <input style="width:35px" class="input" type="text" name="tel3" maxlength="4"
									value="<%=t[2]%>">
							</td>
							<%
						}					
					%>
				</tr>
				<tr>
					<th> <%=str_reg_date%> </th>
					<td>
						<%
						Timestamp reg_date = memberDto.getReg_date();
						SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
						%>
						&nbsp;<%=sdf.format( reg_date )%>						
					</td>
				</tr>	
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_mod%>">
						<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
						<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='main.jsp'">
					</th>					
				</tr>		
			</table>			
		</form>		
		<%	
	} else {
		// 비밀번호가 다르다
		%>
		<script type="text/javascript">
			<!--
			erroralert( passwdcheckerror );
			//-->
		</script>
		<%
	}
%>
















