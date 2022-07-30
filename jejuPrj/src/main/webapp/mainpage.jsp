<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lowCO2.web.position" %>
<%@ page import= "java.sql.Connection"%>
<%@ page import= "java.sql.DriverManager"%>
<%@ page import= "java.sql.PreparedStatement"%>
<%@ page import= "java.sql.ResultSet"%>
<%@ page import= "java.sql.SQLException"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page import= "java.util.List"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("utf8");

	String kakao = request.getParameter("kakao");
	session.setAttribute("kakao", kakao);
%>  



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
  

</head>
<body>
  <header>
    <div class="inner">
      <div class="head-container">
        <div class="head-brand"><a href="/mainpage.jsp">저탄소 제주 여행</a></div>
        <div class="head-blog">
        	<!-- 로그인, 회원가입 부분 따로 추가하는 부분 -->
			<jsp:include page="account.jsp" flush="false" />
        </div>
      </div>
    </div>
  </header>
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
		
			<div class="skill"><a href="http://localhost:8080/mainpage.jsp?table=lodgment">
				<i class="fa-solid fa-bed skill-icon bed-style"></i>
				<div class="skill-title">
					<div class="skill-name">숙박 업소</div>
				</div>
			</div>
			
			<div class="skill"><a href="http://localhost:8080/mainpage.jsp?table=vegan_restaurant">
				<i class="fa-solid fa-seedling skill-icon seedling-style"></i>
				<div class="skill-title">
					<div class="skill-name">채식 식당</div></a>
				</div>
			</div>
			
			<div class="skill"><a href="http://localhost:8080/mainpage.jsp?table=vegan">
				<i class="fa-solid fa-lemon skill-icon cafe-style"></i>
				<div class="skill-title">
					<div class="skill-name">채식 카페</div></a>
				</div>
			</div>
			
			<div class="skill"><a href="http://localhost:8080/mainpage.jsp?table=charge">
				<i class="fa-solid fa-charging-station skill-icon charging-style"></i>
				<div class="skill-title">
					<div class="skill-name">전기차 충전소</div></a>
				</div>
			</div>
			
			<div class="skill"><a href="http://localhost:8080/mainpage.jsp?table=bike">
				<i class="fa-solid fa-bicycle skill-icon bicycle-style"></i>
				<div class="skill-title">
					<div class="skill-name">자전거 대여소</div></a>
				</div>
			</div>
			
		</div>
	</div>
</section>

  <section>
    <div class="inner">
      <div class="section-container">
        <div class="roadmap-container">
          <div class="roadmap-title">추천 목적지</div>
          <div class="arrow-container">
            <i class="fa-solid fa-angle-left arrow-prev"></i>
            <i class="fa-solid fa-angle-right arrow-next"></i>
          </div>
        </div>
        <ul class="class-list" style = "overflow-x: scroll; overflow-x: auto;">
        <!-- 데베 반복호출 -->        
<%	 		//테이블값 받아옴
			String table =  request.getParameter("table");
			session.setAttribute("table", table);
			
			if( table != null) {table = request.getParameter("table");}
			else {table = "tourist_destination";}
			
			//sql연결
			Connection conn = null;
			try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeju?serverTimezone=UTC", "root", "");
	            System.out.println("success");
	        } 
	        catch (Exception e) {
	            System.out.println("fail : " + e);
	            try {
	                conn.close();
	            } 
	            catch (SQLException e1) {   
	            	System.out.println(" SQLException fail : " + e1);
	            }
	        }
			
			String sql = String.format("select * from %s", table);
	        PreparedStatement pstmt = null;
	        List<position> info = new ArrayList<position>();
	        
	        try {
	            pstmt = conn.prepareStatement(sql);
	            ResultSet rs = pstmt.executeQuery();
	           	//카드 데이터 수만큼 생산
	            while (rs.next()) { %>
	            	
		           	<li class="class-card">
		 		      <div class="class-container">
		 		        <div class="class-maintitle"><%= rs.getString("제목")%></div>
		 		        <div class="class-subtitle" style ="word-break:break-all;"><%= rs.getString("지번주소")%></div>
		 		      </div></li>   	
<% 	            }
	            pstmt.close(); 
	        } catch (Exception e) {
	            System.out.println("select method error : " + e);
	        }    finally {
	            try {
	                if(pstmt!=null && !pstmt.isClosed()) {
	                    pstmt.close();
	                }
	            } catch (Exception e2) {}
	        } %>
        </ul>
      </div>
    </div>
  </section>
  
  <!--footer를 넣을 예정-->
  <footer></footer>

  <!--<script src="js/main.js"></script>-->
</body>
</html>
