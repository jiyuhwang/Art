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


}
