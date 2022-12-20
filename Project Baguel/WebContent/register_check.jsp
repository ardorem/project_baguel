<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.baguel.model.member.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.baguel.model.member.MemberDto" />
<jsp:setProperty name="dto" property="*" />
<%
// 	dto.setrDate(new Timestamp(System.currentTimeMillis()));
	MemberDao dao = MemberDao.getInstance();
	if (dao.confirmId(dto.getUserId()) == MemberDao.MEMBER_EXISTENT) {
%>
<script>
	alert("아이디가 이미 존재합니다.");
	history.back();
</script>
<%
	} else if (dao.confirmNick(dto.getUserNick()) == MemberDao.MEMBER_EXISTENT) {
%>
<script>
	alert("닉네임 이미 존재합니다.");
	history.back();
</script>
<%
	} else {
		int ri = dao.insertMember(dto);
		if (ri == MemberDao.MEMBER_JOIN_SUCCESS) {
			session.setAttribute("id", dto.getUserId());
%>
<div id="mainTitleUser">
	<h1>회원가입 완료</h1>
</div>
<div id="addOk">
	<h1>
		🥳회원가입을 환영합니다.🎉<br> ID:
		<%=dto.getUserId()%>
	</h1>
</div>
<%
	} else {
%>
<script>
	alert("회원가입에 실패 했습니다.");
	document.location.href = "loginjsp";
</script>
<%
	}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>