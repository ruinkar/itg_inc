package inc.itgbbs.dao;

import inc.itgbbs.domain.LikeListDTO;

public interface IVoteDao {
	
	public int voteCheck(LikeListDTO likeListDTO);
	
	public void vote(LikeListDTO likeListDTO);
	
	public void unvote(LikeListDTO likeListDTO);
	
	public int voteCount(int anum);
}
