package com.gdj35.art.web.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.art.web.user.dao.IMyGallaryDao;

@Service
public class MyGallaryService implements IMyGallaryService{
	@Autowired
	public IMyGallaryDao iMyGallaryDao;

	@Override
	public int addPost(HashMap<String, String> params) throws Throwable {
		
		return iMyGallaryDao.addPost(params);
	}

	@Override
	public int getNum() throws Throwable {
		return iMyGallaryDao.getNum();
	}

	@Override
	public List<HashMap<String, String>> picList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.picList(params);
	}

	@Override
	public int getPicCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getPicCnt(params);
	}

	@Override
	public List<HashMap<String, String>> drawList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.drawList(params);
	}

	@Override
	public int getDrawCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getDrawCnt(params);
	}

	@Override
	public HashMap<String, String> getPost(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getPost(params);
	}

	@Override
	public int updatePost(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.updatePost(params);
	}

	@Override
	public int deletePost(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.deletePost(params);
	}

	@Override
	public List<HashMap<String, String>> myPicList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.myPicList(params);
	}
	
	@Override
	public int getMyPicCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getMyPicCnt(params);
	}
	
	@Override
	public List<HashMap<String, String>> myDrawList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.myDrawList(params);
	}

	@Override
	public int getMyDrawCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getMyDrawCnt(params);
	}

	@Override
	public List<HashMap<String, String>> otherPicList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.otherPicList(params);
	}

	@Override
	public int getOtherPicCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getOtherPicCnt(params);
	}
	
	@Override
	public List<HashMap<String, String>> otherDrawList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.otherDrawList(params);
	}

	@Override
	public int getOtherDrawCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.getOtherDrawCnt(params);
	}

	@Override
	public int postOnHeart(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.postOnHeart(params);
	}

	@Override
	public int postOffHeart(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.postOffHeart(params);
	}

	@Override
	public HashMap<String, String> postLikeCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.postLikeCnt(params);
	}

	@Override
	public int authorOnHeart(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.authorOnHeart(params);
	}

	@Override
	public int authorOffHeart(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.authorOffHeart(params);
	}

	@Override
	public HashMap<String, String> authorLikeCnt(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.authorLikeCnt(params);
	}


	@Override
	public HashMap<String, String> authorIsHeart(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.authorIsHeart(params);
	}

	@Override
	public HashMap<String, String> authorLikeCnt2(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.authorLikeCnt2(params);
	}

	@Override
	public void updateViews(HashMap<String, String> params) throws Throwable {
		iMyGallaryDao.updateViews(params);
	}

	@Override
	public int addComment(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.addComment(params);
	}

	@Override
	public List<HashMap<String, String>> commentList(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.commentList(params);
	}

	@Override
	public int addReplyComment(HashMap<String, String> params) throws Throwable {
		return iMyGallaryDao.addReplyComment(params);
	}


}
