package com.jeju.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sign")
public class member extends HttpServlet{
	@Override
	protected void service (HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException
    {
		//쓰고 읽기에 한글가능하도록 ㅇㅣㄴ코딩
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String[] mem = new String[5];
		//req.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		
		String nick =  String.valueOf(req.getParameter("su_nickname"));
		String id =  String.valueOf(req.getParameter("su_id"));
		String pwd =  String.valueOf(req.getParameter("su_pwd"));
		String chkPwd =  String.valueOf(req.getParameter("pwd_chk"));
		String email =  String.valueOf(req.getParameter("su_mail"));
		String email_ =  String.valueOf(req.getParameter("mailing"));
		
		mem[0] = nick;
		mem[1] = id;
		mem[2] = pwd;
		mem[3] = chkPwd;
		mem[4] = email; 
		
		DBControll DBcon = new DBControll();
		
		for(int i =0; i<5; i++)
		{
			System.out.println(mem[i]);
		}
		DBcon.insertDB(mem);
		
		
		if(pwd == chkPwd) { 
			req.setAttribute("id",id); 
			RequestDispatcher dispatcher = req.getRequestDispatcher("signup.jsp"); 
			dispatcher.forward(req, response); 
		}
		else { 
			RequestDispatcher dispatcher = req.getRequestDispatcher("signup.jsp");
			dispatcher.forward(req, response); 
		}
		
		
    }
}
