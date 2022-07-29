package travelJeju.service;

import java.util.List;

import travelJeju.entity.Place;

public class NoticeService {
	public List<Place> getNoticelist(){
		
		return getNoticelist("title","", 1);
	}
	public List<Place> getNoticelist(int page){
		
		return getNoticelist("title","", page);
	}
	public List<Place> getNoticelist(String field, String query, int page){
	
		String sql = "SELECT* FROM( SELECT ROWMNUM NUM,N.* FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) N )";
		return null;
	}
	public int getNoticeCount()
	{
		return getNoticeCount("title","");
	}
	public int getNoticeCount(String field, String query) {
		return 0;
	}
	public Place getNotice(int id) {
		return null;
	}
	public Place getNextNotice(int id)
	{
		return null;
	}
	
	public Place getPrevNotice(int id)
	{
		return null;
	}
}
