package com.gdj35.art.web.user.dao;

import java.util.HashMap;

public interface IMemberDao {

	public int addUser(HashMap<String, String> params) throws Throwable;

	public int idCheck(HashMap<String, String> params) throws Throwable;

	public int nicknameCheck(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable;

	public int updateProfile(HashMap<String, String> params) throws Throwable;

	public int updateSet(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUser2(HashMap<String, String> params) throws Throwable;

	public int outUser(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> idFind(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> pwFind(HashMap<String, String> params) throws Throwable;

	public int updatePw(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAdmin(HashMap<String, String> params) throws Throwable;

	public int editPw(HashMap<String, String> params) throws Throwable;

}
