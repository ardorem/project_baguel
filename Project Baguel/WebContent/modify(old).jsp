<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.baguel.model.member.*" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/modify.css">
  <title>바글</title>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = String.valueOf(session.getAttribute("userId"));
	String userPw = request.getParameter("userPw");
	System.out.println(userId);
	System.out.println(userPw);
	MemberDao dao = MemberDao.getInstance();
	int checkNum = dao.userCheck(userId, userPw);
	
	if(checkNum == 0){
%>
	<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1);
	</script>
<%
	}
	MemberDto dto = dao.getMember(userId);
%>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main">
        <div id="logo">
          <p>바글🚶‍♂️🚶🚶‍♀️</p>
        </div>
      </a>
      <div id="loginMenu">
		<% 	if (session.getAttribute("loginMember") == null) { %>
	        <a href="register">회원가입</a>
		<% 	} else { %>
			<%=session.getAttribute("userId") %>
			<a href="mypage">마이페이지</a>
		<%	} %>
		
		<% 	if (session.getAttribute("loginMember") == null) { %>
			<a href="login">로그인</a>
		<% 	} else { %>
			<a href="logout">로그아웃</a>
		<%	} %>
	</div>  
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">조회</a>
          <ul>
            <li><a href="srch_station.jsp">역으로 조회</a></li>
            <li><a href="srch_place.jsp">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="cal_view.jsp">캘린더</a>
          <ul>
            <li><a href="cal_add.jsp">일정 등록</a></li>
            <li><a href="cal_add.jsp">등록된 일정</a></li>
            <li><a href="cal_view.jsp">캘린더 보기</a></li>
          </ul>
        </li>
        <li><a href="map">지도로 보기</a></li>
        <li><a href="#">이용 안내</a>
          <ul>
            <li><a href="about.jsp">about 바글</a></li>
            <li><a href="qna.jsp">Q&A</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <!-- !!! 여기부터 작성 !!! -->
      <div id="mainTitleModify">
        <h1>회원정보 수정</h1>
      </div>
      <div id="regEvent">
        <form action="modify_ok" name="" method="post">
          <ul>
            <li>
              <div class="rightTxt">
                <p>* 필수 입력사항</p>
              </div>
            </li>
            <li class="title">아이디</li>
            <li id="space-small"></li>

            <li class="content"><%=dto.getUserId() %></li>
            </li> 
            <li id="space"></li>

            <li><label for="userPw">비밀번호</label></li>
            <li id="space-small"></li>
            <li><input type="password" id="userPw" name="userPw" maxlength="16"
                placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자" required></li>
            <li id="space-small"></li>
            <li><input type="password" id="userPw_check" name="userPw_check" maxlength="16" placeholder="비밀번호 확인"
                required></li>
            <li id="space"></li>

            <li><label for="userName">이름</label></li>
            <li id="space-small"></li>
            <li><input type="text" name="userName" id="userName" maxlength="10" value="<%=dto.getUserName() %>" required></li>
            <li id="space"></li>

            <li><label for="userNick">닉네임</label></li>
            <li id="space-small"></li>
            <li><input type="text" name="userNick" id="userNick" minlength="3" maxlength="15" value="<%=dto.getUserNick()%>" required></li>
            <li id="space"></li>
            
            <li><label for="userMail">이메일</label></li>
            <li id="space-small"></li>
            <li><input type="email" name="userMail" id="userMail" value="<%=dto.getUserMail()%>" required></li>
            <li id="space"></li>
            <li id="space"></li>
            <input type="submit" value="회원정보 수정"><br>
            <li id="space"></li>
            <input type="button" value="취소" onclick="window.location='mypage.jsp'">
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>
            <input type="button" value="회원 탈퇴">
          </ul>
        </form>
      </div>



    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul>
          <li><a href="#">회사 소개</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">이용약관</a></li>
          <li><a href="#">사이트맵</a></li>
        </ul>
        <div id="sns">
          <ul>
            <li><a href="#"><img src="images/sns-1.png"></a></li>
            <li><a href="#"><img src="images/sns-2.png"></a></li>
            <li><a href="#"><img src="images/sns-3.png"></a></li>
            <li></li>
          </ul>
        </div>

        <div id="fontRight">
          <ul>
            <li>본 사이트는 '네이버'에서 제작한 '나눔스퀘어 네오'를 사용하고 있습니다.</li>
          </ul>

        </div>
      </div>

    </footer>
    <!-- ************************************************************************ footer end -->
  </div>
</body>

</html>