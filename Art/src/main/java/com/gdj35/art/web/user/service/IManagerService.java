package com.gdj35.art.web.user.service;

import java.util.HashMap;
import java.util.List;

public interface IManagerService {

	public List<HashMap<String, String>> getMList(HashMap<String, String> params) throws Throwable;

	public int getTCnt(HashMap<String, String> params) throws Throwable;
	

	

	public List<HashMap<String, String>> getGList() throws Throwable;
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable;


	public HashMap<String, String> getUserDetail(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUser(HashMap<String, String> params)throws Throwable;


	public int getGallaryMCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDPList(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> outUserList(HashMap<String, String> params)throws Throwable;

	public int getOutCnt(HashMap<String, String> params)throws Throwable;

	public int deleteOneRow(HashMap<String, String> params) throws Throwable;

	public int updatePostDetail(HashMap<String, String> params) throws Throwable;

	public int getReportMCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getReportList(HashMap<String, String> params) throws Throwable;

	public int deleteG(HashMap<String, String> params) throws Throwable;


}
