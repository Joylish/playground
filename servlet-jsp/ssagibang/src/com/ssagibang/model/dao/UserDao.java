package com.ssagibang.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssagibang.model.dto.User;
import com.ssagibang.util.DBUtil;

//Model : DAO
//회원관련 서비스로직
public class UserDao {
	
	public UserDao(){
	}
	
	// 회원정보 insert
	public boolean insert(User user) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into ssafy_member (userid, username, userpwd, email, address) values (?,?,?,?,?)";

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getUserId());
			stmt.setString(2, user.getUserName());
			stmt.setString(3, user.getUserPwd());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getAddress());
			return stmt.executeUpdate() > 0;
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
	}
	// 회원정보 select
	public User select(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;	//모든 데이터 핸들링을 마칠때까지 close 하면 안된다.
		String sql = "select * from ssafy_member where userid = ?";

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userId);
			rs = stmt.executeQuery();
			if(rs.next()) {
				return new User(rs.getString("userid"), rs.getString(2), rs.getString("userPwd"), rs.getString(4), rs.getString(5));
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return null;
	}

	public List<User> list() throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;	//모든 데이터 핸들링을 마칠때까지 close 하면 안된다.
		List<User> rsList = new ArrayList<>();
		String sql = "select * from ssafy_member";

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				rsList.add(
						new User(rs.getString("userid")
								, rs.getString(2)
								, rs.getString("userPwd")
								, rs.getString(4)
								, rs.getString(5)));
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return rsList;
	}
}
