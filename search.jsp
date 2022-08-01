<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.jeju.web.bicycleControll" %>
<%@ page import="travelJeju.entity.Place" %>
<%@ page import="java.util.ArrayList" %>
<
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7lvfe751ip&submodules=geocoder"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>

<body>
<%
ArrayList<Place> places = new ArrayList<>();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 검색 성공!!");
}catch(ClassNotFoundException e){
	System.out.println("드라이버 검색 실패!");
}
Connection con = null;
String url = "jdbc:mysql://localhost:3306/jeju";
String user = "root";
String pass = "0821";
try{
	con = DriverManager.getConnection(url,user,pass);
	System.out.println("My-SQL 접속 성공!!");
}catch(SQLException e){//DB 관련 에러는 모두 이렇게 처리
	System.out.println("My-SQL 접속 실패");
}
	
PreparedStatement ps = null;// 동적 쿼리를 이용해 보기
ResultSet rs = null;        // 데이터 주소값 이용하기 위함
String sql = "select * from 자전거대여소 ";
	
try{
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery(); // 쿼리문이 select 로 시작되면 무조건
	while(rs.next()){
		String placename = rs.getString("placename");//name 필드의 데이터
		String address = rs.getString("address"); // 주소 필드
		double latitude = rs.getDouble("longtitude"); // 위도
		double longtitude = rs.getDouble("latitude"); // 경도
		places.add(new Place(longtitude,latitude,placename,address));
	}
	
	}catch(SQLException e){
		e.printStackTrace();
	}
for(Place ex : places)
{
	System.out.println("why"+ex.placename+ex.latitude+ex.longtitude);
}
%>
<c:set var="items" value="<%=places%>"></c:set>
<div class="search">
	<input id="address" type="text" placeholder="검색할 주소">
	<input id="submit" type="button" value="주소검색">
</div>
<!-- 네이버 지도가 뿌려질 곳 !  -->
<div id="map" style="width:100%;height:75vh; margin: 0 auto;"></div>
<div>
	<table>
		<thead>
			<tr>
				<th>주소</th>
				<th>위도</th>
				<th>경도</th>
			</tr>	
		</thead>
		<tbody id="mapList"></tbody>
	</table>
</div>
</body>

<script type="text/javascript">
//지도를 그려주는 함수 실행
$(function() {
	selectMapList();
});
function initMap() { 
	
	var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
	<c:forEach items= "${items}" var="item">
		areaArr.push({location : '${item.address}' , lat : '${item.latitude}'  , lng :'${item.longtitude}'});
	</c:forEach>	

	
	
	
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	
	
	
	for (var i = 0; i < areaArr.length; i++) {
		// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

	    var marker = new naver.maps.Marker({
	        map: map,
	        title: areaArr[i].location, // 지역구 이름 
	        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
	    });
	    
	    /* 정보창 */
		 var infoWindow = new naver.maps.InfoWindow({
		     content: '<div style="width:250px;text-align:center;padding:10px;"><b>' + areaArr[i].location + '</b><br> - 자전거 대여소 - </div>'
		 }); // 클릭했을 때 띄워줄 정보 HTML 작성
	    
		 markers.push(marker); // 생성한 마커를 배열에 담는다.
		 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}
    
	 
    function getClickHandler(seq) {
		
            return function(e) {  // 마커를 클릭하는 부분
                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker); // 표출
                }
    		}
    	}
    
    for (var i=0, ii=markers.length; i<ii; i++) {
    	console.log(markers[i] , getClickHandler(i));
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
    }
}

//검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }
        if (response.v2.meta.totalCount === 0) {
            return alert('올바른 주소를 입력해주세요.');
        }
        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);
        if (item.roadAddress) {
            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
        }
        if (item.jibunAddress) {
            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }
        if (item.englishAddress) {
            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
        }

        insertAddress(item.roadAddress, item.x, item.y);
        
    });
}

// 주소 검색의 이벤트
$('#address').on('keydown', function(e) {
    var keyCode = e.which;
    if (keyCode === 13) { // Enter Key
        searchAddressToCoordinate($('#address').val());
    }
});
$('#submit').on('click', function(e) {
    e.preventDefault();
    searchAddressToCoordinate($('#address').val());
});
naver.maps.Event.once(map, 'init_stylemap', initGeocoder);


    
//검색정보를 테이블로 작성해주고, 지도에 마커를 찍어준다.
function insertAddress(address, latitude, longitude) {
	var mapList = "";
	mapList += "<tr>"
	mapList += "	<td>" + address + "</td>"
	mapList += "	<td>" + latitude + "</td>"
	mapList += "	<td>" + longitude + "</td>"
	mapList += "</tr>"

	$('#mapList').append(mapList);	

	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(longitude, latitude),
	    zoom: 14
	});
	var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
	<c:forEach items= "${items}" var="item">
		areaArr.push({location : '${item.address}' , lat : '${item.latitude}'  , lng :'${item.longtitude}'});
	</c:forEach>	

	
	
	
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	
	
	
	for (var i = 0; i < areaArr.length; i++) {
		// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

	    var marker = new naver.maps.Marker({
	        map: map,
	        title: areaArr[i].location, // 지역구 이름 
	        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
	    });
	    
	    /* 정보창 */
		 var infoWindow = new naver.maps.InfoWindow({
		     content: '<div style="width:250px;text-align:center;padding:10px;"><b>' + areaArr[i].location + '</b><br> - 자전거 대여소 - </div>'
		 }); // 클릭했을 때 띄워줄 정보 HTML 작성
	    
		 markers.push(marker); // 생성한 마커를 배열에 담는다.
		 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}
    
	 
    function getClickHandler(seq) {
		
            return function(e) {  // 마커를 클릭하는 부분
                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker); // 표출
                }
    		}
    	}
    
    for (var i=0, ii=markers.length; i<ii; i++) {
    	console.log(markers[i] , getClickHandler(i));
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
    }
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(longitude, latitude),
    });
    
}

//지도를 그려주는 함수
function selectMapList() {
	
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 5
	});
	
	
}


// 지도를 이동하게 해주는 함수
function moveMap(len, lat) {
	var mapOptions = {
		    center: new naver.maps.LatLng(len, lat),
		    zoom: 15,
		    mapTypeControl: true
		};
    var map = new naver.maps.Map('map', mapOptions);
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(len, lat),
        map: map
    });
}
</script>
</html>