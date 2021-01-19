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

.button {
	background-color: #2E64FE;
	border: none;
	color: white;
	padding: 7px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.input {
	padding: 5px;
}
</style>
<body>
	<h2>글쓰기</h2>
	<div id="outter">
		<hr>
		<form action="write.do">
			<table>
				<tr>
					<td>제목</td>
					<td><input class="input" type="text" name="title" size=88></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input class="input" type="text" name="writer" size=88></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input class="input"type="text" name="pw" size=88></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="input" rows="20" cols="90" name="content"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><center>
							<button type="submit" class="button">글쓰기</button>
							<input type="button" class="button" value="취소" value="BACK" onClick="history.go(-1)">
						</center></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>