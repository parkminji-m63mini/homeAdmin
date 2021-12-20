package com.mj.homeAdmin.myinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mj.homeAdmin.comm.BCryptTest;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.myinfo.model.service.MyinfoServiceImpl;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.sun.org.apache.regexp.internal.RE;


@Controller
@RequestMapping("/my/*")
public class MyinfoController {

	@Autowired
	private MyinfoServiceImpl ms;

	@Autowired
	private BCryptTest by;
	
	@Autowired
	private CmmnServiceImpl cm;
	
	public MyinfoController() {
		
	}
	
	/** 로그인 페이지 이동
	 * @return
	 */
	@RequestMapping("login.do")
	public String login() {
		
		
		return "myinfo/login";
	}
	
	
	// 로그인
	 @ResponseBody
	 @RequestMapping(value="loginGo.do", produces = "application/json; charset=utf-8")
	public String loginGo(MyinfoVo vo,  HttpSession ss, HttpServletRequest req) throws Exception{
		
		String result ="false";
		
			boolean chk = by.checkPw(vo);
			
	if(chk == true) {
		result ="true";
		//세션에 필요한 정보가져오기
		// 여기부터
		
		// 세션에 세팅
		cm.goSessionChk(vo, ss, req);
		
	}	
		
		return result;
	}
	
	// 회원가입 페이지
		@RequestMapping("join.do")
		public String join(MyinfoVo vo) throws Exception{
			return "myinfo/join";
		}
			
		// 회원가입  완료 or 실패
		@RequestMapping("signUp.do")
		public String signUp(MyinfoVo vo) throws Exception{
			

			// 비밀번호 신규 암호화
			String pw = by.encry(vo.getPw());
			vo.setPw(pw);
			
			ms.signUp(vo);
			
			
			
			return "../../main";
		}		
	
}
