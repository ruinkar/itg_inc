package inc.itgbbs.dao;

import java.util.List;
import java.util.Map;

import inc.itgbbs.domain.FreeBoardDTO;

public interface FreeBoardDao {
	// 1.글목록보기->페이징처리+검색분야,검색어(검색어)
	public List<FreeBoardDTO> list(Map<String, Object> map);

	// 2.총레코드수
	public int getRowCount(Map<String, Object> map);

	// 3.최대 글번호 구하기
	public int getNewSeq();

	// 4.게시판의 글쓰기
	public void insert(FreeBoardDTO board);

	// 5. 글상세보기
	public FreeBoardDTO selectBoard(int anum);
	public void update(int anum);
	
	// 6. 글수정하기
	public void updateBoard(FreeBoardDTO board);
}
