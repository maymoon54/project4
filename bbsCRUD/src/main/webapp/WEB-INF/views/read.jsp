<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>
<body>
<h2>글 수정</h2>
<div id="outter">
<hr>
<form action="update.do">
<table>
<tr>
<td>제목</td>
<td><input type="text" name="title" size=88 value="${read.title}"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="20" cols="90" name="content">${read.content}</textarea></td>
</tr>
<tr>
<td><input type="hidden" name="bno" value="${read.bno}"></td>
<td><center><button type="submit">수정하기</button></center></td>
</tr>
</table>
</form>
</div>
</body>
</html>