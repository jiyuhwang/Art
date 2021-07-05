package com.gdj35.art.web.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDao implements IManagerDao{
	
	@Autowired
	public SqlSession sqlSession;
	
	@Override
public List<HashMap<String, String>> PList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("Admin.PList", params);
	}
	

}