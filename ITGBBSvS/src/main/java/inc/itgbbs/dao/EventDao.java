package inc.itgbbs.dao;

import java.util.List;
import java.util.Map;

import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.EventDTO;

public interface EventDao {
   //1.글목록보기->페이징처리+검색분야,검색어(검색어)
   public List<EventDTO> list(Map<String,Object> map);
   //2.총레코드수
   public int getRowCount(Map<String,Object>map);

   
   //6.조회수 증가
   public void updateReadCount(Integer anum);
  // 이벤트 정보 가져오기
   public BoardDTO selectboard(Integer anum);
   public EventDTO selectevent(Integer anum);
 //6.덧글 갯수 확인
   public Integer getReplyCount(Integer anum);
   //6.덧글 갯수 가져오기
   public List<BoardDTO> getReplies(Integer anum);
   
   
}

