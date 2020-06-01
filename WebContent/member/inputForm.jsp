<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="<%=project%>style.css" rel="stylesheet" type="text/css">
<script src="<%=project%>script.js"></script>

<h2> <%=page_input%> </h2>

<form method="post" action="inputPro.jsp" name="inputform" onsubmit="return inputcheck()">
	<input type="hidden" name="check" value="0">
	<table>
		<tr>
			<th colspan="2">
				<%=msg_input%>
			</th>
		</tr>
		<tr>
			<th> * <%=str_id%> </th>
			<td>
				<input class="input" type="text" name="id" maxlength="30" autofocus>
				<input class="inputbutton" type="button" value="<%=btn_confirm%>"
					onclick="confirmid()">					
			</td>
		</tr>
		<tr>
			<th rowspan="2"> * <%=str_passwd%> </th>
			<td>
				<input class="input" type="password" name="passwd" maxlength="30">
			</td>
		</tr>
		<tr>
			<td>
				<input class="input" type="password" name="repasswd" maxlength="30">
			</td>
		</tr>
		<tr>
			<th> * <%=str_name%> </th>
			<td>
				<input class="input" type="text" name="name" maxlength="50">
			</td>
		</tr>
		<tr>
			<th> * <%=str_jumin%> </th>
			<td>
				<input style="width:50px" class="input" type="text" name="jumin1" maxlength="6"
					onkeyup="nextjumin1()">
				- <input style="width:55px" class="input" type="text" name="jumin2" maxlength="7"
					onkeyup="nextjumin2()">
			</td>
		</tr>
		<tr>
			<th> <%=str_email%> </th>
			<td>
				<input style="width:100px" class="input" type="text" name="email1" maxlength="25">
				@
				<select class="input" name="email2">
					<option value="0"> 직접입력 </option>
					<option value="naver.com"> 네이버 </option>
					<option value="daum.net"> 다음 </option>
					<option value="gmail.com"> 구글 </option>
					<option value="nate.com"> 네이트 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th> <%=str_tel%> </th>
			<td>
				<input style="width:25px" class="input" type="text" name="tel1" maxlength="3"
					onkeyup="nexttel1()">
				- <input style="width:35px" class="input" type="text" name="tel2" maxlength="4"
					onkeyup="nexttel2()">
				- <input style="width:35px" class="input" type="text" name="tel3" maxlength="4"
					onkeyup="nexttel3()">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input name="input" class="inputbutton" type="submit" value="<%=btn_input%>">
				<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
				<input class="inputbutton" type="button" value="<%=btn_input_cancel%>"
					onclick="location='main.jsp'">
			</th>
		</tr>
	</table>	
</form>













