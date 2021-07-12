package com.gdj35.art.web.user.controller;

import java.util.Arrays;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.art.common.bean.PagingBean;
import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IManagerService;


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
		 
		System.out.println(params);
		
		
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
	
	@RequestMapping(value = "/delOneRow",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delOneRow(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		String arr = params.get("userNo");
		String [] usersNo = arr.split(",");
		int cnt = 0;
		System.out.println(Arrays.toString(usersNo));
		
		for(int i =0 ; i <usersNo.length; i++) {
			params.put("userNo",usersNo[i]);
			cnt += iManagerService.deleteOneRow(params);
			params.remove("userNo");
		}
		
		System.out.println(params);
		System.out.println(cnt);
		
		/* int cnt = iManagerService.deleteOneRow(params); */
		
		
		 /*
		 * PagingBean pb = iPagingService.getPagingBean(page, maxCount, viewCnt,
		 * pageCnt)
		 */
		
		
		/* modelMap.put("pb",pb); */
		/* modelMap.put("cnt", cnt); */
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/out_user_list",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String out_user_list(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		System.out.println(params);
		
		int page=1;
		
		 if(params.get("page") != null) { 
			 page= Integer.parseInt(params.get("page"));
		  }
		 
		//Total count를 가져온다 T
		int cnt = iManagerService.getOutCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
		
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		
		List<HashMap<String,String>> list = iManagerService.outUserList(params);
		
		System.out.println(list);
		System.out.println(pb);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		
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
	//작품관리
	@RequestMapping(value="/gallaryManage")
	public ModelAndView gallaryManage(ModelAndView mav) throws Throwable {
		
		mav.setViewName("h/gallaryManage");
		return mav;
	}
	

	//리스트 불러오기
	@RequestMapping(value="/entireList",
			method=RequestMethod.POST,
			produces="text/json;charset=UTF-8")
	@ResponseBody
		public String entireList(
		@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//페이징처리
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
							
		try {
			int cnt = iManagerService.getGallaryMCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
			
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			params.put("startCnt", Integer.toString(pb.getStartCount()));
				
			
			//목록취득
			List<HashMap<String, String>> list = iManagerService.getPostList(params);
			
			System.out.println(params);
			System.out.println(list);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			modelMap.put("cnt", cnt);
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	//작품관리 상세페이지 보기
	@RequestMapping(value="/drawUserPopup",
			method=RequestMethod.POST,
			produces="text/json;charset=UTF-8")
	@ResponseBody
	public String drawUserPopup(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//페이징처리
		int page = Integer.parseInt(params.get("page"));
		
		try {
			int cnt = iManagerService.getGallaryMCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
			
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			params.put("startCnt", Integer.toString(pb.getStartCount()));
					
			
			//데이터취득
			HashMap<String, String> data = iManagerService.getUserDetail(params);
		
			modelMap.put("data", data);
			modelMap.put("pb", pb);
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}		
		
		return mapper.writeValueAsString(modelMap);
	
	}
	

	//업데이트 해보기
	@RequestMapping(value="/drawEdit",
			method=RequestMethod.POST,
			produces="text/json;charset=UTF-8")
	@ResponseBody
	public String drawEdit(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//페이징처리
		int page = Integer.parseInt(params.get("page"));
		
		try {
			int cnt = iManagerService.getGallaryMCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
			
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			params.put("startCnt", Integer.toString(pb.getStartCount()));
					
			
			//데이터취득
			HashMap<String, String> data = iManagerService.getUserDetail(params);
		
			modelMap.put("data", data);
			modelMap.put("pb", pb);
		
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		return mapper.writeValueAsString(modelMap);
	
	}
	
	//업데이트하고 새로고침
	@RequestMapping(value="/drawEdits",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String drawEdits(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		int cnt = iManagerService.updatePostDetail(params);
		
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
	
	//삭제하기
	@RequestMapping(value = "/deleteGallary",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteGallary(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		String getArr = params.get("postNo");
		String [] postArry = getArr.split(",");
		
		int cnt = 0;
		
		System.out.println(Arrays.toString(postArry));
		
		for(int i =0 ; i <postArry.length; i++) {
			params.put("postNo",postArry[i]);
			cnt += iManagerService.deleteG(params);
			params.remove("postNo");
		}
		
		System.out.println(params);
		System.out.println(cnt);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	
	//신고관리 페이지
	@RequestMapping(value="/reportManage")
	public ModelAndView reportManage(ModelAndView mav) {
		
		mav.setViewName("h/reportManage");
		return mav;
	}
	
	//신고 리스트 보기
	@RequestMapping(value="/reportList",
			method=RequestMethod.POST,
			produces="text/json;charset=UTF-8")
	@ResponseBody
		public String reportList(
		@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//페이징처리
		int page = 1;
				
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		try {
							
			int cnt = iManagerService.getReportMCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
			
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			params.put("startCnt", Integer.toString(pb.getStartCount()));
					
			
			//목록취득
			List<HashMap<String, String>> list = iManagerService.getReportList(params);
					
			System.out.println(params);
			System.out.println(list);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			modelMap.put("cnt", cnt);			
				
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
