package com.mj.homeAdmin.admin.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.admin.help.vo.AHelp;
import com.mj.homeAdmin.admin.notice.model.service.ANoticeSerivce;
import com.mj.homeAdmin.admin.notice.vo.ANotice;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Controller
@RequestMapping("/admin/notice/*")
public class ANoticeController{

	@Autowired
	private ANoticeSerivce ns;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public ANoticeController() {
		// TODO Auto-generated constructor stub
	}
	
	
	 @RequestMapping("index.do")
		public String index(ANotice vo,HttpSession ss,Model model,
				 @RequestParam(defaultValue="1") int curPage,
				RedirectAttributes rdAttr, HttpServletResponse response	) 
				  throws Exception
		{
			
		 model.addAttribute("curPage", curPage);
		 
		 
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			
		 List<ANotice> list = ns.noticeList(vo);
		 
		 model.addAttribute("list", list);
		 
			
			return "admin/notice/index";
		}
	 
}
