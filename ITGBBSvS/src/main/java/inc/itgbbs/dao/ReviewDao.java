package inc.itgbbs.dao;

import java.util.List;
import java.util.Map;

import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.ReviewAllDTO;
import inc.itgbbs.domain.ReviewDTO;

public interface ReviewDao {
   //1.글목록보기->페이징처리+검색분야,검색어(검색어)
   public List<BoardDTO> list(Map<String,Object> map);
   //2.총레코드수
   public int getRowCount(Map<String,Object>map);
 //2.랭크 보기
   public List<BoardDTO> rankList();
   
   //5.글 상세보기
   public ReviewAllDTO selectReview(Integer anum);
   // 이벤트 정보 불러오기
   public ReviewAllDTO selectRating(Integer anum);
   //6.조회수 증가
   public void updateReadCount(Integer anum);
  
   //6.덧글 갯수 확인
   public Integer getReplyCount(Integer anum);
   //6.덧글 갯수 가져오기
   public List<BoardDTO> getReplies(Integer anum);
   
   //3.최대 글번호 구하기
   public int getNewAnum();
   //4.게시판의 글쓰기 ( board )
   public void insertReview (BoardDTO board);
   //4.게시판의 글쓰기 ( review )
   public void insertRating (ReviewDTO review);
   // 이벤트 검색 카운트 불러오기
   public Integer getEventCount ( Map<String,Object>map);
   // 이벤트 검색 리스트 불러오기
   public List<BoardDTO> getEventList ( Map<String,Object>map);
   // 글 수정하기
   public void updateReview ( BoardDTO board);
   public void updateRating (ReviewDTO review);
   
   // 글 얻어오기
  public BoardDTO getBoard ( Integer anum);
  public void deletereply ( Integer anum);
  public void deleteBoard ( Integer anum);
  
  // 댓글달기
  public void insertReply (BoardDTO board);
  
  // 댓글 삭제
  public void deleteReply(Integer anum);
/*   
   
   //4.게시판의 글쓰기
   public void insert(BoardCommand board);
   
   //5.글 상세보기
   public BoardCommand selectBoard(int seq);
  
   //6.조회수 증가
   public void updateHit(int seq);
   
   //7.글 수정하기
   public void update(BoardCommand board);
   
   //8.글 삭제하기
   public void delete(Integer seq);*/
}

