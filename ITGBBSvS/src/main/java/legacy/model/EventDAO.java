package legacy.model;

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
