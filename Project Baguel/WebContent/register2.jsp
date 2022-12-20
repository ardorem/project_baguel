<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/register.css">
  <script src="js/members.js"></script>
  <title>바글</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main.jsp">
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
			<a href="/baguel/logout.do">로그아웃</a>
		<%	} %>
	</div>  
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">조회</a>
          <ul>
            <li><a href="srch_station.html">역으로 조회</a></li>
            <li><a href="srch_place.html">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="cal_view.html">캘린더</a>
          <ul>
            <li><a href="cal_add.html">일정 등록</a></li>
            <li><a href="cal_add.html">등록된 일정</a></li>
            <li><a href="cal_view.html">캘린더 보기</a></li>
          </ul>
        </li>
        <li><a href="map.jsp">지도로 보기</a></li>
        <li><a href="#">이용 안내</a>
          <ul>
            <li><a href="about.html">about 바글</a></li>
            <li><a href="qna.html">Q&A</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <!-- !!! 여기부터 작성 !!! -->
      <div id="mainTitleUser">
        <h1>회원가입</h1>
      </div>
      <div id="regEvent">
        <form action="/baguel/insert.do" name="reg_frm" method="post">
          <ul>
            <li>
              <div class="rightTxt">
                <p>* 필수 입력사항</p>
              </div>
            </li>
            <li><label for="userId">아이디</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="userId" name="userId" placeholder="영문 소문자/숫자, 4~16자" required maxlength="16"
                autofocus></li>
            <li><input type="button" value="중복체크" onclick=""></li>
            <li>
              <div class="smalltxt">
<!--                 <p>사용가능한 아이디 입니다.</p> -->
				<div id="idCheck"></div>
              </div>
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
            <li><input type="text" name="userName" id="userName" maxlength="10" required></li>
            <li id="space"></li>

            <li><label for="userNick">닉네임</label></li>
            <li id="space-small"></li>
            <li><input type="text" name="userNick" id="userNick" maxlength="10" required></li>
            <li id="space"></li>

            <li><label for="userMail">이메일</label></li>
            <li id="space-small"></li>
            <li><input type="email" name="userMail" id="userMail"></li>
            <li id="space"></li>
            <li id="space"></li>
          </ul>
          <input type="button" value="회원가입" onclick="infoConfirm()">
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