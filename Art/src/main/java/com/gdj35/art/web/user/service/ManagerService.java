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
	public List<HashMap<String, String>> outUserList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.outUserList(params);
	}



	@Override
	public List<HashMap<String, String>> getGList() throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getGList();
	}


	
	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable{
		return iManagerDao.getPostList(params);
	}
	
	@Override
	public HashMap<String, String> getUserDetail(HashMap<String, String> params) throws Throwable {
		return iManagerDao.getUserDetail(params);
		
	}

	@Override
	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getUser(params);

	}

	@Override

	public int getGallaryMCnt(HashMap<String, String> params) throws Throwable {		
		return iManagerDao.getGallaryMCnt(params);
	}
	
	@Override
	public List<HashMap<String, String>> getDPList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getDPList(params);

	}

	@Override
	public int getOutCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getOutCnt(params);
	}

	@Override
	public int deleteOneRow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.deleteOneRow(params);
	}

	@Override
	public List<HashMap<String, String>> getDMList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.getDMList(params);
	}

	@Override
	public int updateUser(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iManagerDao.updateUser(params);
	}

	@Override
	public List<HashMap<String, String>> getTList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return  iManagerDao.getTList(params);
	}




}
