package com.gdj35.art.web.user.service;

import java.util.HashMap;
import java.util.List;

public interface IMyGallaryService {

	public int addPost(HashMap<String, String> params) throws Throwable;

	public int getNum() throws Throwable;

	public List<HashMap<String, String>> picList(HashMap<String, String> params) throws Throwable;

	public int getPicCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> drawList(HashMap<String, String> params) throws Throwable;

	public int getDrawCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getPost(HashMap<String, String> params) throws Throwable;


}
