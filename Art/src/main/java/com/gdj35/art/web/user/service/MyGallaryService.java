package com.gdj35.art.web.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.art.web.user.dao.IMyGallaryDao;

@Service
public class MyGallaryService implements IMyGallaryService{
	@Autowired
	public IMyGallaryDao iMyGallaryDao;
}
