<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #D8D8D8;
	border-top: 1px solid #D8D8D8;
}

#outter {
	display: block;
	width: 70%;
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
 padding: 7px;
}
</style>
</head>
<h2>검색결과</h2>

<div id="outter">

<table>
		<tr bgcolor="#F2F2F2">
			<td style="text-align: center;">No.</td>
			<td width="50%" style="text-align: center;">제목</td>
			<td style="text-align: center;">작성자</td>
			<td style="text-align: center;">등록일</td>
			<td style="text-align: center;">조회수</td>		
		</tr>
		<c:forEach items="${search}" var="list">
			<tr id="title">
				<td style="text-align: center;">${list.bno }</td>
				<td style="padding-left: 20px;"><a href='one.do?bno=${list.bno }'>${list.title }</a><c:if test="${list.reply > 0}"> [${list.reply}]</c:if></td>
				<td style="text-align: center;">${list.writer }</td>
				<td style="text-align: center;">${list.cdate }</td>
				<td style="text-align: center;">${list.cnt }</td>
			</tr>
		</c:forEach>
	</table>
<input type="button" class="button" value="전체글" style="float: left;" onclick="location.href='all.do'">
<input type="button" class="button" value="글쓰기" style="float: right;" onclick="location.href='bbsInsert.jsp'"><br>
</div>
</body>
</html>