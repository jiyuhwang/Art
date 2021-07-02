package com.gdj35.art.web.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IMemberService;

@Controller
public class MemberController{
	
	@Autowired
	public IMemberService iMemberService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/agree")
	public ModelAndView agree(ModelAndView mav) {
		mav.setViewName("YM/agree");
		
		return mav;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("YM/join");
		
		return mav;
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("YM/login");
		
		return mav;
	}
	
	//지유야 이거만 여기다 하마!!
	@RequestMapping(value="/gongji")
	public ModelAndView gongji(ModelAndView mav) {
		
		mav.setViewName("/HD/gongji");
		return mav;
	}
}
