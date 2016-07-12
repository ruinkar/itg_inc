package com.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.board.domain.BoardCommand;

public class BoardDaoImpl extends SqlSessionDaoSupport 
                                         implements BoardDao {

	//글목록보기->검색어를 입력하고 검색X->페이징 처리만(start,end)
	public List<BoardCommand> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardCommand> list=getSqlSession().selectList("selectList",map);
		return list;
	}
     //검색어에 해당하는 총레코드수->검색어X->무조건 총레코드수만 구함
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectCount",map);
	}
	
	public int getNewSeq() {
		// TODO Auto-generated method stub
		//Object->Integer->int
		int newseq=(Integer)getSqlSession().selectOne("getNewSeq");
		System.out.println("getNewSeq()의 newseq="+newseq);
		return newseq;
	}
	//insert,update,delete->반환값 없다.
	public void insert(BoardCommand board) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertBoard",board);
	}
	
	
	public BoardCommand selectBoard(int seq) {
		// TODO Auto-generated method stub
		BoardCommand boardCommand = (BoardCommand)getSqlSession().selectOne("selectBoard", seq);		
		return boardCommand;
	}
	
	
	public void updateHit(int seq) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateHit",seq);
	}
	public void update(BoardCommand board) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateBoard", board);
	}
	
	public void delete(Integer seq) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteBoard", seq);
	}
}

