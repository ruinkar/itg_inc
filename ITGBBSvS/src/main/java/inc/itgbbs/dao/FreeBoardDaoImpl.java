package inc.itgbbs.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;


import inc.itgbbs.domain.FreeBoardDTO;


public class FreeBoardDaoImpl extends SqlSessionDaoSupport 
                                         implements FreeBoardDao {

	//글목록보기->검색어를 입력하고 검색X->페이징 처리만(start,end)
	public List<FreeBoardDTO> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<FreeBoardDTO> list=getSqlSession().selectList("Board.selectList",map);
		return list;
	}
     //검색어에 해당하는 총레코드수->검색어X->무조건 총레코드수만 구함
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Board.selectCount",map);
	}
	
	public int getNewSeq() {
		// TODO Auto-generated method stub
		//Object->Integer->int
		int newseq=(Integer)getSqlSession().selectOne("Board.getNewSeq");
		System.out.println("getNewSeq()의 newseq="+newseq);
		return newseq;
	}
	//insert,update,delete->반환값 없다.
	public void insert(FreeBoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().insert("Board.insertBoard",board);
	}
	
	@Override
	public FreeBoardDTO selectBoard(int anum) {
		// TODO Auto-generated method stub
		System.out.println("selectBoard() 메서드 호출");
		FreeBoardDTO freeBoardDTO = (FreeBoardDTO)getSqlSession().selectOne("Board.selectBoard", anum);
		return freeBoardDTO;
	}
	@Override
	public void update(int anum) {
		// TODO Auto-generated method stub
		getSqlSession().update("Board.updateHit", anum);
		System.out.println("updateHit() 메서드 호출");
	}
	
	@Override
	public void updateBoard(FreeBoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().update("Board.updateBoard", board);
	}
	
	@Override
	public void deleteBoard(int anum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("Board.deleteBoard", anum);
		System.out.println("deleteBoard() 메서드 호출");
	}
	
	@Override
	public void insertReply(FreeBoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().insert("Board.insertReply", board);
		System.out.println("insertReply() 메서드 호출");
	}
	@Override
	public List<FreeBoardDTO> repliesList(int anum) {
		// TODO Auto-generated method stub
		List<FreeBoardDTO> list=getSqlSession().selectList("Board.repliesList",anum);
		return list;
	}
	@Override
	public int getReplyCount(int pnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Board.getReplyCount", pnum);
	}
	
	@Override
	public int getVoteCount(int anum) {
		return getSqlSession().selectOne("Board.votecount", anum);
	}
	
	@Override
	public int insertVote(String id) {
		return getSqlSession().insert("Board.insertVote", id);
	}
}

