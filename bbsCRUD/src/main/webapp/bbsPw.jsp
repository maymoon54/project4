<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

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
<c:if test="${param.action == 0}">
<h3>게시물 삭제</h3>
<form action="bbsDelete.do" method="post">
</c:if>
<c:if test="${param.action == 1}">
<h3>게시물 수정</h3>
<form action="read.do" method="post">
</c:if>
글을 삭제하거나 수정하시려면 <br>
비밀번호를 입력하세요!!<br>
<br>
<input type="text" name="pw">
<input type="hidden" name="bno" value= "${param.bno}">
<button>입력</button>
<input type="button" value="취소" onclick="location.href='one.do?bno=${param.bno}'">

</center>
</form>
</div>


</body>
</html>