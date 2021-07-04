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
}
