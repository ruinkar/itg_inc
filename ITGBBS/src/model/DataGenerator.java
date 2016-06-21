package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import java.util.Scanner;

public class DataGenerator implements etc.KeyArchive{
	
	DBConnectionMgr pool = null;
	
	private final String[] DTO = {
			"AdminList",
			"Board",
			"Event",
			"LikeList",
			"LoginInfo",
			"Member",
			"Msg",
			"Review"
	};
	
	
	private void menu(int cmd) {
		
		String query = queryGen(cmd);
		
		switch(cmd){
			case 0:
				break;
				
			case 1:
				break;
				
			case 2:
				break;
				
			case 3:
				break;
				
			case 4:
				break;
				
			case 5:
				break;
			
			case 6:
				break;
				
			case 7:
				break;
				
			default:
				break;
		}
	}
	
	private String queryGen(int cmd) {
		String query = "insert into " + DTO[cmd] + " ";
		
		for (int i = 0; i < KEYS[cmd].length; i++) {
			
		}
		
		return query;
	}
	
	private void insert(Object object) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int insert = 0;
		
		try{
			con = pool.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			insert = pstmt.executeUpdate();
			
			con.commit();
			
			con.setAutoCommit(true);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	private class Generator {
		
		Random rnd = new Random();
		
		int intGen(int length){
			int min = (int)Math.pow(10, length);
			int max = (int)Math.pow(10, length + 1);
			return new Random().nextInt(max - min) + min;
		}
		
		String strGen(int length){
			String result = "";
			int min, max;
			boolean cap;
			for (int i = 0; i < length; i++) {
				cap = rnd.nextBoolean();
				min = cap? 'A':'a';
				max = cap? 'Z':'z';
				char ch = (char)(rnd.nextInt(max - min + 1) + 'a');
				result += ch;
			}
			return result;
		}
	}
	
// ────────────────────────────────────────────────────────────────────────────────────────────────────
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DataGenerator dg = new DataGenerator();
		Scanner sc = new Scanner(System.in);
		
		System.out.println("원하는 테이블 입력");
		int cmd = sc.nextInt();
		
		dg.menu(cmd);
		
	}
}