package com.gdj35.art.web.user.controller;

import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.art.common.service.IPagingService;
import com.gdj35.art.web.user.service.IMemberService;

@Controller
public class MemberController{
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
    private JavaMailSender mailSender;
	
	
	@Autowired
	public IMemberService iMemberService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        logger.info("이메일 데이터 전송 확인");
	        logger.info("인증번호 : " + email);
	                
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        logger.info("인증번호 " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "artproject21@naver.com";
	        String toMail = email;
	        String title = "Art 회원가입 인증 이메일 입니다.";
	        String content = 
	                "Art 홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요." +
	                "<br>" + 
	                "감사합니다:)";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	 
	        
	        String num = Integer.toString(checkNum);
			
	        return num;
	        
	    }

	
	@RequestMapping(value = "/signUp")
	public ModelAndView signUp(ModelAndView mav) {
		mav.setViewName("JY/signUp");
		
		return mav;
	}
	
	@RequestMapping(value = "/signUps",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String signUps(@RequestParam HashMap<String, String> params) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iMemberService.addUser(params);
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
	
	@RequestMapping(value = "/idCheck",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam HashMap<String, String> params) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iMemberService.idCheck(params);
			if(cnt > 0) {		
				modelMap.put("msg", "exist");
			} else {
				modelMap.put("msg", "none");
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
	
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/nicknameCheck",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String nicknameCheck(@RequestParam HashMap<String, String> params) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iMemberService.nicknameCheck(params);
			if(cnt > 0) {		
				modelMap.put("msg", "exist");
			} else {
				modelMap.put("msg", "none");
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
	
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
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
