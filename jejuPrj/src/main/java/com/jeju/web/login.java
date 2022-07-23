package com.jeju.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class login extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie cookies[] = request.getCookies();
		//세션 == 현재 접속자마다 접속 공간이 달라진다
		
		String id = request.getParameter("user-id");
		String pwd = request.getParameter("user-pwd");
		
		
		String exp = "";
		//기존에 있는 쿠키 읽어옴
		if( cookies !=null)
		{
			for(Cookie c : cookies) 
				if(c.getName().equals("exp")){
					exp = c.getValue();
					break;}			
		}
		
		
		response.sendRedirect("calcpage");
		
	}
}