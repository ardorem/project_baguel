<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/login.css">
  <script src="js/members.js"></script>
  <title>๋ฐ๊ธ</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main">
        <div id="logo">
          <p>๋ฐ๊ธ๐ถโโ๏ธ๐ถ๐ถโโ๏ธ</p>
        </div>
      </a>
      <div id="loginMenu">
		<% 	if (session.getAttribute("loginMember") == null) { %>
	        <a href="register">ํ์๊ฐ์</a>
		<% 	} else { %>
			<%=session.getAttribute("userId") %>
			<a href="mypage">๋ง์ดํ์ด์ง</a>
		<%	} %>
		
		<% 	if (session.getAttribute("loginMember") == null) { %>
			<a href="login">๋ก๊ทธ์ธ</a>
		<% 	} else { %>
			<a href="/baguel/logout.do">๋ก๊ทธ์์</a>
		<%	} %>
	</div>  
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">์กฐํ</a>
          <ul>
            <li><a href="srch_station.html">์ญ์ผ๋ก ์กฐํ</a></li>
            <li><a href="srch_place.html">์ฅ์๋ก ์กฐํ</a></li>
          </ul>
        </li>
        <li><a href="cal_view.html">์บ๋ฆฐ๋</a>
          <ul>
            <li><a href="cal_add.html">์ผ์  ๋ฑ๋ก</a></li>
            <li><a href="cal_add.html">๋ฑ๋ก๋ ์ผ์ </a></li>
            <li><a href="cal_view.html">์บ๋ฆฐ๋ ๋ณด๊ธฐ</a></li>
          </ul>
        </li>
        <li><a href="map">์ง๋๋ก ๋ณด๊ธฐ</a></li>
        <li><a href="#">์ด์ฉ ์๋ด</a>
          <ul>
            <li><a href="about.html">about ๋ฐ๊ธ</a></li>
            <li><a href="qna.html">Q&A</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <!-- !!! ์ฌ๊ธฐ๋ถํฐ ์์ฑ !!! -->
      <div id="mainTitleUser">
        <h1>๋ก๊ทธ์ธ</h1>
      </div>
      <div id="regEvent">
        <form action="/baguel/login_check.do" method="post">
          <ul>
            <li><label for="userId">์์ด๋</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="userId" name="userId" placeholder="ID" minlength="4" maxlength="16" required autofocus></li>
            <li id="space"></li>
            <li><label for="userPw">ํจ์ค์๋</label></li>
            <li id="space-small"></li>
            <li><input type="password" id="userPw" name="userPw" placeholder="Password" minlength="8" maxlength="16" placeholder="" required onkeyup="checkCapsLock(event)"></li>
            <li id="space-small"></li>
            <li>
              <div id="msgCapslock"></div>
            </li>
            <li id="space"></li>
            <li>
              <ul id="find">
                <a href="find_id"><li>์์ด๋ ์ฐพ๊ธฐ</li></a>
                <a href="find_pw"><li>ํจ์ค์๋ ์ฐพ๊ธฐ</li></a>
                <a href="register"><li>ํ์๊ฐ์</li></a>
              </ul>
            </li>
            <li id="space"></li>
          </ul>
          <input type="submit" value="๋ก๊ทธ์ธ">
        </form>
      </div>



    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul>
          <li><a href="#">ํ์ฌ ์๊ฐ</a></li>
          <li><a href="#">๊ฐ์ธ์ ๋ณด์ฒ๋ฆฌ๋ฐฉ์นจ</a></li>
          <li><a href="#">์ด์ฉ์ฝ๊ด</a></li>
          <li><a href="#">์ฌ์ดํธ๋งต</a></li>
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
            <li>๋ณธ ์ฌ์ดํธ๋ '๋ค์ด๋ฒ'์์ ์ ์ํ '๋๋์คํ์ด ๋ค์ค'๋ฅผ ์ฌ์ฉํ๊ณ  ์์ต๋๋ค.</li>
          </ul>

        </div>
      </div>

    </footer>
    <!-- ************************************************************************ footer end -->
  </div>
</body>

</html>