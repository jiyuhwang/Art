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
import com.gdj35.art.web.user.service.ISearchService;

@Controller
public class SearchController {
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ISearchService iSearchService;
	
	
	
	
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
		
		// 나의 사진, 그림갤러리 Ajax
		@RequestMapping(value = "/searchList",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String searchList(
				@RequestParam HashMap<String, String> params) throws Throwable {
		
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			//페이징처리
			int page = 1;
					
			if(params.get("page") != null) {
				page = Integer.parseInt(params.get("page"));
			}
			
			try {
			
				int cnt = iSearchService.getSCnt(params);
				
				PagingBean pb = iPagingService.getPagingBean(page, cnt, 12, 5);
				
			
				params.put("startCnt", Integer.toString(pb.getStartCount()));
				params.put("endCnt", Integer.toString(pb.getEndCount()));
						
				List<HashMap<String, String>> list = iSearchService.getSearchList(params);
				
				modelMap.put("cnt", cnt);
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				
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
