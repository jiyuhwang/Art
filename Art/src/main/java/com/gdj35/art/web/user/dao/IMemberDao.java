package com.gdj35.art.web.user.dao;

import java.util.HashMap;

public interface IMemberDao {

	public int addUser(HashMap<String, String> params) throws Throwable;

	public int idCheck(HashMap<String, String> params) throws Throwable;

	public int nicknameCheck(HashMap<String, String> params) throws Throwable;

}
