package com.gdj35.art.web.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/Logins",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8") // 오타 절대 금지
	@ResponseBody // Spring에 View임을 제시
	public String Logins(HttpSession session, 
						  @RequestParam HashMap<String, String> params) throws Throwable {
	
	ObjectMapper mapper = new ObjectMapper();

	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	// mPw의 값을 암호화 후 mPw로 넣겠다.
	//params.put("mPw", Utils.encryptAES128(params.get("mPw")));
	
	//System.out.println(Utils.decryptAES128(params.get("mPw")));
	
	HashMap<String, String> data = iMemberService.getUser(params);
	
	if(data != null) {
		session.setAttribute("sUserNo", data.get("USER_NO"));
		session.setAttribute("sUserId", data.get("USER_ID"));
		session.setAttribute("sUserNickname", data.get("USER_NICKNAME"));
		session.setAttribute("sUserPw", data.get("PW"));
		session.setAttribute("sUserProfileImg", data.get("PROFILE_IMG_PATH"));
		session.setAttribute("sUserName", data.get("NAME"));
		session.setAttribute("sUserPhone", data.get("PHONE_NO"));
		session.setAttribute("sUserSex", data.get("SEX"));
		session.setAttribute("sUserBirth", data.get("BIRTHDAY"));
		session.setAttribute("sUserMail", data.get("MAIL"));
		session.setAttribute("sUserIntroduce", data.get("INTRODUCE"));
		session.setAttribute("sUserEventAgree", data.get("EVENT_AGREEMENT"));
		modelMap.put("resMsg", "success");
	} else {
		modelMap.put("resMsg", "failed");
	}
	
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/Logout")
	public ModelAndView Logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		
		mav.setViewName("redirect:main");
		
		return mav;
	}
	
	@RequestMapping(value = "/profile")
	public ModelAndView profile(HttpSession session,
								@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		params.put("userNo", String.valueOf(session.getAttribute("sUserNo")));
		
		HashMap<String, String> data = iMemberService.getUser2(params);
		
		mav.addObject("data", data);
		
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/profile");
			
			
		} else {
			
			mav.setViewName("redirect:main");
		}

		return mav;
	}

	@RequestMapping(value = "/profiles", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String profiles(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		/*
		 * session.setAttribute("sUserNickname", params.get("userNickname"));
		 * session.setAttribute("sUserIntroduce", params.get("userIntroduce"));
		 */

		int cnt = iMemberService.updateProfile(params);

		try {
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

	@RequestMapping(value = "/set")
	public ModelAndView set(HttpSession session,
							@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		params.put("userNo", String.valueOf(session.getAttribute("sUserNo")));
		
		HashMap<String, String> data = iMemberService.getUser2(params);
		
		mav.addObject("data", data);
		if(session.getAttribute("sUserNo") != null) {

			mav.setViewName("JY/set");
			
		} else {
			
			mav.setViewName("redirect:main");
		}

		return mav;
	}

	@RequestMapping(value = "/sets", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String sets(HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		/*
		 * session.setAttribute("sUserPw", params.get("userPw"));
		 * session.setAttribute("sUserName", params.get("userName"));
		 * session.setAttribute("sUserSex", params.get("gender"));
		 * session.setAttribute("sUserBirth", params.get("birthYear") + '-' +
		 * params.get("birthMonth") + '-' + params.get("birthDay"));
		 * session.setAttribute("sUserPhone", params.get("userPhone"));
		 * session.setAttribute("sUserMail", params.get("userMail"));
		 * session.setAttribute("sUserEventAgree", params.get("userEventAgree"));
		 */
		
		int cnt = iMemberService.updateSet(params);

		try {

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
	
	
	//지유야 이거만 여기다 하마!!
	@RequestMapping(value="/gongji")
	public ModelAndView gongji(ModelAndView mav) {
		
		mav.setViewName("/HD/gongji");
		return mav;
	}
}
