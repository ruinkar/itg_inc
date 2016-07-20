package inc.itgbbs.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.EventDTO;

public class EventDaoImpl extends SqlSessionDaoSupport 
                                         implements EventDao {

	//글목록보기->검색어를 입력하고 검색X->페이징 처리만(start,end)
	public List<EventDTO> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<EventDTO> list=getSqlSession().selectList("Event.selectList",map);
		return list;
	}
     //검색어에 해당하는 총레코드수->검색어X->무조건 총레코드수만 구함
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Event.selectCount",map);
	}
	
	
	@Override
	public void updateReadCount(Integer anum) {
		// TODO Auto-generated method stub
		getSqlSession().update("Event.updateReadCount",anum);
	}
	@Override
	public Integer getReplyCount(Integer anum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Event.getReplyCount", anum);
	}
	@Override
	public List<BoardDTO> getReplies(Integer anum) {
		// TODO Auto-generated method stub
		List<BoardDTO> list=getSqlSession().selectList("Event.getReplies" , anum);
		return list;
	}
	@Override
	public BoardDTO selectboard(Integer anum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Event.selectboard",anum);
	}
	@Override
	public EventDTO selectevent(Integer anum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Event.selectevent",anum);
	}
	@Override
	public int getNewAnum() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Event.getNewAnum");
	}
	@Override
	public void insertBoard(BoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().insert("Event.insertBoard", board);
	}
	@Override
	public void insertEvent(EventDTO event) {
		// TODO Auto-generated method stub
		getSqlSession().insert("Event.insertEvent", event);
	}
	@Override
	public void updateboard(BoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().update("Event.updateboard" , board);
	}
	@Override
	public void updateevent(EventDTO event) {
		// TODO Auto-generated method stub
		getSqlSession().update("Event.updateevent" , event);
	}
	@Override
	public List<EventDTO> listmap() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("Event.selectmap");
	}
	
	/*public List<BoardDTO> rankList() {
		// TODO Auto-generated method stub
		List<BoardDTO> list=getSqlSession().selectList("Review.selectRank");
		return list;
	}
	@Override
	public ReviewAllDTO selectReview(Integer anum) {
		// TODO Auto-generated method stub
		ReviewAllDTO reviewAllDTO = (ReviewAllDTO)getSqlSession().selectOne("Review.selectReview", anum);		
		return reviewAllDTO;
	}
	
	@Override
	public ReviewAllDTO selectRating(Integer anum) {
		// TODO Auto-generated method stub
		ReviewAllDTO reviewAllDTO = (ReviewAllDTO)getSqlSession().selectOne("Review.selectRating", anum);		
		return reviewAllDTO;
	}
    
	
	@Override
	public void updateReadCount(Integer anum) {
		// TODO Auto-generated method stub
		getSqlSession().update("Review.updateReadCount",anum);
	}
	@Override
	public Integer getReplyCount(Integer anum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Review.getReplyCount", anum);
	}
	@Override
	public List<BoardDTO> getReplies(Integer anum) {
		// TODO Auto-generated method stub
		List<BoardDTO> list=getSqlSession().selectList("Review.getReplies" , anum);
		return list;
	}
	
	@Override
	public Integer getEventCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Review.getEventCount", map);
	}
	@Override
	public List<BoardDTO> getEventList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("Review.getEventList" , map);
	}
	@Override
	public void updateReview(BoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().update("Review.updateReview" , board);
		
	}
	@Override
	public void updateRating(ReviewDTO review) {
		// TODO Auto-generated method stub
		getSqlSession().update("Review.updateRating" , review);
	}
	@Override
	public BoardDTO getBoard(Integer anum) {
		// TODO Auto-generated method stub
		
		return getSqlSession().selectOne("Review.getBoard" , anum);
	}
	@Override
	public void deletereply(Integer anum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("Review.deletereply", anum);
	}
	@Override
	public void deleteBoard(Integer anum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("Review.deleteBoard", anum);
	}
	@Override
	public void insertReply(BoardDTO board) {
		// TODO Auto-generated method stub
		getSqlSession().insert("Review.insertReply", board);
	}
	@Override
	public void deleteReply(Integer anum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("Review.deleteBoard",anum);
	}*/
}

