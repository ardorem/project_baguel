<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/map.css">
  <!-- 맵api 관련 js start-->
  <script defer src="js/map.js"></script>
  <script defer
    src="https://maps.googleapis.com/maps/api/js?key=   &callback=initMap"></script>
  <!-- 맵api 관련 js end-->
  <title>바글</title>
</head>

<body>
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

      <div id="mainTitleUser">
        <h1>지도로 보기</h1>
        <p>오늘의 예측 인구밀도를<br>원할 - 보통 - 붐빔 - 혼잡 4단계로 나타냅니다.<br>
        </p>
      </div>
      <div id="colorBar">
        <div id="colorName">원할</div>
        <div id="colorName">보통</div>
        <div id="colorName">붐빔</div>
        <div id="colorName">혼잡</div>
      </div>
      <div id="map"></div>
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