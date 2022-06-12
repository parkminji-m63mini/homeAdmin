// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HomeController.java

package com.mj.homeAdmin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.myinfo.model.service.MyinfoService;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Controller
public class HomeController
{
	@Autowired
	private MyinfoService ms;
	@Autowired
	private CmmnServiceImpl cm;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "../../main";
	}
	
	@RequestMapping(value = "/snsLogin", method = RequestMethod.GET)
	public String snsLogin() {
		return "../snsLogin";
	}
	
	
	@RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String naverLogin() {
		return "../naverLogin";
	}
	
	
	
	@ResponseBody
	 @RequestMapping(value="login.do", produces = "application/json; charset=utf-8")
	 public String login(MyinfoVo vo,  HttpSession ss, Model model, RedirectAttributes rdAttr,HttpServletRequest req)
			 throws Exception{
			 String result ="false";
	
			
			 // 아이디가 존재하는지 확인
			 String chk = ms.idChk(vo);
			 
			 // 아이디 없다면
			 if(chk == null || chk.equals("") || chk.isEmpty() == true) {
			 
				 // 임의 셋팅
				 vo.setGb('1');
				 vo.setLtype("1");
				 vo.setHtype("1");
				 
				 ms.signUp(vo);
			 }	 
				 
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
				 
			
				
			 
		result ="true";
		model.addAttribute("user" ,vo);
		
			System.out.println(ss.getAttribute("ssNM") + " 세션 확인");
		
		return "../../main" ;
		}
	
	
	
	
	
	
	@RequestMapping(value = "/code.do", method = RequestMethod.GET)
	public String code()  throws Exception{
		System.out.println("코드 들어옴");
		return "../common/code";
	}
}
