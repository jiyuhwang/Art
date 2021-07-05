package com.gdj35.art.web.user.service;

import java.util.HashMap;
import java.util.List;

public interface IManagerService {

	List<HashMap<String, String>> getMList(HashMap<String, String> params) throws Throwable;

	int getTCnt(HashMap<String, String> params) throws Throwable;
	

	List<HashMap<String, String>> PList(HashMap<String, String> params) throws Throwable;
}
