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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.art.common.bean.PagingBean;
import com.gdj35.art.common.service.IPagingService;

@Controller
public class SearchController {
	
	@Autowired
	public IPagingService iPagingService;
	
	
	
	
	@RequestMapping(value="/searchPage")
	public ModelAndView searchPage(ModelAndView mav) {
		
		mav.setViewName("h/searchPage");
		return mav;
	}
	
	
	
	//------------------------------------------------검색페이지
	
		@RequestMapping(value="/searchGallaryPage")
		public ModelAndView searchGallaryPage(ModelAndView mav) {
			
			mav.setViewName("h/searchGallaryPage");
			return mav;
		}
		
		// 나의 사진갤러리 Ajax
		@RequestMapping(value = "/searchGallary",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String searchGallary(@RequestParam HashMap<String, String> params) throws Throwable {
		
			ObjectMapper mapper = new ObjectMapper();
			System.out.println("========================" + params);
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			int page = Integer.parseInt(params.get("page"));
			
			int cnt;
			
		/*
		 * PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 5);
		 * 
		 * 
		 * params.put("startCnt", Integer.toString(pb.getStartCount()));
		 * params.put("endCnt", Integer.toString(pb.getEndCount()));
		 * 
		 * List<HashMap<String, String>> list;
		 * 
		 * modelMap.put("list", list); modelMap.put("pb", pb);
		 */
			
			return mapper.writeValueAsString(modelMap);
		}


}
