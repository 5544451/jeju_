package com.jeju.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class Log extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charest=UTF-8");
		
		String id = request.getParameter("user-id");
		String pwd = request.getParameter("user-pwd");
		
		String kakao =  "";
		String naver = "";		
		
		kakao = request.getParameter("kakaonickname");
		naver = request.getParameter("navernickname");
		
		response.getWriter().printf(id);
		
	}
}
