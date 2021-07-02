package com.gdj35.art.web.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IMyGallaryService;

@Controller
public class MyGallaryController {
	
	@Autowired
	public IMyGallaryService iMyGallaryService;
	
	@Autowired
	public IPagingService iPagingService;

	
	
	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("JY/header");
		
		return mav;
	}
	
	@RequestMapping(value = "/footer")
	public ModelAndView footer(ModelAndView mav) {
		mav.setViewName("JY/footer");
		
		return mav;
	}
	
	@RequestMapping(value = "/edit")
	public ModelAndView edit(ModelAndView mav) {
		mav.setViewName("JY/edit");
		
		return mav;
	}
	
	@RequestMapping(value = "/gallary")
	public ModelAndView gallary(ModelAndView mav) {
		mav.setViewName("JY/gallary");
		
		return mav;
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("JY/main");
		
		return mav;
	}
	
	@RequestMapping(value = "/mydetail")
	public ModelAndView mydetail(ModelAndView mav) {
		mav.setViewName("JY/mydetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/mygallary")
	public ModelAndView mygallary(ModelAndView mav) {
		mav.setViewName("JY/mygallary");
		
		return mav;
	}
	
	@RequestMapping(value = "/other_detail")
	public ModelAndView otherDetail(ModelAndView mav) {
		mav.setViewName("JY/other_detail");
		
		return mav;
	}
	
	@RequestMapping(value = "/other_gallary")
	public ModelAndView otherGllary(ModelAndView mav) {
		mav.setViewName("JY/other_gallary");
		
		return mav;
	}
	
	@RequestMapping(value = "/popup")
	public ModelAndView popup(ModelAndView mav) {
		mav.setViewName("JY/popup");
		
		return mav;
	}
	
	@RequestMapping(value = "/profile")
	public ModelAndView profile(ModelAndView mav) {
		mav.setViewName("JY/profile");
		
		return mav;
	}
	
	@RequestMapping(value = "/set")
	public ModelAndView set(ModelAndView mav) {
		mav.setViewName("JY/set");
		
		return mav;
	}
	
	@RequestMapping(value = "/sidebar")
	public ModelAndView sidebar(ModelAndView mav) {
		mav.setViewName("JY/sidebar");
		
		return mav;
	}
	
	@RequestMapping(value = "/sidebar2")
	public ModelAndView sidebar2(ModelAndView mav) {
		mav.setViewName("JY/sidebar2");
		
		return mav;
	}
	
	@RequestMapping(value = "/withdrawal")
	public ModelAndView withdrawal(ModelAndView mav) {
		mav.setViewName("JY/withdrawal");
		
		return mav;
	}
	
	@RequestMapping(value = "/writing")
	public ModelAndView writing(ModelAndView mav) {
		mav.setViewName("JY/writing");
		
		return mav;
	}
}
