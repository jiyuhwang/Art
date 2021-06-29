package com.gdj35.art.web.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyGallaryDao implements IMyGallaryDao{
	@Autowired
	public SqlSession sqlSession;
}
