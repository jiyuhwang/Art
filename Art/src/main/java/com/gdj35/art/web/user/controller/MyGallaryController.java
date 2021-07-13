package com.gdj35.art.web.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.art.common.bean.PagingBean;
import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IMemberService;
import com.gdj35.art.web.user.service.IMyGallaryService;

@Controller
public class MyGallaryController {

	@Autowired
	public IMyGallaryService iMyGallaryService;

	@Autowired
	public IMemberService iMemberService;

	@Autowired
	public IPagingService iPagingService;

	// 로그인 했을 시 상단
	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("JY/header");

		return mav;
	}
	
	// 로그인 안했을 시 상단
	@RequestMapping(value = "/header2")
	public ModelAndView header2(ModelAndView mav) {
		mav.setViewName("JY/header2");

		return mav;
	}

	// 하단
	@RequestMapping(value = "/footer")
	public ModelAndView footer(ModelAndView mav) {
		mav.setViewName("JY/footer");

		return mav;
	}
	
	
	// 나의 갤러리 페이지
	@RequestMapping(value = "/mygallary")
	public ModelAndView mygallary(HttpSession session,
								  @RequestParam HashMap<String, String> params,
								  ModelAndView mav) throws Throwable {

		int page= 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		params.put("userNo", String.valueOf(session.getAttribute("sUserNo")));
		
		HashMap<String, String> data = iMyGallaryService.authorLikeCnt2(params);
		
		mav.addObject("page", page);
		mav.addObject("data", data);
		
		mav.setViewName("JY/mygallary");

		
		return mav;
	}
	
	// 다른사람 갤러리 페이지
	@RequestMapping(value = "/othergallary")
	public ModelAndView othergallary(@RequestParam HashMap<String, String> params,
								  ModelAndView mav) throws Throwable {

		int page= 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		HashMap<String, String> data = iMyGallaryService.authorIsHeart(params);
		
		mav.addObject("data", data);
		
		mav.addObject("page", page);
		
		mav.setViewName("JY/othergallary");

		
		return mav;
	}
	
	
	
	
	// 나의 사진갤러리 Ajax
	@RequestMapping(value = "/mypicgallarys",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mypicGallarys(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("========================" + params);
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = iMyGallaryService.getMyPicCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 5);
		
	
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
				
		List<HashMap<String, String>> list = iMyGallaryService.myPicList(params);
		
		modelMap.put("list", list);		
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}

	
	// 나의 그림갤러리 Ajax
	@RequestMapping(value = "/mydrawgallarys",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mydrawGallarys(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = iMyGallaryService.getMyDrawCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 5);
		
	
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
				
		List<HashMap<String, String>> list = iMyGallaryService.myDrawList(params);
		
		modelMap.put("list", list);		
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
		// 다른 사람 사진갤러리 Ajax
		@RequestMapping(value = "/otherpicgallarys",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String otherpicGallarys(@RequestParam HashMap<String, String> params) throws Throwable {
		
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int page = Integer.parseInt(params.get("page"));
			
			int cnt = iMyGallaryService.getOtherPicCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 5);
			
		
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
					
			List<HashMap<String, String>> list = iMyGallaryService.otherPicList(params);
			
			modelMap.put("list", list);		
			modelMap.put("pb", pb);
			
			return mapper.writeValueAsString(modelMap);
		}

		
		// 그림갤러리 Ajax
		@RequestMapping(value = "/otherdrawgallarys",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String otherdrawGallarys(@RequestParam HashMap<String, String> params) throws Throwable {
		
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int page = Integer.parseInt(params.get("page"));
			
			int cnt = iMyGallaryService.getOtherDrawCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 5);
			
		
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
					
			List<HashMap<String, String>> list = iMyGallaryService.otherDrawList(params);
			
			modelMap.put("list", list);		
			modelMap.put("pb", pb);
			
			return mapper.writeValueAsString(modelMap);
		}
	
	
	
	
	
	// 갤러리 페이지
	@RequestMapping(value = "/gallary")
	public ModelAndView gallary(@RequestParam HashMap<String, String> params,
								ModelAndView mav) {
		
		int page= 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		
		mav.setViewName("JY/gallary");

		return mav;
	}
	
	// 사진갤러리 Ajax
	@RequestMapping(value = "/picgallarys",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String picGallarys(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = iMyGallaryService.getPicCnt(params);
		
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 16, 5);
		
	
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
				
		List<HashMap<String, String>> list = iMyGallaryService.picList(params);
		
		modelMap.put("list", list);		
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}

	
	// 그림갤러리 Ajax
	@RequestMapping(value = "/drawgallarys",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String drawGallarys(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = iMyGallaryService.getDrawCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 16, 5);
		
	
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
				
		List<HashMap<String, String>> list = iMyGallaryService.drawList(params);
		
		modelMap.put("list", list);		
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}

	
	// 메인 페이지
	@RequestMapping(value = "/main")
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("JY/main");

		return mav;
	}
	
	
	// 글 상세 페이지
	@RequestMapping(value = "/detail")
	public ModelAndView detail(HttpSession session,
								@RequestParam HashMap<String, String> params,
								 ModelAndView mav) throws Throwable {
		
		
		iMyGallaryService.updateViews(params);
		
		HashMap<String, String> data = iMyGallaryService.getPost(params);
		
		if(data.get("TAG_NAME") != null && data.get("TAG_NAME") != "") {
			String str = data.get("TAG_NAME");
	
			String[] array = str.split(",");
			
			for(int i = 0 ; i < array.length ; i++) {
				System.out.println(array[i]);
			}
		
		
			mav.addObject("array", array);
		}
		
		//System.out.println(array);
		
		mav.addObject("data", data);
		
		mav.setViewName("JY/detail");

		return mav;
	}
	
	
	// 글수정 페이지
	@RequestMapping(value = "/edit")
	public ModelAndView edit(HttpSession session,
							@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/edit");
			
		} else {
			
			mav.setViewName("redirect:main");
		}

		HashMap<String, String> data = iMyGallaryService.getPost(params);
		
		
		if(data.get("TAG_NAME") != null && data.get("TAG_NAME") != "") {
			String str = data.get("TAG_NAME");
	
			String[] array = str.split(",");
			
			for(int i = 0 ; i < array.length ; i++) {
				System.out.println(array[i]);
			}
		
		
			mav.addObject("array", array);
		}
		
		mav.addObject("data", data);
				
		return mav;	
	}
	
	// 글수정 Ajax
	@RequestMapping(value = "/edits",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String edits(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// mPw의 값을 암호화 후 mPw로 넣겠다.
		//params.put("mPw", Utils.encryptAES128(params.get("mPw")));
		
		
		  try {
			  int cnt = iMyGallaryService.updatePost(params);
			  if(cnt > 0) {
				  modelMap.put("msg", "success");
			  } else {
				  modelMap.put("msg", "failed");
			  }
		  
		  } catch (Throwable e) {
			  e.printStackTrace();
			  modelMap.put("msg", "error");
			  
		  }
		 
	
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	// 글쓰기 페이지
	@RequestMapping(value = "/write")
	public ModelAndView write(HttpSession session, ModelAndView mav) throws Throwable {

		
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/write");
			
			
		} else {
			
			mav.setViewName("redirect:main");
		}

		return mav;
	}
	
	// 글쓰기 Ajax
	@RequestMapping(value = "/writes",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String writes(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int num = iMyGallaryService.getNum();
		
		params.put("postNo", Integer.toString(num));
		
		System.out.println(params.get("tag"));
		
				
		try {
			int cnt = iMyGallaryService.addPost(params);
			
			System.out.println(params);
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	// 글삭제 Ajax
	@RequestMapping(value = "/postDeletes",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String postDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iMyGallaryService.deletePost(params);
			if(cnt > 0) {		
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
	
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	
	
	// 작품 좋아요 눌렀을 때 Ajax
	@RequestMapping(value = "/postOnHeart",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String postOnHeart(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
				
		try {
			int cnt = iMyGallaryService.postOnHeart(params);
			
			System.out.println("--------------------------------------" + params);
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	
	// 작품 좋아요 취소했을 때 Ajax
	@RequestMapping(value = "/postOffHeart",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String postOffHeart(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
				
		try {
			int cnt = iMyGallaryService.postOffHeart(params);
			
			System.out.println("--------------------------------------" + params);
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	// 작품 좋아요 수 Ajax
	@RequestMapping(value = "/postLikeCnt",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String postLikeCnt(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iMyGallaryService.postLikeCnt(params);
				
		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	// 작가 좋아요 눌렀을 때 Ajax
	@RequestMapping(value = "/authorOnHeart",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String authorOnHeart(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
				
		try {
			int cnt = iMyGallaryService.authorOnHeart(params);
			
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	
	// 작가 좋아요 취소했을 때 Ajax
	@RequestMapping(value = "/authorOffHeart",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String authorOffHeart(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
				
		try {
			int cnt = iMyGallaryService.authorOffHeart(params);
			
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}

	
	// 작가 좋아요 수 Ajax
	@RequestMapping(value = "/authorLikeCnt",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String authorLikeCnt(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iMyGallaryService.authorLikeCnt(params);
		

		modelMap.put("data", data);

		return mapper.writeValueAsString(modelMap);
	}
	
	
	// 댓글 쓰기 Ajax
	@RequestMapping(value = "/commentWrite",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentWrite(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
				
		try {
			int cnt = iMyGallaryService.addComment(params);
			
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/commentList",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentList(@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//int page = Integer.parseInt(params.get("page"));
		
		//int cnt = iMyGallaryService.getCommentCnt(params);
		
		//PagingBean pb = iPagingService.getPagingBean(page, cnt);
		
		//params.put("startCnt", Integer.toString(pb.getStartCount()));
		//params.put("endCnt", Integer.toString(pb.getEndCount()));
				
		List<HashMap<String, String>> list = iMyGallaryService.commentList(params);
		
		modelMap.put("list", list);		
		//modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	
	}
	
	// 답글 쓰기 Ajax
	@RequestMapping(value = "/replyCommentWrite",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String replyCommentWrite(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params);
				
		try {
			int cnt = iMyGallaryService.addReplyComment(params);
			
			if (cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}

		return mapper.writeValueAsString(modelMap);
	}
}
