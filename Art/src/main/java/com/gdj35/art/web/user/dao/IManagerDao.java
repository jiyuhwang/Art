package com.gdj35.art.web.user.dao;

import java.util.HashMap;
import java.util.List;

public interface IManagerDao {

	List<HashMap<String, String>> getMList(HashMap<String, String> params) throws Throwable;

	int getTCnt(HashMap<String, String> params) throws Throwable;

	
}
