package com.gdj35.art.web.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyGallaryDao implements IMyGallaryDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int addPost(HashMap<String, String> params) throws Throwable {
		
		String tag = params.get("tag");
		
		String[] tagArt = tag.split(",");
		
		for(int i = 0; i < tagArt.length; i++) {
			
			HashMap<String, String> tag2 = sqlSession.selectOne("Post.getTag", tagArt[i]);

			System.out.println(tag2);
			
			
			if(tag2 != null) { // 태그에 안녕이 없으면
				params.put("TagNo", String.valueOf(tag2.get("TAG_NO")));
				sqlSession.insert("Post.addMiddleTag", params);
			} else {
				sqlSession.insert("Post.addTag", tagArt[i]);
				tag2 = sqlSession.selectOne("Post.getTag", tagArt[i]);
				params.put("TagNo", String.valueOf(tag2.get("TAG_NO")));
				sqlSession.insert("Post.addMiddleTag", params);
			}
		}
		
		
		return sqlSession.insert("Post.addPost", params);
	}

	@Override
	public int getNum() throws Throwable {
		return sqlSession.selectOne("Post.getNum");
	}

}
