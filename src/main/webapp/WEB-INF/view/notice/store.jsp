<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="travelJeju.controller.CarbonEmission"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="CalculateDistance.jsp" method="post">
		<input name="x1">
		<input name="y1">
		<input name="x2">
		<input name="y2">		
		<td><input type="text" name="distance" value="<%=request.getAttribute("distance")%>"></td>  <!-- 거리 값 받아오기 -->	
		<%! double total_distance =0;%>
		<% total_distance +=(double) request.getAttribute("distance"); %>
		</form>
	 
	<form action="CarbonEmission.jsp" method="post">
		<input name="total_distance" value= total_distance>
		<button type="submit" class="btn btn-default">
		<td><input type="text" name="carbon" value="<%=request.getAttribute("output")%>"></td> <!-- 탄소 배출량 받아오기 -->
	
	</form>
</body>
</html>