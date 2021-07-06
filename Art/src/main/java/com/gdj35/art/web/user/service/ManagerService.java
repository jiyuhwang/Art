package com.gdj35.art.web.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.art.web.user.dao.IManagerDao;

@Service
public class ManagerService implements IManagerService {
	@Autowired
	public IManagerDao iManagerDao;

	@Override
	public List<HashMap<String, String>> getMList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getMList(params);
	}

	@Override
	public int getTCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getTCnt(params);
	}
	
	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable{
		return iManagerDao.getPostList(params);
	}

	@Override
	public List<HashMap<String, String>> getGList() throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getGList();
	}
	
}
