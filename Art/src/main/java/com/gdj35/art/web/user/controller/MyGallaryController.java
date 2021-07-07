package com.gdj35.art.web.user.controller;

import java.util.HashMap;
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

	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("JY/header");

		return mav;
	}
	
	@RequestMapping(value = "/header2")
	public ModelAndView header2(ModelAndView mav) {
		mav.setViewName("JY/header2");

		return mav;
	}

	@RequestMapping(value = "/footer")
	public ModelAndView footer(ModelAndView mav) {
		mav.setViewName("JY/footer");

		return mav;
	}
	
	
	@RequestMapping(value = "/edit")
	public ModelAndView edit(HttpSession session, ModelAndView mav) throws Throwable {

		
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/edit");
			
			
		} else {
			
			mav.setViewName("redirect:main");
		}

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
	public ModelAndView mydetail(HttpSession session, ModelAndView mav) throws Throwable {

		
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/mydetail");
			
			
		} else {
			
			mav.setViewName("redirect:main");
		}

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



	
	@RequestMapping(value = "/writing")
	public ModelAndView writing(HttpSession session, ModelAndView mav) throws Throwable {

		
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/writing");
			
			
		} else {
			
			mav.setViewName("redirect:main");
		}

		return mav;
	}
	
	@RequestMapping(value = "/writes",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String writes(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = iMyGallaryService.addPost(params);
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
