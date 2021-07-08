package com.gdj35.art.web.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.art.common.bean.PagingBean;
import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IManagerService;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class ManagerController {
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public IManagerService iManagerService;
	
	@RequestMapping(value="/writingManager")
	public ModelAndView writinerManager(ModelAndView mav) {
		
		mav.setViewName("HD/writingManager");
		return mav;
	}
	
	@RequestMapping(value="/editManager")
	public ModelAndView editManager(ModelAndView mav) {
		
		mav.setViewName("HD/editManager");
		return mav;
	}

	@RequestMapping(value="/user_detail(memo)")
	public ModelAndView user_detailM(ModelAndView mav) {
		
		mav.setViewName("HD/user_detail(memo)");
		return mav;
	}
	
	@RequestMapping(value="/user_detail(post)")
	public ModelAndView user_detailP(ModelAndView mav) {
		
		mav.setViewName("HD/user_detail(post)");
		return mav;
	}
	
	@RequestMapping(value="/user_board")
	public ModelAndView user_board(ModelAndView mav,
									@RequestParam HashMap<String,String> params) throws Throwable {
		 
		int page=1;
		
		
		 if(params.get("page") != null) { 
			 page= Integer.parseInt(params.get("page"));
		  }
		 
		//Total count를 가져온다 T
		int cnt = iManagerService.getTCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
		
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		
		
		//Main list를 가져온다. 그래서 M으로 지정
		List<HashMap<String,String>> list = 
					iManagerService.getMList(params);
		
		/*
		 * HashMap<String,String> user =iManagerService.getUser(params);
		 */
		
		System.out.println(list);
		System.out.println(params);
		/* mav.addObject("user", user); */
		mav.addObject("cnt", cnt);
		mav.addObject("pb", pb);
		mav.addObject("page", page);
		mav.addObject("list", list);
		mav.addObject("now", "member");
		mav.setViewName("HD/user_board");
		return mav;
	}
	
	
	@RequestMapping(value = "/user_datailP",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String user_datailP(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		System.out.println(params);
		
		// 목록취득
		HashMap<String,String> user=iManagerService.getUser(params);
		//detail post의 작품 리스트를 가져오는 메서드
		List<HashMap<String,String>> list = iManagerService.getDPList(params);
		
		/*
		 * PagingBean pb = iPagingService.getPagingBean(page, maxCount, viewCnt,
		 * pageCnt)
		 */
		 
		System.out.println(user);
		System.out.println(list);
		/* modelMap.put("pb",pb); */
		modelMap.put("list", list);
		modelMap.put("user", user);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/gong_board")
	public ModelAndView gong_board(ModelAndView mav) throws Throwable {
		/*
		 * List<HashMap<String,String>> list = iManagerService.getGList();
		 * 
		 * mav.addObject("list", list);
		 */
		mav.addObject("now", "gong");
		mav.setViewName("HD/gong_board");
		return mav;
	}
	
	@RequestMapping(value="/tag_board")
	public ModelAndView tag_board(ModelAndView mav) {
		
		mav.addObject("now", "tag");
		mav.setViewName("HD/tag_board");
		return mav;
	}
	
	
	
	


	
	
	
	
	
	
	//----------------------------------------------현
	//회원관리
	@RequestMapping(value="/gallaryManage")
	public ModelAndView gallaryManage(ModelAndView mav) {
		
		mav.setViewName("h/gallaryManage");
		return mav;
	}
	

	//회원관리 전체 게시글 보기
	@RequestMapping(value="/entire",
			method=RequestMethod.POST,
			produces="text/json;charset=UTF-8")
	@ResponseBody
	public String entire(
			@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//목록취득
		List<HashMap<String, String>> list = iManagerService.getPostList(params);
		
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	//회원관리 테이블 클릭시 해당 게시글로 이동
	@RequestMapping(value= {"/detailPopup"})
	public ModelAndView detailPopup(
		@RequestParam HashMap<String, String> params,
		ModelAndView mav) throws Throwable {
		if(params.get("postNo") != null) {
			HashMap<String, String> data = iManagerService.getUserDetail(params);
						
			mav.addObject("data", data);
			mav.setViewName("h/detailPopup");
			
		} else {
			mav.setViewName("redirect:entire");
		}

		return mav;
	}
	
	
	
	//신고관리 페이지
	@RequestMapping(value="/reportManage")
	public ModelAndView reportManage(ModelAndView mav) {
		
		mav.setViewName("h/reportManage");
		return mav;
	}
	
}
