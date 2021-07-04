package com.gdj35.art.web.user.service;

import java.util.HashMap;

public interface IMemberService {

	public int addUser(HashMap<String, String> params) throws Throwable;

	public int idCheck(HashMap<String, String> params) throws Throwable;

	public int nicknameCheck(HashMap<String, String> params) throws Throwable;

}
