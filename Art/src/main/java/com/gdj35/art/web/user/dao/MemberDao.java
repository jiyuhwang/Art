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

}
