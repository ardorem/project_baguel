package com.baguel.model.member;

import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NOEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() {

		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;
	}

	public int insertMember(MemberDto dto) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		String query1 = "insert into members values (?,?,?,?,?,?, null, null)";
		String query2 = "update members set status = 1, memnum = members_seq.nextval where id = ?";
		String query3 = "delete from members where id = ?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query1);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserNick());
			pstmt.setString(5, dto.getUserMail());
			pstmt.setTimestamp(6, dto.getrDate());
			pstmt.executeUpdate();
			ri = MemberDao.MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
//		================================ insert 성공시 memnum, status 부여 / 실패시 삭제
		if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
			try {
				connection = getConnection();
				pstmt = connection.prepareStatement(query2);
				pstmt.setString(1, dto.getUserId());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (connection != null)
						connection.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} else {
			try {
				connection = getConnection();
				pstmt = connection.prepareStatement(query3);
				pstmt.setString(1, dto.getUserId());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (connection != null)
						connection.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		return ri;
	}
	
	public int confirmId(String userId) {
		int ri = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?  AND status Not in 0";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			set = pstmt.executeQuery();
			
			if (set.next()) {
				ri = MemberDao.MEMBER_EXISTENT;
			} else {
				ri = MemberDao.MEMBER_NOEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	public int confirmNick(String userNick) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where nickname = ? AND status Not in 0";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userNick);
			set = pstmt.executeQuery();
			
			if (set.next()) {
				ri = MemberDao.MEMBER_EXISTENT;
			} else {
				ri = MemberDao.MEMBER_NOEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}

	public int confirmNick(String usesrId, String userNick) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where nickname = ? AND status Not in 0 AND id Not like ?";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userNick);
			pstmt.setString(2, usesrId);
			set = pstmt.executeQuery();
			
			if (set.next()) {
				ri = MemberDao.MEMBER_EXISTENT;
			} else {
				ri = MemberDao.MEMBER_NOEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
//	*************************************************************************회원가입
	public int userCheck(String userId, String userPw) {
		
		int ri = 0;
		String dbPw;
		System.out.println(">>> userCheck : " + userId);
		System.out.println(">>> userCheck : " + userPw);
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from members where id = ? AND status Not in 0";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			
			set = pstmt.executeQuery();

			if (set.next()) {
				dbPw = set.getString("pw");
				System.out.println(">>>> dbPw : " + dbPw);
				if(dbPw.equals(userPw)) {
					ri = MemberDao.MEMBER_LOGIN_SUCCESS;
				}else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				ri= MemberDao.MEMBER_LOGIN_IS_NOT; 
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public MemberDto getMember(String userId) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ? AND status Not in 0";
		MemberDto dto = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new MemberDto();
				dto.setUserId(set.getString("id"));
				dto.setUserPw(set.getString("pw"));
				dto.setUserName(set.getString("name"));
				dto.setUserNick(set.getString("nickname"));
				dto.setUserMail(set.getString("email"));
				dto.setrDate(set.getTimestamp("joindate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public int updateMember(MemberDto dto) {
		int ri = 0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update members set pw=?, name=?, nickname=?, email=? where id=?";
		
		try {
			System.out.println("updateMember");
			System.out.println(dto.getUserPw());
			System.out.println(dto.getUserName());
			System.out.println(dto.getUserNick());
			System.out.println(dto.getUserMail());
			System.out.println(dto.getUserId());
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getUserPw());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserNick());
			pstmt.setString(4, dto.getUserMail());
			pstmt.setString(5, dto.getUserId());
			ri = pstmt.executeUpdate(); // 반영된 레코드의 건수를 반환
			System.out.println("upMem ri : " + ri);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public void deactiveMember(String userId) {
		System.out.println("deactiveMember : " + userId);
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update members set status = 0 where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
