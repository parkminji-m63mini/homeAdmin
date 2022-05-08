package com.mj.homeAdmin.HomeInfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.HomeInfo.model.vo.HomeInfoImpl;
import com.mj.homeAdmin.HomeInfo.model.vo.HomeInfoService;
import com.mj.homeAdmin.HomeInfo.vo.HomeInfo;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Controller
@RequestMapping("/homeInfo/*")
public class HomeInfoController {

	@Autowired
	private HomeInfoImpl ms;

	@Autowired
	private HomeInfoService hs;
	
	@Autowired
	private CmmnServiceImpl cm;
	
	public HomeInfoController() {

	}

	// 집정보입력 페이지
	@RequestMapping("insertHomeInfo.do")
	public String insertHomeInfo(HomeInfo home, MyinfoVo my, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
		System.out.println("인써트 :");
		home.setId((String)ss.getAttribute("ssID"));
		hs.insertHomeInfo(home);
		
		return "homeInfo/index";
	}
	// 집정보 조회
	@RequestMapping("index.do")
	public String selectHomeInfo(HomeInfo home, Model model , HttpSession ss, HttpServletRequest req ) throws Exception{
		System.out.println("집정보 왔나?");
		home.setId((String)ss.getAttribute("ssID"));
		System.out.println(home.getId());
		HomeInfo selectHome = hs.selectHomeInfo(home.getId());
		
		model.addAttribute("selectHome", selectHome);
		//System.out.println("selectHome" + selectHome.getSize());
		return "homeInfo/index";
	}
	
	@RequestMapping("updateHomeInfo.do")
	public String updateHomeInfo(HomeInfo home, Model model, HttpSession ss,  HttpServletRequest req) throws Exception{
		System.out.println("업데이트 :");
		home.setId((String)ss.getAttribute("ssID"));
		
		int result = hs.updateHomeInfo(home);
		
		String msg = null;
		String status = null;
		
		if(result > 0) {
			model.addAttribute("updateHome", home);
			status = "success";
			msg = "정보가 수정되었습니다.";
			
		}else {
			status = "error";
			msg = "정보 수정에 실패하였습니다";
			
		}
		System.out.println("msg :" + msg);
		return "homeInfo/index";
	}
}
