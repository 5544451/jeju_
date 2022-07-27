<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저탄소 제주 여행 길잡이</title>
    <style>
    </style>
    <link href="/main.css" rel="stylesheet">
    <style>
        body {
	        font-size: 20px;
	        font-weight: 600;
        }
        .navi ul {
            height: 50px;
            text-align: right;
        }
        .navi ul li {
            display: inline-block;
            padding: 10px;

        }
        .navi a:link, .navi a:visited{
            display: block;
            font-size: 15px;
            color: #222;
            text-decoration: none;
            text-align: center;
        }
        .navi a:hover, .navi a:focus{
            background-color: #222;
            color: #fff;
        }

        .sns li{
            display: inline;
        }
    </style>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
</head>
<body>
    <div id="container">
        <nav class="navi">
            <ul>
                <li><a href="signup.jsp" id="buttons"><p>회원가입</p></a></li>
                <li><a href="#login" id="buttons"><p>로그인</p></a></li>   
            </ul>      
            <hr>      
        </nav>
    </div>
    <!-- 요기부터 로그인 팝업창 -->
    <div id="login" class="overlay">
        <div class="popup">
            <div class="title"> <p> 로그인 </p> </div>
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
                    <input type="submit" value="로그인""/>
                    <a href="#none" class="close">&times;</a>
                </div>
             </form>
             <div style="font-size: 15px; text-align : center;"><p>아이디가 없으신가요? <a href="signup.jsp">회원가입</a></p></div>
                <br><p style="font-size : 13px"> SNS 계정으로 로그인</p><hr>
                <ul style="text-align: center;" class="sns">  
               		<li onlick="kakaoLogin()"><!-- 카카오 -->
	               		<a href="javascript:loginWithKakao()">
	                   	<img src="/img/kakao_login_large.png" width="80" alt="카카오 로그인 버튼"/></a>
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
		         							window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/home.jsp?kakaonickname="+kakaonickname);
		         					          //로그인 결과 페이지로 닉네임 값을 넘겨서 출력시킨다.,
							        	},
							          fail: function (error) {
							            console.log(error) },
							        });
							      },
							      fail: function (error) {
							        console.log(error) },
							    })
							  }
						</script>
				    <li><!-- 네이버 -->
						<div id="naver_id_login"></div>		
						<script type="text/javascript">
						  	var naver_id_login = new naver_id_login("4PtXLl4qAKOf3JMWWdNt", "http://localhost:8080/home.jsp");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("green", 1,35);
						  	naver_id_login.setDomain("http://localhost:8080");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
					 	</script>
					  	<script type="text/javascript">
							// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
							function naverSignInCallback() {
								// naver_id_login.getProfileData('프로필항목명');
								// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
								alert(naver_id_login.getProfileData('email'));
								alert(naver_id_login.getProfileData('nickname'));
							}
							// 네이버 사용자 프로필 조회
							naver_id_login.get_naver_userprofile("naverSignInCallback()");
						</script>          
				 </ul>
            </fieldset>
        </div>
      </div>
</body>
</html>