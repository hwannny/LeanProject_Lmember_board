<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/JSP/board/style.css" rel="stylesheet" type="text/css">

<h2> 파일 선택 </h2>
<form method="post" action="fileUpload.jsp" enctype="multipart/form-data">
	<table>
		<tr>
			<th> 이름 </th>
			<td> <input class="input" type="text" name="name"> </td>			
		</tr>		
		<tr>
			<th> 제목 </th>
			<td> <input class="input" type="text" name="title"> </td>
		</tr>
		<tr>
			<th rowspan="2"> 파일 </th>
			<td> <input class="input" type="file" name="file_one"> </td>
		</tr>
		<tr>	
			<td> <input class="input" type="file" name="file_two"> </td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="전송">
				<input class="inputbutton" type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>

