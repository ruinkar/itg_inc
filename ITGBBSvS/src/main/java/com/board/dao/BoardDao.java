package com.board.dao;

import java.util.List;
import java.util.Map;

import com.board.domain.BoardCommand;

public interface BoardDao {
   //1.글목록보기->페이징처리+검색분야,검색어(검색어)
   public List<BoardCommand> list(Map<String,Object> map);
   //2.총레코드수
   public int getRowCount(Map<String,Object>map);
   
   //3.최대 글번호 구하기
   public int getNewSeq();
   
   //4.게시판의 글쓰기
   public void insert(BoardCommand board);
   
   //5.글 상세보기
   public BoardCommand selectBoard(int seq);
  
   //6.조회수 증가
   public void updateHit(int seq);
   
   //7.글 수정하기
   public void update(BoardCommand board);
   
   //8.글 삭제하기
   public void delete(Integer seq);
}

