package com.gdj35.art.web.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyGallaryDao implements IMyGallaryDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int addPost(HashMap<String, String> params) throws Throwable {
		
		
		return sqlSession.insert("Post.addPost", params);
	}
}
