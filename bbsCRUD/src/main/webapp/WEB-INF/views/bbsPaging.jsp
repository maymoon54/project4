<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="all.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<h2>게시판</h2>

<div id="outter">
	<form action="search.do"><input type="text" class="input" name="keyword"><button class="button">검색</button></form><br>
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()" class="input">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10" 
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<table>
		<tr bgcolor="#F2F2F2">
			<td style="text-align: center;">No.</td>
			<td width="50%" style="text-align: center;">제목</td>
			<td style="text-align: center;">작성자</td>
			<td style="text-align: center;">등록일</td>
			<td style="text-align: center;">조회수</td>		
		</tr>
		<c:forEach items="${viewAll }" var="list">
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
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="all.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="all.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="all.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>

</body>
</html>