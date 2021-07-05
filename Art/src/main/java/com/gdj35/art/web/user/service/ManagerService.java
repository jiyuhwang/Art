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
	
	@Autowired
	public List<HashMap<String, String>> PList(HashMap<String, String> params) throws Throwable{
		return iManagerDao.PList(params);
	}
	;

}
