package travelJeju.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calculate.do")
public class CalculateDistance extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		double longtitude_1 =Double.parseDouble(request.getParameter("x1"));
		double latitude_1 =Double.parseDouble(request.getParameter("y1"));
		double longtitude_2 =Double.parseDouble(request.getParameter("x2"));
		double latitude_2 =Double.parseDouble(request.getParameter("y2"));
		 
        // 마일(Mile) 단위
        double distanceMile =
            distance(longtitude_1, latitude_1, longtitude_2, latitude_2, "");
         
        // 미터(Meter) 단위
        double distanceMeter =
        	distance(longtitude_1, latitude_1, longtitude_2, latitude_2, "meter");
         
        // 킬로미터(Kilo Meter) 단위
        double distanceKiloMeter =
        	distance(longtitude_1, latitude_1, longtitude_2, latitude_2, "kilometer");
         
        if(distanceMile<1000)
        	request.setAttribute("distance", distanceMile);// 두 지점간의 거리 보내기
        else if(distanceMeter<1000)
			request.setAttribute("distance", distanceMeter);
		else
			request.setAttribute("distance", distanceKiloMeter);
        
		request.getRequestDispatcher("/store.jsp")
		.forward(request, response);
         
         
    }
              
    /**
     * 두 지점간의 거리 계산
     *
     * @param lat1 지점 1 위도
     * @param lon1 지점 1 경도
     * @param lat2 지점 2 위도
     * @param lon2 지점 2 경도
     * @param unit 거리 표출단위
     * @return
     */
    private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
         
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
 
        return (dist);
    }
     
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
	
		

		
}

