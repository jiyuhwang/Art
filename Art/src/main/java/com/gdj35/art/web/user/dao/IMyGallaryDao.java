package com.gdj35.art.web.user.dao;

import java.util.HashMap;
import java.util.List;

public interface IMyGallaryDao {

	public int addPost(HashMap<String, String> params) throws Throwable;

	public int getNum() throws Throwable;

	public List<HashMap<String, String>> picList(HashMap<String, String> params) throws Throwable;

	public int getPicCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> drawList(HashMap<String, String> params) throws Throwable;

	public int getDrawCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getPost(HashMap<String, String> params) throws Throwable;

	public int updatePost(HashMap<String, String> params) throws Throwable;

	public int deletePost(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> myPicList(HashMap<String, String> params) throws Throwable;

	public int getMyPicCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> myDrawList(HashMap<String, String> params) throws Throwable;

	public int getMyDrawCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> otherPicList(HashMap<String, String> params) throws Throwable;

	public int getOtherPicCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> otherDrawList(HashMap<String, String> params) throws Throwable;

	public int getOtherDrawCnt(HashMap<String, String> params) throws Throwable;


}
