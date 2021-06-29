package com.gdj35.art.web.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.art.web.user.dao.IMemberDao;

@Service
public class MemberService implements IMemberService{
	@Autowired
	public IMemberDao iMemberDao;
}
