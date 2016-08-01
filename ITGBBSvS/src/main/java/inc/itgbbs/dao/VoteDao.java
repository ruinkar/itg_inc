package inc.itgbbs.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import inc.itgbbs.domain.LikeListDTO;

@Component
public class VoteDao extends SqlSessionDaoSupport implements IVoteDao {

	// 이미 추천했는지 확인
	@Override
	public int voteCheck(LikeListDTO likeListDTO) {
		return getSqlSession().selectOne("Vote.voteCheck", likeListDTO);
	}

	// 추천 등록
	@Override
	public void vote(LikeListDTO likeListDTO) {
		getSqlSession().insert("Vote.vote", likeListDTO);
	}

	@Override
	public void unvote(LikeListDTO likeListDTO) {
		getSqlSession().delete("Vote.unvote", likeListDTO);
	}

	// 전체 추천 수 가져오기
	@Override
	public int voteCount(int anum) {
		return getSqlSession().selectOne("Vote.voteCount", anum);
	}


}
