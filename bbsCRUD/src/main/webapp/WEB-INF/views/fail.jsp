<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background: #F2F2F2;
}
#wrap {
	background: white;
	display: block;
	width: 300px;
	margin: auto;
	margin-top: 200px;
	padding : 50px
}
</style>
</head>
<body>
<div id = "wrap">
<center>
<br>
비밀번호를 다시 확인해주세요!!!<br>
<br><br>
<input type="button" value="다시 입력하기" value="BACK" onClick="history.go(-1)">
<input type="button" value="취소" onclick="location.href='one.do?bno=${param.bno}'">
<br>
</body>
</div>
</html>