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
    </style>
</head>
<body>
    <div id="container">
        <nav class="navi">
            <ul>
                <li><a href="signup.jsp" id="buttons"><p>회원가입</p></a></li>
                <li><a href="#pop01" id="buttons"><p>로그인</p></a></li>   
            </ul>      
            <hr>      
        </nav>
    </div>
    <!-- 요기부터 로그인 팝업창 -->
    <div id="pop01" class="overlay">
        <div class="popup">
            <div class="title">
                <p> 로그인 </p>
            </div>
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
                <div style="font-size: 15px; text-align : center;">
                    <p>아이디가 없으신가요? <a href="signup.jsp">회원가입</a></p>                      
                </div>
                
                <br><p style="font-size : 13px"> SNS 계정으로 로그인</p><hr>
                <ul style="text-align: center;">  
                
                	<li onlick="kakaoLogin()"><!-- 카카오 -->
                		<a id="custom-login-btn" href="javascript:void(0)">
                    	<img src="/img/kakao_login_large.png" width="80" alt="카카오 로그인 버튼"/></a>
                
	                <!-- 카카오 로그인 -->
	                <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	                <script>
						Kakao.init('aaf6aeb8548101614cfb4d94eec89d1e'); //발급받은 키 중 javascript키를 사용해준다.
						console.log(Kakao.isInitialized()); // sdk초기화여부판단
						//카카오로그인
						function kakaoLogin() {
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
						        })
						      },
						      fail: function (error) {
						        console.log(error) },
						    })
						  }
						</script>
						
					
					    <li><!--네이버-->
	                    	<a id="naverIdLogin_loginBuutton" href="javascript:void(0)">
	                    	<img src="/img/btnG_naver.png" width="100" alt="네이버 로그인 버튼"/>
               					
		                <!--네이버-->
		                <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
		                <script>
							var naverLogin = new naver.LoginWithNaverId(
									{
										clientId: "4PtXLl4qAKOf3JMWWdNt", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
										callbackUrl: "http://localhost:8080/naverlogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
										isPopup: false,
										callbackHandle: true
									}
								);	
							
							naverLogin.init();
							window.addEventListener('load', function () {
								naverLogin.getLoginStatus(function (status) {
									if (status) {
										var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
							    		
										console.log(naverLogin.user); 
							    		
							            if( email == undefined || email == null) {
											alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
											naverLogin.reprompt();
											return;
										}
									} else {
										console.log("callback 처리에 실패하였습니다.");
									}
								});
							});
						</script>
				 </ul>
				 
            </fieldset>
            </form>
        </div>
      </div>
</body>
</html>
