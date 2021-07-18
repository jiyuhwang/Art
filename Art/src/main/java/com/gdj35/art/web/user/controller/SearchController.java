package com.gdj35.art.web.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	


}
