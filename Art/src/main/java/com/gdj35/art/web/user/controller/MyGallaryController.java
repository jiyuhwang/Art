package com.gdj35.art.web.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IMyGallaryService;

@Controller
public class MyGallaryController {

	@Autowired
	public IMyGallaryService iMyGallaryService;
	
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/edit")
	public ModelAndView edit(ModelAndView mav) {
		mav.setViewName("PJ/edit");
		
		return mav;
	}
	
	@RequestMapping(value = "/gallary")
	public ModelAndView gallary(ModelAndView mav) {
		mav.setViewName("PJ/gallary");
		
		return mav;
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("PJ/main");
		
		return mav;
	}
	
	@RequestMapping(value = "/mydetail")
	public ModelAndView mydetail(ModelAndView mav) {
		mav.setViewName("PJ/mydetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/mygallary")
	public ModelAndView mygallary(ModelAndView mav) {
		mav.setViewName("PJ/mygallary");
		
		return mav;
	}
	
	@RequestMapping(value = "/other_detail")
	public ModelAndView otherDetail(ModelAndView mav) {
		mav.setViewName("PJ/other_detail");
		
		return mav;
	}
	
	@RequestMapping(value = "/other_gallary")
	public ModelAndView otherGllary(ModelAndView mav) {
		mav.setViewName("PJ/other_gallary");
		
		return mav;
	}
	
	@RequestMapping(value = "/popup")
	public ModelAndView popup(ModelAndView mav) {
		mav.setViewName("PJ/popup");
		
		return mav;
	}
	
	@RequestMapping(value = "/profile")
	public ModelAndView profile(ModelAndView mav) {
		mav.setViewName("PJ/profile");
		
		return mav;
	}
	
	@RequestMapping(value = "/set")
	public ModelAndView set(ModelAndView mav) {
		mav.setViewName("PJ/set");
		
		return mav;
	}
	
	@RequestMapping(value = "/sidebar")
	public ModelAndView sidebar(ModelAndView mav) {
		mav.setViewName("PJ/sidebar");
		
		return mav;
	}
	
	@RequestMapping(value = "/sidebar2")
	public ModelAndView sidebar2(ModelAndView mav) {
		mav.setViewName("PJ/sidebar2");
		
		return mav;
	}
	
	@RequestMapping(value = "/withdrawal")
	public ModelAndView withdrawal(ModelAndView mav) {
		mav.setViewName("PJ/withdrawal");
		
		return mav;
	}
	
	@RequestMapping(value = "/writing")
	public ModelAndView writing(ModelAndView mav) {
		mav.setViewName("PJ/writing");
		
		return mav;
	}
}
