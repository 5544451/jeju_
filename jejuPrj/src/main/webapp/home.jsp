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
                <li>    
   <%
        String navername = request.getParameter("navername");
        String kakaonickname = request.getParameter("kakaonickname");
        
        session.setAttribute("navername", navername);
        session.setAttribute("kakaonickname", kakaonickname);
        
        
        if (navername == null && kakaonickname == null) {
    %>
        guest님 방문을 환영합니다.
    <%
        } else if (navername != null){
    %>
    <%=" (네이버) "+session.getAttribute("navername")%>님 방문을 환영합니다.
    <form action ="naver_logout.do" method = "post">
    <button type = "submit" name = "submit" >로그아웃</button>
    </form>
    
    <%    
        } else if (kakaonickname != null){
    %>
    
    <%=session.getAttribute("kakaonickname")%>님의 방문을 환영합니다.
    
    <form action = "kakao_logout.do" method = "post">
    <button type = "submit" name = "submit">로그아웃</button></form>
    
    <%
        };
        
    %>

            </ul>      
            <hr>      
        </nav>
    </div>
</body>
</html>
