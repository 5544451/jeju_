package travelJeju.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travelJeju.entity.Place;

@WebServlet("/carbon.do")
public class CarbonEmission extends HttpServlet {

	double total_carbonEmmission =0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Place> openPlaces = new ArrayList<>();
		openPlaces = (List<Place>) request.getAttribute("placelist"); //리스트 값 받아오기
		
		double totalDistance = (double) request.getAttribute("distance"); // 거리 얻어오기 
		total_carbonEmmission += totalDistance*91.4 ; // 거리에 따른 탄소 배출=> 1km 당 91.4kg 탄소 배출
		for(Place search : openPlaces)
		{
			if(search.placename.equals("음식점"))
				total_carbonEmmission += totalDistance*3 ; // 4인 가족 기준 3kg 배출량
				
		}
		System.out.println(total_carbonEmmission);
		request.setAttribute("output", total_carbonEmmission);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/maingpage.jsp");
		dispatcher.forward(request, response);

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}
}
