package com.jeju.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


class DBControll {
	
	    private Connection conn; //DB 커넥션 연결 객체
	    private static String USERNAME ;//DBMS접속 시 아이디
	    private static String PASSWORD;//DBMS접속 시 비밀번호
	    private static String URL;//DBMS접속할 db명
	    
	    public DBControll() {
	    	USERNAME = "root";
	    	PASSWORD = "root";
	    	URL = "jdbc:mysql://localhost:3306/jeju";
	    	
	        try {
	            System.out.println("DBControll()"+ URL);
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	            System.out.println("success");
	        } 
	        catch (Exception e) {
	            System.out.println("fail");
	            try {
	                conn.close();
	            } 
	            catch (SQLException e1) {   
	            	System.out.println(" SQLException fail" + e1);
	            }
	        }
	    }
	    //db에 데이터 삽입하는 메서드
	    public void insertDB(String[] mem){
	        //쿼리문 준비
	        String sql = "insert into member values(?,?,?,?,?)";
	        
	        PreparedStatement pstmt = null;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, mem[0]);
	            pstmt.setString(2, mem[1]);
	            pstmt.setString(3, mem[2]);
	            pstmt.setString(4, mem[3]);
	            pstmt.setString(5, mem[4]);
	            int result = pstmt.executeUpdate();
	            if(result==1) {
	                System.out.println("data insert success!");
	                conn.close();
	            }
	            
	        } catch (Exception e) {
	            System.out.println("data insert fail!"+ e);
	        }    finally {
	            try {
	                if(pstmt!=null && !pstmt.isClosed()) {
	                    pstmt.close();
	                }
	            } catch (Exception e2) {}
	        }
	    }
	    
	    //1행만 가져오는 메서드
		public String[] selectOne(String id) {
	        String sql = "select * from member where id = ?";
	        PreparedStatement pstmt = null;
	        String[] info = new String[5];
	        
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);
	            ResultSet rs = pstmt.executeQuery();
	            if(rs.next()) {
	            	info[0] = rs.getString("name");
	            	info[1] = rs.getString("id");
	            	info[2] = rs.getString("password");
	            	info[3] = rs.getString("email");
	            	info[4] = rs.getString("list");    
	            }
	            
	        } catch (Exception e) {
	            System.out.println("select 메서드 예외발생" + e);
	        }    finally {
	            try {
	                if(pstmt!=null && !pstmt.isClosed()) {
	                    pstmt.close();
	                }
	            } catch (Exception e2) {}
	        }

	        return info;
	    }
	    
	  
		//조건에 맞는 행을 DB에서 수정(갱신)    하는 메서드
	    public void updateDB(String id) {
	        String sql = "update member set name =?, password =?, email =?, list =? where id=?";
	        PreparedStatement pstmt = null;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1,"name");
	            pstmt.setString(2,id);
	            pstmt.setString(3,"password");
	            pstmt.setString(3,"email");
	            pstmt.setString(3,"list");
	            pstmt.executeUpdate();
	        } catch (Exception e) {
	            System.out.println("update 예외 발생");
	        }    finally {
	            try {
	                if(pstmt!=null && !pstmt.isClosed()) {
	                    pstmt.close();
	                }
	            } catch (Exception e2) {}
	        }
	    }
}
