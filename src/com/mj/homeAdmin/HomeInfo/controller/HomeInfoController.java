package com.mj.homeAdmin.HomeInfo.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.HomeInfo.model.vo.HomeInfoImpl;
import com.mj.homeAdmin.HomeInfo.model.vo.HomeInfoService;
import com.mj.homeAdmin.HomeInfo.vo.HomeInfo;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Controller
@RequestMapping("/homeInfo/*")
public class HomeInfoController {

	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@Autowired
	private HomeInfoImpl ms;

	@Autowired
	private HomeInfoService hs;
	
	@Autowired
	private CmmnServiceImpl cm;
	
	public HomeInfoController() {

	}

	// 집정보 입력 페이지
	@RequestMapping("insertView.do")
	public String inertHomeInfoView(ModelAndView mv)throws Exception{
        
		
		return "homeInfo/insert";
		
	}
	
	// 집정보입력
	@RequestMapping("insert.do")
	public ModelAndView insertHomeInfo(HomeInfo home, ModelAndView mv, Model model, HttpSession ss, HttpServletRequest req, RedirectAttributes rdAttr) throws Exception{
		
		home.setId((String)ss.getAttribute("ssID"));
		
		String status=null;
		String msg=null;
		
		System.out.print("인써트아이디" + home.getId());
		int result = hs.insertHomeInfo(home);
		
		if(result > 0) {
			status = "success";
			msg = "성공";
			mv.setViewName("redirect:/homeInfo/index.do");
		}else {
			status ="error";
			msg = "삭제";
			mv.setViewName("redirect:" + req.getHeader("referer"));
		}
		
		
		rdAttr.addFlashAttribute("msg", msg);
		rdAttr.addFlashAttribute("status", status); 
				
		return mv;
	}  
	// 집정보 조회
	@RequestMapping("index.do")
	public ModelAndView selectHomeInfo(HomeInfo home, Model model , HttpSession ss, HttpServletRequest req , ModelAndView mv) throws Exception{
		
		home.setId((String)ss.getAttribute("ssID"));
		
		HomeInfo selectHome = hs.selectHomeInfo(home.getId());
		System.out.println("계약이름 " + selectHome.getContractCnm());
		
		  mv.addObject("selectHome", selectHome);
			mv.setViewName("homeInfo/index");
			
			return mv;
	}
	
	// 수정화면
	@RequestMapping("updateView/{id}")
	public ModelAndView updateHomeInfoView(@PathVariable String id, HomeInfo vo, ModelAndView mv) throws Exception{
        HomeInfo selectHome = hs.selectHomeInfo(id);
		
        mv.addObject("selectHome", selectHome);
		mv.setViewName("homeInfo/update");
		
		return mv;
		
	}
	
	
	// 집정보 수정
	@RequestMapping(value = "update.do")
	public ModelAndView updateHomeInfo(HomeInfo vo, ModelAndView mv, HttpSession ss,  HttpServletRequest req, HttpServletResponse response, RedirectAttributes rdAttr) throws Exception{
		System.out.println("업뎃왓나?"); 
		System.out.println(vo.getId() + "id");
		System.out.println(vo.getHnm());
		System.out.println(vo.getSize());
		vo.setId((String)ss.getAttribute("ssID"));
		int result = hs.updateHomeInfo(vo);
		String url = null;
		String status = null;
		String msg = null;
		System.out.println("result" + result);
		
		if(result > 0) {
			status = "success";
			msg = "성공";
			mv.setViewName("redirect:/homeInfo/index.do");
		}else {
			status ="error";
			msg = "삭제";
			mv.setViewName("redirect:" + req.getHeader("referer"));
		}
		
		
		rdAttr.addFlashAttribute("msg", msg);
		rdAttr.addFlashAttribute("status", status); 
		
		//response.sendRedirect("/homeInfo/index.do");
		return mv;
	}
}
