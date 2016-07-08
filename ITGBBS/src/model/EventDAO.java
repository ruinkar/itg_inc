package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
	
	private final String LOG_TAG = "EventDAO";
	private DBConnectionMgr pool = null;
	
	public EventDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertEvent(EventDTO event) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = pool.getConnection();
			sql = "insert into event(evnum, eperm, host, ename, begin, end, location, eimg, lat, lng) values((select max(anum) from board),?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, event.getEperm());
			pstmt.setString(2, event.getHost());
			pstmt.setString(3, event.getEname());
			pstmt.setTimestamp(4, event.getBegin());
			pstmt.setTimestamp(5, event.getEnd());
			pstmt.setString(6, event.getLocation());
			pstmt.setString(7, event.getEimg());
			pstmt.setDouble(8, event.getLat());
			pstmt.setDouble(9, event.getLng());
			
			int insert = pstmt.executeUpdate();
			System.out.println(LOG_TAG + "insertBoard의 성공유무 = " + insert);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	public List getContents() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List contentList = null;
		EventDTO eventDTO = null;
		String sql = "";
		
		try {
			con = pool.getConnection();
			sql = "select * from event order by evnum desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				contentList = new ArrayList(12);
				
				do {
					eventDTO = makeFormResult(rs);
					contentList.add(eventDTO);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return contentList;
		
	}
	
	public EventDTO getContent(int evnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventDTO eventDTO = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from event where evnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, evnum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				eventDTO = makeFormResult(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		return eventDTO;
		
	}
	
	// 행사글 삭제하기
	public void deleteContent(int aNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "delete from event where evnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, aNum);

			int delete = pstmt.executeUpdate();
			System.out.println(LOG_TAG + ", deleteContent 성공여부 = " + delete);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}
	
	//행사글 수정하기
		public void modifyContent(EventDTO eventDTO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			try {
				con = pool.getConnection();
				sql = "update event set host=?, ename=?, begin=?, end=?, location=?, eimg=?, lat=?, lng=? where evnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, eventDTO.getHost());
				pstmt.setString(2, eventDTO.getEname());
				pstmt.setTimestamp(3, eventDTO.getBegin());
				pstmt.setTimestamp(4, eventDTO.getEnd());
				pstmt.setString(5, eventDTO.getLocation());
				pstmt.setString(6, eventDTO.getEimg());
				pstmt.setDouble(7, eventDTO.getLat());
				pstmt.setDouble(8, eventDTO.getLng());
				pstmt.setInt(9, eventDTO.getEvnum());
				
				int update = pstmt.executeUpdate();
				System.out.println(LOG_TAG +", modifyContent의 성공 유무 체크 : " + update);
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
		}
	
	
	private EventDTO makeFormResult(ResultSet rs) throws Exception {
		EventDTO eventDTO = new EventDTO();
		eventDTO.setEvnum(rs.getInt("evnum"));
		eventDTO.setEperm(rs.getInt("eperm"));
		eventDTO.setHost(rs.getString("host"));
		eventDTO.setEname(rs.getString("ename"));
		eventDTO.setBegin(rs.getTimestamp("begin"));
		eventDTO.setEnd(rs.getTimestamp("end"));
		eventDTO.setLocation(rs.getString("location"));
		eventDTO.setEimg(rs.getString("eimg"));
		eventDTO.setLat(rs.getDouble("lat"));
		eventDTO.setLng(rs.getDouble("lng"));
		
		return eventDTO;
		
	}

}
