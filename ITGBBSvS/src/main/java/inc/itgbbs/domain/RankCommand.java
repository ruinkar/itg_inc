package inc.itgbbs.domain;

// rank page용 클래스
public class RankCommand {
	private String id;
	private String nick; // 닉네임
	private String thumbnail; // 섬네일(등록사진)
	private int mpoint; // 회원포인트
	private float avgrat; // 평가점수

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public float getAvgrat() {
		return avgrat;
	}

	public void setAvgrat(float avgrat) {
		this.avgrat = avgrat;
	}

	
	@Override
	public String toString() {

		String[] MEMBER = { 
				"id", 		// 아이디
				"nick", 	// 닉네임
				"thumbnail",// 섬네일(등록사진)
				"mpoint",	// 회원포인트
				"avgrat" 	// 평점
				};

		Object[] values = { 
				id, 
				nick, 
				thumbnail, 
				mpoint, 
				avgrat
				};

		StringBuffer result = new StringBuffer("{");
		for (int i = 0; i < MEMBER.length; i++) {
			result.append("\"");
			result.append(MEMBER[i]);
			result.append("\":\"");
			result.append(String.valueOf(values[i]));
			result.append("\"");
			result.append(i < MEMBER.length - 1 ? ", " : "}");
		}

		return result.toString();
	}
}
