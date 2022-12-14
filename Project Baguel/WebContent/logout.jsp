<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/register_ok.css">
  
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
    <a href="register">ํ์๊ฐ์</a>
    <a href="login">๋ก๊ทธ์ธ</a>
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
        <h1>๋ก๊ทธ์์ ์๋ฃ</h1>
      </div>
      <div id="addOk">
        <h1>๋ก๊ทธ์์ ๋์์ต๋๋ค.<br>
          <span class="welcome">๋ค์์ ๋๋ด์๐๏ธ</span>
        </h1>
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