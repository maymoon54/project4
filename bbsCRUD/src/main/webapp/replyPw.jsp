<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<!-- <script type="text/javascript">
	$(function() {
		$('#dr').click(function() {
			//alert("클릭함");
			contentValue = $('#content').val()
			writerValue = $('#writer').val()
			pwValue = $('#pw').val()
			$.ajax({
				url : "replyDelete.do",
				data : {				
					pw : $('#pw').val(),
					rno : '${param.rno}',
					bno : '${param.rno}'
				},
				success : function(result) {
					alert(result);					
				}
			})
		})//클릭	
	})//ready
</script> -->
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
<form action="replyDelete.do" method="post">
댓글을 삭제합니다. <br>
비밀번호를 입력하세요!!<br>
<br>
<input type="text" name="pw" id="pw">
<input type="hidden" name="bno" value= "${param.bno}">
<input type="hidden" name="rno" value= "${param.rno}">
<br><br>
<button>댓글삭제</button>
<input type="button" value="취소" onclick="location.href='one.do?bno=${param.bno}'">
</form>
</div>



</body>
</html>