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

@WebServlet("/notice/store")
public class CarbonEmission extends HttpServlet {

	double total_carbonEmmission =0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Place> openPlaces = new ArrayList<>();
		openPlaces = (List<Place>) request.getAttribute("placelist"); //리스트 값 받아오기
		double totalDistance = (double) request.getAttribute("total_distance"); // 거리 얻어오기 
		total_carbonEmmission += totalDistance*91.4 ; // 거리에 따른 탄소 배출=> 1km 당 91.4kg 탄소 배출
		for(Place openPlace : openPlaces) {
			if((openPlace.getplacetype()).equals("음식점"))
				total_carbonEmmission+=3.0; // 4인 기구 기준 3kg 탄소 배출
			System.out.printf("openPlace : %s\n",openPlace); //장소 전체 출력
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(total_carbonEmmission);
		request.setAttribute("output", total_carbonEmmission);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/notice/store.jsp");
		dispatcher.forward(request, response);

		
	}
}
