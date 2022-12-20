package com.baguel.model.board;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao instance = new BoardDao();

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		return instance;
	}

	private Connection getConnection() {

		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;
	}

	public int listCalc() {
		int count = 0;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "SELECT count(event) COUNT FROM BOARD WHERE status = '1'";
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			set = pstmt.executeQuery();
			if(set.next()) {
				System.out.println(set.getString("COUNT"));
				count = set.getInt("COUNT");
			} else {
				System.out.println("SET : FAIL");
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

		return count;
	}
	
	public ArrayList<BoardDto> getList(int pagesAdd, int minRowNum, int maxRowNum) {
		ArrayList<BoardDto>boardList = new ArrayList<BoardDto>();
		// 파라미터 int로 받아서 수정하기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT rownum+? as rownumber, writedate, eventplace, event, id, approval FROM (select rownum AS rn, board.* from board where status = '1' order by boardnum) WHERE rn BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pagesAdd);
			pstmt.setInt(2, minRowNum);
			pstmt.setInt(3, maxRowNum);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String rownumber = rs.getString("rownumber");
				String eventPlace = rs.getString("eventPlace");
				String event = rs.getString("event");
				String writeDate = rs.getString("writeDate");
				String id = rs.getString("id");
				String approval = rs.getString("approval");
				
				boardList.add(new BoardDto(rownumber, eventPlace, event, writeDate, id, approval));
			}
		} catch (SQLException e) {
			System.out.println("! getList() 예외 발생 !");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return boardList;
	}
}
