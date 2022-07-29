<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>저탄소 제주 여행</title>
  <meta name="description" content="저탄소 기반 여행 계획 사이트">
  <meta name="keywords" content="저탄소, 채식, 자전거, 전기차, 제주도, 여행, 계획, 여행계획">
  <meta name="author" content="권새롬, 이명지, 박준희">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimymum-scale=1.0">
  
  <!-- Open Graph (Facebook, Linkedin)-->
  <meta property="og:type" content="website">
  <meta property="og:title" content="저탄소 제주 여행">
  <meta property="og:description" content="저탄소 기반 여행 계획 사이트">
  <meta property="og:image" content="img/fun-coding-mark.png">
  <meta property="og:url" content="https://www.lowcarbon-jeju.com">
  <meta property="og:site_name" content="LowCarbonTrip">

  <!--twitter card (Twitter)-->
  <meta property="twitter:card" content="summary">
  <!--card 종류: summary, photo, player-->
  <meta name="twitter:title" content="저탄소 제주 여행">
  <meta name="twitter:description" content="저탄소 기반 여행 계획 사이트">
  <meta name="twitter:image" content="img/fun-coding-mark.png">
  <meta name="twitter:url" content="https://www.fun-coding.org">
  <meta name="twitter:creator" content="Myungji Lee">

  <!--일반적인 파비콘 설정-->
  <link rel="icon" href="img/fun-coding.ico">
  <!--아이폰용 파비콘 설정-->
  <link rel="apple-touch-icon" href="img/fun-coding.ico">
  <!--인터넷 익스플로러용 파비콘 설정-->
  <link rel="short icon" type="image/x-icon" href="img/fun-coding.ico">

  <!--CSS RESET-->
  <!--리셋 링크는 꼭 최상단에 적어줘야 함.-->
  <link rel="stylesheet" href="../css/normalize.css">
  <link rel="stylesheet" href="/style.css"> <!-- 메인화면 css -->
  <link rel="stylesheet" href="/main.css"> <!-- 팝업 css  -->
  <!--fontawesome-->
  <script src="https://kit.fontawesome.com/bb81250f29.js" crossorigin="anonymous"></script>
  <!--Spoca Han Sans Neo-->
  <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
  
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>

