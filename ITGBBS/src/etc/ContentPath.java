package etc;

// WebContent 하위 폴더 목록입니다. ActionClass 생성시 구현항목에 넣어주시고, return 할 때 jsp주소 앞에 넣어주세요.
// 추후 폴더 이름 및 구조 변경시 불편함을 줄이기 위한 조치이니 꼭 참여부탁드립니다.
public interface ContentPath {
	String BASE = "/base";
	String EVINFO = "/evinfo";
	String FREE = "/free";
	String MEMBER = "/member";
	String REVIEW = "/review";
	String RANK = "/rank";
	String RANK_NR = "rank";
}
