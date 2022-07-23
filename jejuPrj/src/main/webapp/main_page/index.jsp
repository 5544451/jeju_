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
    <!-- <link rel="stylesheet" href="css/register.css"> -->
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
            <!-- <img src="/img/저탄소여행.png" width="300" style="text-align: center" > -->
            <form action="login" method="post">
                <fieldset>
                    <ul>
                        <li>
                            <label for="user-id"> 아이디 </label>
                            <input type="text" name="user-id" autofocus placeholder="아이디 입력" required/>
                        </li>
                        <li>
                            <label for="user-pwd"> 비밀번호 </label>
                            <input type="password" name="user-pwd" placeholder="비밀번호 입력" required/>
                        </li>  
                        <br>
                    <div id="buttons">
                        <input type="submit" value="로그인""/>
                        <a href="#none" class="close">&times;</a>
                    </div>
                    <div style="font-size: 15px; text-align : center;">
                        <p>아이디가 없으신가요? <a href="signup.jsp">회원가입</a></p>                      
                    </div>
                <div style="text-align: center;">   
                    <br><p style="font-size : 13px"> SNS 계정으로 로그인</p><hr>
                    <!-- 카카오 로그인 -->
                    <a id="custom-login-btn" href="javascript:loginWithKakao()">
                        <img
                        src="/img/kakao_login_large.png"
                        width="80"
                        alt="카카오 로그인 버튼"
                    />
                    </a>
                    <script type="text/javascript">
                        function loginWithKakao() {
                            Kakao.Auth.login({
                            success: function(authObj) {
                                alert(JSON.stringify(authObj))
                            },
                            fail: function(err) {
                                alert(JSON.stringify(err))
                            },
                            })
                        }
                    </script>
                    </a>
                    <!--네이버-->
                    <a id="custom-login-btn" href="javascript:loginWithKakao()">
                        <img
                        src="/img/btnG_naver.png"
                        width="100"
                        alt="네이버 로그인 버튼"/>
                    <script type="text/javascript" 
                    src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"charset="utf-8"></script>
                </div>  
                </fieldset>
            </form>
        </div>
      </div>
</body>
</html>