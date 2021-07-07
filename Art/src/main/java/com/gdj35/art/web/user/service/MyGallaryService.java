package com.gdj35.art.web.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.art.web.user.dao.IMyGallaryDao;

@Service
public class MyGallaryService implements IMyGallaryService{
	@Autowired
	public IMyGallaryDao iMyGallaryDao;

	@Override
	public int addPost(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.addPost(params);
	}
}
