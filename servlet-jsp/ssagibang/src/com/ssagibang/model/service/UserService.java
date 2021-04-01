package com.ssagibang.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssagibang.model.dao.UserDao;
import com.ssagibang.model.dto.User;

// Model : Service
// 회원관련 서비스로직
public class UserService {

	private UserDao userDao = new UserDao();
	
	//회원가입
	public boolean register(User user) throws SQLException {
		if(getUser(user.getUserId())==null) {//id 중복체크
			return userDao.insert(user);
		}else {
			throw new RuntimeException("아이디가 중복되어 회원가입이 불가능합니다.");
		}
	}

	//회원 조회
	public User getUser(String userId) throws SQLException {
		return userDao.select(userId);
	}
	
	//로그인
	public String login(String userId, String password) throws SQLException {
		User user = getUser(userId);
		if(user == null) return null; // 로그인 실패
		if(user.getUserPwd().equals(password)) return user.getUserName();
		else return null;
		
	}

	public List<User> list() throws SQLException {
		return userDao.list();
	}
}
