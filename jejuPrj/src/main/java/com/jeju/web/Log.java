package com.lowCO2.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/mainpage")
public class LogIn extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException
    {
		//쓰고 읽기에 한글가능하도록 ㅇㅣㄴ코딩
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String[] mem = new String[5];
		HttpSession session = req.getSession();
		
		
		String id = req.getParameter("user-id");
		String psd = req.getParameter("user-pwd");
		
		DBControll DBcon = new DBControll();
		mem = DBcon.selectOne(id, "member");

		//쿼리문 준비

		if(psd.equals(mem[2]))
		{
			session.setAttribute("comN", id);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mainpage.jsp");
		dispatcher.forward(req, response);
		
    }
}
