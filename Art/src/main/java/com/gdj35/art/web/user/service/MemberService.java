package com.gdj35.art.web.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.art.web.user.dao.IMemberDao;

@Service
public class MemberService implements IMemberService{
	@Autowired
	public IMemberDao iMemberDao;

	@Override
	public int addUser(HashMap<String, String> params) throws Throwable {
		return iMemberDao.addUser(params);
	}

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iMemberDao.idCheck(params);
	}

	@Override
	public int nicknameCheck(HashMap<String, String> params) throws Throwable {
		return iMemberDao.nicknameCheck(params);
	}

	@Override
	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable {
		return iMemberDao.getUser(params);
	}

	@Override
	public int updateProfile(HashMap<String, String> params) throws Throwable {
		return iMemberDao.updateProfile(params);
	}

	@Override
	public int updateSet(HashMap<String, String> params) throws Throwable {
		return iMemberDao.updateSet(params);
	}

	@Override
	public HashMap<String, String> getUser2(HashMap<String, String> params) throws Throwable {
		return iMemberDao.getUser2(params);
	}

	@Override
	public int outUser(HashMap<String, String> params) throws Throwable {
		return iMemberDao.outUser(params);
	}

}
