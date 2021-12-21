package com.mj.homeAdmin.myinfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 @RequestMapping(value="loginGo.do", produces = "application/json; charset=utf-8")
	public String loginGo(MyinfoVo vo, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
		
		String result ="false";
		
			boolean chk = by.checkPw(vo);
			
	if(chk == true) {
		result ="true";
		//세션에 필요한 정보가져오기
		// 여기부터
		 List<MyinfoVo> user = ms.selectUser(vo);
		
		 vo.setId(user.get(0).getId());
		 vo.setNm(user.get(0).getNm());
		 vo.setnNm(user.get(0).getnNm());
		 vo.setGb(user.get(0).getGb());
	//	 System.out.println(user.get(0).getNm() + " 리스트 값");
	//	 System.out.println(vo.getNm() + " vo값");
		 
		// 세션에 세팅
		cm.goSessionChk(vo, ss, req);
		cm.getSessionChk(ss);
		model.addAttribute("user" ,vo);
		
	//	System.out.println(ss.getAttribute("ssNM") + " 세션 확인");
	}	
		
	return "../../main" ;
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
		
		
		@ResponseBody
		 @RequestMapping(value="logoutGo.do", produces = "application/json; charset=utf-8")
			public String logoutGo(MyinfoVo vo, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
				
			String result = "false";
			
			  ss.removeAttribute("ssID");
			  ss.removeAttribute("ssNM");
			  ss.removeAttribute("ssnNM");
			  ss.removeAttribute("ssGB");
			  ss.removeAttribute("ssIP");
			
			  result = "true";
			return result ;
			}
		
		/** 셀렉트 코드생성
		 * @return
		 */
		@RequestMapping("code.do")
		public String code(MyinfoVo vo, Model model) throws Exception{

			System.out.println(vo.getCd() + " 확인");
			List<MyinfoVo>list =  ms.selectCode(vo);
			
			model.addAttribute("list" ,list);
			model.addAttribute("cd" ,vo.getCd());
			
			System.out.println(list.get(0));
			return "myinfo/code";
		}
		
	
}
