package com.mj.homeAdmin.myinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.homeAdmin.comm.BCryptTest;
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
	
	public MyinfoController() {
		
	}
	
	/** 로그인 페이지 이동
	 * @return
	 */
	@RequestMapping("login.do")
	public String login() {
		
		
		return "myinfo/login";
	}
	
	
	// 회원가입 만들고 시도
	@RequestMapping("loginGo.do")
	public String loginGo(MyinfoVo vo) throws Exception{
		
		String result ="false";
		
			boolean chk = by.checkPw(vo);
		if(chk == true) {
		result ="true";
		}	
		
		// 비밀번호 신규 암호화
		//String pw = by.encry("test");
		
		return result;
	}
	
	// 회원가입 페이지
		@RequestMapping("join.do")
		public String join(MyinfoVo vo) throws Exception{
			return "myinfo/join";
		}
			
			
	
}
