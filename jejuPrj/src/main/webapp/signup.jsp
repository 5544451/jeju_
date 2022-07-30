<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <style>
        #container{
            width: 800px;
            margin: 10px auto;
        }
    </style>
    <link href="/main.css" rel="stylesheet">
</head>
<body>
    <div id="container">
        <h1>회원 가입을 환영합니다</h1>
        <h5>저탄소 제주 여행 길잡이의 회원가입 페이지 입니다. 여행일정 기능을 이용하실 예정이라면 간단한 회원가입을
            진행해주세요.
        </h5>
        <form action="sign" method="post">
	        <fieldset>
	            <legend>사용자 정보</legend>
		            <ul>
		                <li>
		                    <label for="su_nickname"> 닉네임 </label>
		                    <input type="text" name="su_nickname" required/>
		                </li>
		                <li>
		                    <label for="su_id"> 아이디 </label>
		                    <input type="text" name="su_id" autofocus placeholder="4자 ~ 10자 사이, 공백없이" required/>
		                </li>
		                <li>
		                    <label for="su_pwd"> 비밀번호 </label>
		                    <input type="password" name="su_pwd" placeholder="문자와 숫자, 특수 기호 포함" required/>
		                </li>
		                <li>
		                    <label for="pwd_chk"> 비밀번호 확인 </label>
		                    <input type="password" name="pwd_chk" placeholder="위 비밀번호와 동일한 비밀번호 입력" required/>
		                </li>
		                <li>
		                    <label for="su_mail"> 이메일 </label>
		                    <input type="email" name="su_mail" required/>
		                </li>
	            	</ul>
	        </fieldset>
            <fieldset>
                <legend>작성된 일정 이메일로 수신 동의</legend>
                <input type="radio" id="mailing" id="mailing_y" checked>
                <label for="mailing_y">메일 수신 동의</label>
                <input type="radio" id="mailing" id="mailing_n" >
                <label for="mailing_n">메일 수신 동의하지 않음</label>
            </fieldset>
        <div id="buttons">
            <input type="submit" value="회원가입"/>
            <a href="mainpage.jsp"><input type="button" value="돌아가기"> </a>
        </div>
        </form>
    </div>
</body>
</html>
