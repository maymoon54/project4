<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#reply').click(function() {
			//alert("클릭함");
			contentValue = $('#content').val().replace(/\n/g,"<br>")
			writerValue = $('#writer').val()
			pwValue = $('#pw').val()
			$.ajax({
				url : "create.do",
				data : {
					writer : writerValue,
					pw : pwValue,
					content : contentValue,
					bno : '${one.bno}'
				},
				success : function(result) {
					//alert(result);
					$('#result').append(result)
					location.reload()
				}
			})
		})//클릭	
	})//ready
</script>
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
}

.reply th, .reply td {	
	border-bottom: 1px solid #D8D8D8;
	
}

.content th, .content td {	
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

.one {
  background-color: #585858;
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
<body>
	<h2>게시판</h2>
	<div id="outter">
		
		<table class="content">
			<tr>
				<td colspan="3" bgcolor="#F2F2F2">${one.title}</td>
			</tr>
			<tr>
				<td colspan="2">${one.writer}｜${one.cdate}</td>	
				<td width="10%">조회 ${one.cnt}</td>
			</tr>
			<tr>			
			<td td colspan="3">${one.content}</td>			
			</tr>
			
		</table>


			
		<table class="reply">
			<td width="15%">댓글 [${total}]</td>
			<td colspan="2"></td>
			<c:forEach items="${list}" var="vo" varStatus="status">
				<tr>
					<td width="15%">${vo.writer}</td>
					<td>${vo.content}</td>
					<td width="5%"><a
						href="replyPw.jsp?bno=${vo.bno}&rno=${vo.rno}"><button
								id="replyDelete">x</button></a></td>
				</tr>
			</c:forEach>
		</table>

		<div id="result"></div>
		<table>
			<tr bgcolor="#F2F2F2" border="0">
				<td><input type="text" id="writer" class="input" placeholder="닉네임" size=10></td>
				<td rowspan="2"><textarea rows="5" class="input" cols="100" id="content"></textarea></td>
				<td></td>
			</tr>
			<tr bgcolor="#F2F2F2" border="0">
				<td><input type="text" id="pw" class="input" placeholder="비밀번호" size=10></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="#F2F2F2" border="0"><center>
						<button id="reply" class="button">댓글달기</button>
					</center></td>
			</tr>
		</table>
					
		<input type="button" class="button" value="전체글" style="float: left;"
			onclick="location.href='all.do'"> <input type="button" class="button"
			value="글쓰기" style="float: right;"
			onclick="location.href='bbsInsert.jsp'">
			 <input type="button" class="one"
			value="삭제" style="float: right;"
			onclick="location.href='bbsPw.jsp?bno=${one.bno}&action=0'">
			<input type="button" class="one" value="수정" style="float: right;"
			onclick="location.href='bbsPw.jsp?bno=${one.bno}&action=1'">
			<br>
	</div>
</body>
</html>