package com.gdj35.art.web.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements IMemberDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int addUser(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("User.addUser", params);
	}

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("User.idCheck", params);
	}

	@Override
	public int nicknameCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("User.nicknameCheck", params);
	}

	@Override
	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("User.getUser", params);
	}

	@Override
	public int updateProfile(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("User.updateProfile", params);
	}

	@Override
	public int updateSet(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("User.updateSet", params);
	}

	@Override
	public HashMap<String, String> getUser2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("User.getUser2", params);
	}


}
