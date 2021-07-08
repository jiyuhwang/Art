package com.gdj35.art.web.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyGallaryDao implements IMyGallaryDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int addPost(HashMap<String, String> params) throws Throwable {
		
		String tag = params.get("tag"); // 키가 "tag"인 것의 값을 문자열 tag에 담는다.
		
		String[] tagArt = tag.split(","); // 문자열 tag를 ',' 기준으로 나누어 배열에 담는다.
		
		for(int i = 0; i < tagArt.length; i++) { // 0부터 배열 tagArt 크기만큼 돌린다.
			
			String tagName = tagArt[i]; // 문자열 tagName에 배열 tagArt[i]의 값을 담는다.
			
			HashMap<String, String> tag2 = sqlSession.selectOne("Post.getTag", tagName); // 문자열 tagName을 getTag쿼리 값(#{tagName})으로 넣고 TAG_NO을 받아온다.
			// tag2의 키 : TAG_NO, 값 : 숫자

			if(tag2 != null) { // 등록되어 있는 태그이면
				params.put("TagNo", String.valueOf(tag2.get("TAG_NO"))); // tag2에서 키가 "TAG_NO"인 것의 값을 params의 키가 "TagNo"인 것의 값에 집어넣는다.
				sqlSession.insert("Post.addMiddleTag", params); // 중계 테이블에 #{postNo}, #{TagNo}를 집어넣는다.
			} else { // 등록되어 있지않은 태그이면
				sqlSession.insert("Post.addTag", tagName); // 태그 테이블에 문자열 tagName을 집어넣는다.
				tag2 = sqlSession.selectOne("Post.getTag", tagName); // 문자열 tagName을 getTag쿼리 값(#{tagName})으로 넣고 TAG_NO을 받아온다.
				// tag2의 키 : TAG_NO, 값 : 숫자
				params.put("TagNo", String.valueOf(tag2.get("TAG_NO"))); // tag2에서 키가 "TAG_NO"인 것의 값을 params의 키가 "TagNo"인 것의 값에 집어넣는다.
				sqlSession.insert("Post.addMiddleTag", params); // 중계 테이블에 #{postNo}, #{TagNo}를 집어넣는다.
			}
		}
		
		
		return sqlSession.insert("Post.addPost", params);
	}

	@Override
	public int getNum() throws Throwable {
		return sqlSession.selectOne("Post.getNum");
	}

	@Override
	public List<HashMap<String, String>> picList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Post.picList", params);
	}

	@Override
	public int getPicCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Post.getPicCnt", params);
	}

	@Override
	public List<HashMap<String, String>> drawList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Post.drawList", params);
	}

	@Override
	public int getDrawCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Post.getDrawCnt", params);
	}

}
