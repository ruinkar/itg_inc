package model;

import java.util.ArrayList;
import java.util.List;

public class RankDAO {
	final String SQL_RANK_VIEW = "select * from member order by mpoint desc";
	
	DBConnectionMgr pool = null;
	
	public RankDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.printf("pool = %s%n", pool);
		} catch (Exception e) {
			System.out.printf("DBConnectionMgr error: %s%n", e);
		}
	} // constructor
	
	public List getHighRank() {
		List list = new ArrayList<MemberDTO>();
		
		
		
		return list;
	}
	
	public List getOthers(int pageNum) {
		List list = new ArrayList<MemberDTO>();

		
		
		return list;
	}
}
