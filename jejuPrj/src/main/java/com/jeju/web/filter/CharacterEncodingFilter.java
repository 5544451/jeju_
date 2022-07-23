package com.jeju.web.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, 
			ServletResponse arg1, 
			FilterChain arg2)
			throws IOException, ServletException {

		arg0.setCharacterEncoding("UTF-8");
		arg2.doFilter(arg0, arg1);
		System.out.println("after filter");
	}

}
