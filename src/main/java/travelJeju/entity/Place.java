package travelJeju.entity;

import java.util.Date;

public class Place {
	private double longtitude;  //경도
	private double latitude; //위도
	private String placeName; //장소이름
	private Date regdate; //일자
	private String placetype; //장소타입

	
	public Place(double lon, double lan, String title, String reserverName, Date regdate, String placetype, String files, String content) {
		this.longtitude=lon;
		this.latitude = lan;
		this.placeName = title;
		this.regdate = regdate;
		this.placetype = placetype;
	}
	
	public String getTitle() {
		return placeName;
	}

	public void setTitle(String title) {
		this.placeName = title;
	}

	
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getplacetype() {
		return placetype;
	}

	public void setplacetype(String placetype) {
		this.placetype = placetype;
	}	
}
