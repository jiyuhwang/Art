package com.gdj35.art.web.user.dao;

import java.util.HashMap;
import java.util.List;

public interface IManagerDao {

	public List<HashMap<String, String>> getMList(HashMap<String, String> params) throws Throwable;

	public int getTCnt(HashMap<String, String> params) throws Throwable;

	

	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getGList() throws Throwable;


	public HashMap<String, String> getUserDetail(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUser(HashMap<String, String> params)throws Throwable;

	public int getGallaryMCnt(HashMap<String, String> params) throws Throwable;


}