</head>
<body>
  <header>
    <div class="inner">
      <div class="head-container">
        <div class="head-brand"><a href="/mainpage.jsp">저탄소 제주 여행</a></div>
        <div class="head-blog">
        	<ul>
                <li style="display: inline-block;"><a href="signup.jsp" id="buttons"><p>회원가입</p></a></li> &nbsp &nbsp &nbsp
                <li style="display: inline-block;"><a href="#login" id="buttons"><p>로그인</p></a></li>   
            </ul>  
        </div>
      </div>
    </div>
  </header>
  <!-- 요기부터 로그인 팝업창 -->
  <div id="login" class="overlay">
      <div class="popup"> <div class="title"> <p> 로그인 </p> </div>
      <fieldset>
           <form action="log" method="post">
                <ul>
                    <li>
                        <label for="user-id"> 아이디 </label>
                        <input type="text" name="user-id" autofocus placeholder="아이디 입력" required/>
                    </li>
                    <li>
                        <label for="user-pwd"> 비밀번호 </label>
                        <input type="password" name="user-pwd" placeholder="비밀번호 입력" required/>
                    </li>
                </ul>  
                <br>
                <div id="buttons">
                    <input type="submit" value="로그인"/>
                    <a href="#none" class="close">&times;</a>
                </div>
             </form>
             <div style="font-size: 15px; text-align : center;"><p>아이디가 없으신가요? <a href="signup.jsp">&nbsp 회원가입</a></p></div> 
                <br><p style="font-size : 13px"> SNS 계정으로 로그인</p><hr>
                <ul style="text-align: center;" class="sns">  
              		<li onlick="kakaoLogin()" style="display: inline-block;"><!-- 카카오 -->
	               		<a href="javascript:loginWithKakao()">
	                   	<img src="/img/kakao_login_large.png" alt="카카오 로그인 버튼"/></a>
	                	<!-- 카카오 로그인 -->
						<script type="text/javascript">
							Kakao.init('aaf6aeb8548101614cfb4d94eec89d1e'); //발급받은 키 중 javascript키를 사용해준다.
							console.log(Kakao.isInitialized()); // sdk초기화여부판단
							//카카오로그인
							function loginWithKakao() {
							    Kakao.Auth.login({
							      success: function (response) {
							        Kakao.API.request({
							        	url: '/v2/user/me',
							        	success: function (response) {
		         							var kakaonickname = response.properties.nickname;    //카카오톡 닉네임을 변수에 저장 (닉네임 값을 다른페이지로 넘겨 출력하기 위해서)
		         							window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/home.jsp?kakaonickname="+kakaonickname);},
							            fail: function (error) {console.log(error)},
							        });},
							      fail: function (error) { console.log(error) },
							    })}
					</script></li>
			    	<li style="display: inline-block;"><!-- 네이버 -->
						<div id="naver_id_login"></div>		
						<script type="text/javascript">
						  	var naver_id_login = new naver_id_login("4PtXLl4qAKOf3JMWWdNt", "http://localhost:8080/mainpage.jsp");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("green", 2,20);
						  	naver_id_login.setDomain("http://localhost:8080/mainpage.jsp");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
							// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
							function naverSignInCallback() {
								// naver_id_login.getProfileData('프로필항목명');
								// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
								alert(naver_id_login.getProfileData('email'));
								alert(naver_id_login.getProfileData('nickname'));
							}
							// 네이버 사용자 프로필 조회
							naver_id_login.get_naver_userprofile("naverSignInCallback()");
					   </script></li>        
				 </ul>
            </fieldset>
        </div></div> 
  <!--한 라인씩 내용을 넣을 예정-->
  <section class="main">
    <div class="main-container">
      <div class="inner">
        <div class="title-container">
          <div class="title">저탄소 제주 여행 로드맵</div>
          <div class="message">
            숙박부터 식사, 이동수단까지<br>
            제주 여행의 시작과 끝을<br>
            저탄소로 채워보세요.
          </div>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div class="inner">
      <div class="skill-container">
        <a href="https://naver.com"></a>
        <div class="skill"><a href="signup.jsp">
          <i class="fa-solid fa-bed skill-icon bed-style"></i>
          <div class="skill-title">
            <div class="skill-name">숙박 업소</div></a>
          </div>
        </div>
        <div class="skill">
          <i class="fa-solid fa-seedling skill-icon seedling-style"></i>
          <div class="skill-title">
            <div class="skill-name">채식 식당</div>
          </div>
        </div>
        <div class="skill">
          <i class="fa-solid fa-lemon skill-icon cafe-style"></i>
          <div class="skill-title">
            <div class="skill-name">채식 카페</div>
          </div>
        </div>
        <div class="skill">
          <i class="fa-solid fa-charging-station skill-icon charging-style"></i>
          <div class="skill-title">
            <div class="skill-name">전기차 충전소</div>
          </div>
        </div>
        <div class="skill">
          <i class="fa-solid fa-bicycle skill-icon bicycle-style"></i>
          <div class="skill-title">
            <div class="skill-name">자전거 대여소</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div class="inner">
      <div class="section-container">
        <div class="roadmap-container">
          <div class="roadmap-title">추천 여행지</div>
          <div class="arrow-container">
            <i class="fa-solid fa-angle-left arrow-prev"></i>
            <i class="fa-solid fa-angle-right arrow-next"></i>
          </div>
        </div>
        <ul class="class-list">
          <li class="class-card">
            <img src="/img/성산일출봉.webp" alt="성산일출봉" style="width: 100%;">
            <div class="class-container">
              <div class="class-maintitle">성산일출봉</div>
              <div class="class-subtitle">제주도 서귀포시에 있는 봉입니다.</div>
            </div>
          </li>
          <li class="class-card">
            <img src="/img/산방산.jpg" alt="산방산" style="width: 100%;">
            <div class="class-container">
              <div class="class-maintitle">산방산</div>
              <div class="class-subtitle">제주도 서귀포시에 있는 산입니다.</div>
            </div>
          </li>

        </ul>
      </div>
    </div>
  </section>
  
  <!--footer를 넣을 예정-->
  <footer></footer>

  <!--<script src="js/main.js"></script>-->
</body>
</html>
