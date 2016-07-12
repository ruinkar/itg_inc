package base.model;

import java.sql.Timestamp;

//게시판 → 공지사항, 자유게시판, 답변형게시판, 파일첨부형 게시판
public class BoardDTO {
	
	private int num;			// 게시물 번호
	private String writer;		// 작성자(계정 이름)
	private String subject;		// 제목
	private String email;		// 이메일
	private String content;		// 내용
	private String passwd;		// 암호
	private Timestamp reg_date;	// 작성일
	private int readcount;		// 조회수
	private String ip;			// 게시자 ip address
	// ~ 일반 자유게시판 항목
	
	// 답변형 게시판 ~
	private int ref;			// 게시물 그룹 번호
	private int re_step;		// 신규 게시물, 답변 게시물의 답변 순서
	private int re_level;	// 들여쓰기
	
	// 자료실 ~
	// private String fileName;	// 첨부 파일명
		
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

}
