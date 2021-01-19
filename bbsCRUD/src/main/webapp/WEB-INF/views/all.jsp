<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>등록일</th>
<th>조회수</th>
<th>댓글수</th>
</tr>
<c:forEach items="${list}" var="list" varStatus="status">
<tr>
<td>${list.bno}</td>
<td><a href="one.do?bno=${list.bno}">${list.title}</a></td>
<td>${list.writer}</td>
<td>${list.cdate}</td>
<td>${list.cnt}</td>
<td>${list.reply}</td>
</tr>
</c:forEach>
</table>

<hr>
<a href="bbsInsert.jsp"><button>글쓰기</button></a>
</body>
</html>