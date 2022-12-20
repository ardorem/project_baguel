<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.baguel.model.board.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		pages : <%=(int) request.getAttribute("pages")%></h1>
	<div id="center">
		<h2>주소록 : 목록화면 [Command Pattern]</h2>
		<hr>
		<form>
			<a href="addrbook_form.jsp">주소록 등록</a>

			<table>
				<tr>
					<th>No.</th>
					<th>작성일</th>
					<th>글 제목</th>
					<th>아이디</th>
					<th>처리여부</th>
				</tr>
				<%
					ArrayList<BoardDto> boardList = (ArrayList<BoardDto>) request.getAttribute("boardList");
					if (boardList != null) {
						for (BoardDto board : boardList) {
				%>
				<tr>
					<td><%=board.getRownumber()%></td>
					<td><%=board.getWriteDate() %></td>
					<td>[<%=board.getEventPlace() %>] <%=board.getEvent() %></td>
					<td><%=board.getId() %></td>
					<td><%=board.getApproval() %></td>
					<td><a href="">수정</a></td>
				</tr>
				<%
					}
					}
				%>

			</table>
		</form>
	</div>
</body>
</html>