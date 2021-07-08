package com.gdj35.art.web.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDao implements IManagerDao {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getMList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("Manager.getMList",params);
	}

	@Override
	public int getTCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Manager.getTCnt",params);
	}
	

	@Override
	public List<HashMap<String, String>> getGList() throws Throwable {
		return sqlSession.selectList("Manager.getGList");
	
	}

	@Override
	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Manager.getUser",params);
	}

	
	
	

	
	
	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Manager.getPostList", params);
	}
	
	@Override
	public HashMap<String, String> getUserDetail(HashMap<String, String> params) throws Throwable {		
		return sqlSession.selectOne("Manager.getUserDetail", params);
	}

	@Override
	public int getGallaryMCnt(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectOne("Manager.getGallaryMCnt", params);
	}

	
}
