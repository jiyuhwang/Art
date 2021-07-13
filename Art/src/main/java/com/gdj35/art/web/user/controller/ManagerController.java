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
		//메모 목록 취득
		List<HashMap<String,String>> listM = iManagerService.getDMList(params); 

		System.out.println("this is parmas >>>>"+params);
		
		/*
		 * PagingBean pb = iPagingService.getPagingBean(page, maxCount, viewCnt,
		 * pageCnt)
		 */
		 
		System.out.println("USER >>>"+user);
		System.out.println("LIST >>>"+list);
		System.out.println("LISTM >>>"+listM);
		/* modelMap.put("pb",pb); */
		
		modelMap.put("listM", listM);
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
			System.out.println(">>>>>>이거는 포문 안에 파람 값" + params);
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
	
	@RequestMapping(value = "/user_update",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String user_update(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		System.out.println("고객 업데이트를 위한 파람 값 >>> "+params);
		
		try {
			 int cnt = iManagerService.updateUser(params); 
			
			 System.out.println("고객을 업데이트했는지 안했는지 >> " + cnt); 
			
			 if(cnt >0 ) { 
				 modelMap.put("msg","success"); 
			 }
			 
		}catch(Throwable e){
			e.printStackTrace();
			modelMap.put("msg","error");
		}
		

//		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/gong_board")
	public ModelAndView gong_board(ModelAndView mav) throws Throwable {
		
		  List<HashMap<String,String>> list = iManagerService.getGList();
		
		 mav.addObject("list", list);
		
		mav.addObject("now", "gong");
		mav.setViewName("HD/gong_board");
		return mav;
	}
	
	@RequestMapping(value="/tag_board")
	public ModelAndView tag_board(ModelAndView mav, HashMap<String, String> params) throws Throwable {
		
		List<HashMap<String, String>> tList = iManagerService.getTList(params);
		
		
		
		mav.addObject("tList", tList);
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
	

	//작품관리 상세페이지 보기
	@RequestMapping(value="/entireList",
			method=RequestMethod.POST,
			produces="text/json;charset=UTF-8")
	@ResponseBody
		public String entireList(
		@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		

			int page = Integer.parseInt(params.get("page"));

				
		int cnt = iManagerService.getGallaryMCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
		
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		params.put("startCnt", Integer.toString(pb.getStartCount()));
				
		
		//목록취득
		List<HashMap<String, String>> list = iManagerService.getPostList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		modelMap.put("cnt", cnt);
				
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	//작품관리 테이블 클릭시 해당 게시글로 이동
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
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		int cnt = iManagerService.getGallaryMCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 10);
		
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		params.put("startCnt", Integer.toString(pb.getStartCount()));
				
		
		//데이터취득
		HashMap<String, String> data = iManagerService.getUserDetail(params);
	
		modelMap.put("data", data);
		modelMap.put("pb", pb);
				
		return mapper.writeValueAsString(modelMap);
	
	}

	
	
	
	//신고관리 페이지
	@RequestMapping(value="/reportManage")
	public ModelAndView reportManage(ModelAndView mav) {
		
		mav.setViewName("h/reportManage");
		return mav;
	}
	
}
