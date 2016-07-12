package inc.itgbbs.util;

public interface KeyArchive {
	
	String[] ADMINLIST = {
			"id"
	};
	
	String[] BOARD = {
			"anum",		//게시물번호
			"writer",	//작성자
			"category",	//카테고리
			"adate",	//작성날짜
			"ip",		//ip 
			"title",	//제목
			"acontent",	//글내용
			"afile",	//첨부파일
			"readcount",//조회수
			"tag1",		//태그1
			"tag2", 	//태그2
			"tag3",		//태그3
			"tag4",		//태그4
			"tag5",		//태그5
			"pnum"		//대상글번호
	};
	
	String[] EVENT = {
			"evnum",	//행사번호
			"eperm",	//행사승인
			"host",		//주최자
			"ename",	//행사명
			"begin",	//행사시작일
			"end",		//행사종료일
			"location",	//행사위치
			"eimg",		//행사이미지
			"lat",		//위도
			"lng"		//경도
	};
	
	String[] LIKELIST = {
			"lnum",		//추천번호
			"id",		//아이디
			"likedate",	//추천일
			"anum"		// 게시물번호
	};
	
	String[] LOGININFO = {
			"id",		//아이디
			"password",	//비밀번호
	};
	
	String[] MEMBER = {
			"id",		// 아이디
			"name",		// 이름
			"nick",		//닉네임
			"email",	//이메일
			"thumbnail",//섬네일(등록사진)
			"mpoint",	//회원포인트
			"fkey",		//페이스북 로그인 인증키
			"gkey"		//구글 로그인 인증키
	};
	
	String[] MSG = {
			"mnum",		//쪽지번호
			"sid",		// 받는사람
			"rid",		// 보내는사람
			"mdate",	//쪽지작성일
			"mcontent"	// 쪽지내용
	};
	
	String[] REVIEW = {
			"anum",		//게시물번호
			"evnum",	//행사번호
			"rating"	//평가점수
	};
	
	String[][] KEYS = {
			ADMINLIST,
			BOARD,
			EVENT,
			LIKELIST,
			LOGININFO,
			MEMBER,
			MSG,
			REVIEW
	};
}
