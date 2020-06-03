<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/JSP/board/style.css" rel="stylesheet" type="text/css">

<h2> 섬네일 이미지 </h2>

<form method="post" enctype="multipart/form-data" action="thumbnailPro.jsp">
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
			<th rowspan="2"> 이미지 </th>
			<td> <input class="input" type="file" name="img_one"> </td>
		</tr>
		<tr>
			<td> <input class="input" type="file" name="img_two"> </td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="전송">
				<input class="inputbutton" type="reset" value="취소">
			</th>
		</tr>
	</table>		
</form>








