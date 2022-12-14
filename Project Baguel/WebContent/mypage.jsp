<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/mypage.css">
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
            <li><a href="srch_station.jsp">์ญ์ผ๋ก ์กฐํ</a></li>
            <li><a href="srch_place.jsp">์ฅ์๋ก ์กฐํ</a></li>
          </ul>
        </li>
        <li><a href="cal_view.jsp">์บ๋ฆฐ๋</a>
          <ul>
            <li><a href="cal_add.jsp">์ผ์  ๋ฑ๋ก</a></li>
            <li><a href="cal_added.jsp">๋ฑ๋ก๋ ์ผ์ </a></li>
            <li><a href="cal_view.jsp">์บ๋ฆฐ๋ ๋ณด๊ธฐ</a></li>
          </ul>
        </li>
        <li><a href="map">์ง๋๋ก ๋ณด๊ธฐ</a></li>
        <li><a href="#">์ด์ฉ ์๋ด</a>
          <ul>
            <li><a href="about.jsp">about ๋ฐ๊ธ</a></li>
            <li><a href="qna.jsp">Q&A</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <!-- !!! ์ฌ๊ธฐ๋ถํฐ ์์ฑ !!! -->
      <div id="mainTitleUser">
        <h1>๋ง์ด ํ์ด์ง</h1>
      </div>
      
      <div id="addOk">
        <span class="welcome">์๋ํ์ธ์, <%=session.getAttribute("userNick") %>๋</span>
      </div>
      
      <div id="mypage">
        <div id="myRequest">
          <h1>๋ด๊ฐ ์์ฑํ ๊ธ</h1>
          <table>
            <tr>
              <th>No.</th>
              <th>์์ฑ์ผ</th>
              </th>
              <th>๊ธ ์ ๋ชฉ</th>
              <th>๋๋ค์</th>
              <th>์ฒ๋ฆฌ์ฌ๋ถ</th>
            </tr>
            <tr>
              <td>50</td>
              <td>2022-10-22</td>
              <td><a href="cal_add_user.jsp">[ ๊ณ ์ฒ์ค์นด์ด๋ ] ์์์ ์ฝ์ํธ [IM HERO](user)</a></td>
              <td>Lucian</td>
              <td>์ฒ๋ฆฌ์ค</td>
            </tr>
            <tr>
              <td>42</td>
              <td>2022-10-22</td>
              <td>[ ์ดํ์ฌ์๋ํ๊ต ์ผ์ฑํ ] Heize 1st Concert Heize City in Seoul</td>
              <td>Lucian</td>
              <td class="complete">์ถ๊ฐ์๋ฃ</td>
            </tr>
          </table>
        </div>
        <div id="myCommet">
          <h1>๋ด๊ฐ ์์ฑํ ๋๊ธ</h1>
          <table>
            <tr>
              <th>No.</th>
              <th>์์ฑ์ผ</th>
              </th>
              <th>๊ธ ์ ๋ชฉ</th>
              <th>๋๋ค์</th>
              <th>์ฒ๋ฆฌ์ฌ๋ถ</th>
            </tr>
            <tr>
              <td>48</td>
              <td>2022-10-22</td>
              <td>[ ๊ตญ๋ฆฝํ๋ ๋ฏธ์ ๊ด ] ํ๋ก์ ํธ ํด์ํ๊ทธ 2022<br>
                <span class="comment">โฅ ํฅ๋ฏธ๋ก์ด ์ ์๋ค์!</span></td>
              <td>Maris</td>
              <td>์ฒ๋ฆฌ์ค</td>
            </tr>
            <tr>
              <td>46</td>
              <td>2022-10-22</td>
              <td>[ coex ์ ํ์นด๋ artium ] THE WONDERFUL HYNNIVERSARY ใLET ME INใ<br>
                <span class="comment">โฅ ์ผ์  ์ข๋ฃ์ผ์ด ์๋ชป ๋๊ฒ ๊ฐ์์ ....</span></td>
              <td>Georgina</td>
              <td>์ฒ๋ฆฌ์ค</td>
            </tr>
          </table>
        </div>
        <hr>
        <form>
          <input type="button" value="ํ์์ ๋ณด ์์ " onClick="location.href='modify_pw_check.jsp'"> 
          <!-- ์ ํ์ด์ง์์ ์ด๊ธฐ -->
          <!-- <input type="button" value="ํ์์ ๋ณด ์์ " onClick="window.open('http://www.daum.net')"> -->
          <!-- ์ ํ์ด์ง์์ ์ด๊ธฐ -->
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