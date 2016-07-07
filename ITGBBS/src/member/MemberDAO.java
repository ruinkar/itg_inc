package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.MemberDTO;
import model.DBConnectionMgr;
import model.LoginInfoDTO;

public class MemberDAO {
	// 1.객체를 얻어오고자하는 클래스의 객체를 자기 클래스의 멤버변수로 선언
	private DBConnectionMgr pool = null;

	// 2.생성자를 연결
	public MemberDAO() {
		try {
			pool = DBConnectionMgr.getInstance();// 정적메서드
			System.out.println("pool = " + pool);
		} catch (Exception e) {
			System.out.println("DB연결 실패 ->e = " + e);
		}
	}
	// MemberDAO에서 하는 업무

	// 1.중복ID체크
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		boolean check = false;// 중복 id 체크 유무
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			check = rs.next();
			
			/*while(rs.next()){
				System.out.println(rs.getString("id"));
			}*/
		} catch (Exception e) {
			System.out.println("checkId()메서드 오류= " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	// 2.회원 로그인
	public boolean loginCheck(String id, String pw) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		boolean check = false;// 데이터의 존재유무체크 해주는 변수
		// 2.SQL실행
		try {
			con = pool.getConnection();
			System.out.println("con = " + con);
			sql = "select id,password from logininfo where id =? and password = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch (Exception e) {
			System.out.println("loginCheck에러발생=" + e);// e.toString()
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return check;
	}

	// 3.회원 가입
	// insert into member values(?,?,?,?,?,?,?,?); ->매개변수 8개
	// executeUpdate() -> 반환값이 존재 -> 1(실행성공) or 0(실행실패)
	public boolean memberInsert(MemberDTO member, LoginInfoDTO logininfo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean check = false;// 회원가입 성공시 체크 유무

		try {
			con = pool.getConnection();

			//con.setAutoCommit(false);// con.commit()를 만나기 전짜기 보류

			String sql = "insert into member(id, name, nick, email) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getNick());
			pstmt.setString(4, member.getEmail());
			// 추가 구현 목록
			/*
			 * pstmt.setString(5, member.getThumbnail()); pstmt.setInt(6,
			 * member.getMpoint()); pstmt.setString(7, member.getFkey());
			 * pstmt.setString(8, member.getGkey());
			 */
			int insert = pstmt.executeUpdate();// 테이블의 구조에 영향을 미치는 것은
			con.commit();
			System.out.println("1차 sql실행");
			// executeUpdate를 사용한다.
			if (insert == 1) {
				String sql2 = "insert into logininfo values(?,?)";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, logininfo.getId());
				pstmt.setString(2, logininfo.getPassword());
				insert = pstmt.executeUpdate();
				
			}
			// --------------------------------------------------
			con.commit();
			//con.setAutoCommit(true);
			System.out.println("insert(데이터추가성공유무)= " + insert);// 1일 경우 데이터 추가
																// 성공이다.
			if (insert > 0) {
				check = true;// 데이터 추가 성공을 의미
			}
			// pstmt.close();
			// pstmt -> sql 구문을 실행하기위한 객체
			// pstmt -> insert , pstmt2 -> update

		} catch (Exception e) {
			System.out.println("member ID"+member.getId());
			System.out.println("member name"+member.getName());
			System.out.println("member nick"+member.getNick());
			System.out.println("member email"+member.getEmail());
			System.out.println("login id"+logininfo.getId());
			System.out.println("login password"+logininfo.getPassword());
			
			System.out.println("memberInsert()메서드 오류= " + e);
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback()메서드 오류" + e1);
			}
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return check;
	}

	// 4.회원 정보 수정을 위해서 열리는 페이지(MemberTable)
	public MemberDTO getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 추가
		MemberDTO men = null;// 찾은 데이터담기
		String sql = "";
		try {
			con = pool.getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// 테이블의 필드별로 불러와서 저장빈에 담기
			if (rs.next()) {// while(rs.next())
				men = new MemberDTO();
				men.setId(rs.getString("id"));
				men.setName(rs.getString("name"));
				men.setNick(rs.getString("nick"));
				men.setEmail(rs.getString("email"));
				men.setThumbnail(rs.getString("thumbnail"));
				men.setMpoint(rs.getInt("mpoint"));
				men.setFkey(rs.getString("fkey"));
				men.setGkey(rs.getString("gkey"));
				// 추가(회원리스트)vecList.add(men);
			}
			System.out.println(men.toString());
			
		} catch (Exception e) {
			System.out.println("getMember()오류" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return men;
	}
	
	// 4.회원 정보 수정을 위해서 열리는 페이지(LoginfoTable)
		public LoginInfoDTO getloginfo(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			LoginInfoDTO loginfo = null;
			String sql = "";
			try {
				con = pool.getConnection();
				sql = "select * from logininfo where id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				// 테이블의 필드별로 불러와서 저장빈에 담기
				if (rs.next()) {// while(rs.next())
					loginfo = new LoginInfoDTO();
					loginfo.setId(rs.getString("id"));
					loginfo.setPassword(rs.getString("password"));
				}
				System.out.println(loginfo.toString());

			} catch (Exception e) {
				System.out.println("getloginfo()오류" + e);
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return loginfo;
		}

	// 5.회원정보 수정
	public boolean memberUpdate(MemberDTO mem , LoginInfoDTO loginfo) {

		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;// 회원수정성공유무
		String sql = "";// sql저장
		try {
			con = pool.getConnection();
			// 트랜잭션처리 시작
			con.setAutoCommit(false);
			// -----------------------------
			sql = "update member set name=?, " + "nick=?, email=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem.getName());
			pstmt.setString(2, mem.getNick());
			pstmt.setString(3, mem.getEmail());
			/*pstmt.setString(4, mem.getThumbnail());
			pstmt.setInt(5, mem.getMpoint());
			pstmt.setString(6, mem.getFkey());
			pstmt.setString(7, mem.getGkey());*/
			pstmt.setString(4, mem.getId());
			// int->1->sql성공적으로 실행
			// 0-->sql구문이 실패
			int count = pstmt.executeUpdate();
			pstmt.close();
			System.out.println("실행확인"+count);
			if (count == 1){
				sql ="update logininfo set password=? where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, loginfo.getPassword());
				pstmt.setString(2, loginfo.getId());
				pstmt.executeUpdate();
			}
			
			// 모든 sql구문이 끝난후
			con.commit();
			// --------------------------------
			if (count > 0) {// if(count==1)
				flag = true;
			}
		} catch (Exception e) { // 실행실패->rollback()
			try {
				con.rollback();
			} catch (Exception e2) {
			}
			System.out.println("memberUpdate()오류=" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 6.회원탈퇴->id,passwd->select->delete
		public int deleteMember(String id, String password) {
			// DB접속
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String dbpasswd = "";// 테이블에 저장된 암호
			int x = -1;// 회원삭제유무
			// DB작업(select)

			try {
				// DB접속구문
				con = pool.getConnection();
				con.setAutoCommit(false);// 시작점

				String sql = "select * from logininfo " + " where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) { // id에 해당하는 암호존재
					dbpasswd = rs.getString("password");
					// 테이블의 암호==웹상의 암호
					if (dbpasswd.equals(password)) {
						String sql2 = "delete from logininfo where id = ?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setString(1, id);
						int delete = pstmt.executeUpdate();
						con.commit();
						System.out.println("삭제유무=" + delete);
						x = 1;// 회원탈퇴성공
					} else {
						x = 0;// 비밀번호가 틀림
					} // else
				} // if(rs.next())
			} // try
			catch (Exception ex) {
				System.out.println("=deleteMember()에러=");
				System.out.println("==에러라인 302==");
				System.out.println(ex);
			} finally { // DB객체를 해제
				pool.freeConnection(con, pstmt, rs);
			}
			return x;
		}
		// 관리자->전체회원을 모두 열람(검색)

}
