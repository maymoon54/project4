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
${bbsDTO.writer}님 <br>
글이 등록되었습니다!!!<br>
<br><br>
<input type="button" value="확인" onclick="location.href='all.do'">
<br>
</body>
</div>
</html>