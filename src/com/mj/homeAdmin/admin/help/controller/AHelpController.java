package com.mj.homeAdmin.admin.help.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.admin.help.model.service.AHelpService;
import com.mj.homeAdmin.admin.help.vo.AHelp;
import com.mj.homeAdmin.admin.userManage.vo.UserManage;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.help.vo.Help;

@Controller
@RequestMapping("/admin/help/*")
public class AHelpController {

	@Autowired
	private AHelpService hs;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public AHelpController() {
		// TODO Auto-generated constructor stub
	}
	
	 @RequestMapping("index.do")
		public String index(AHelp vo,HttpSession ss,Model model,
				 @RequestParam(defaultValue="1") int curPage,
				RedirectAttributes rdAttr, HttpServletResponse response	) 
				  throws Exception
		{
			
		 model.addAttribute("curPage", curPage);
		 
		 
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			
		 List<AHelp> list = hs.helpList(vo);
		 
		 model.addAttribute("list", list);
		 
			
			return "admin/help/index";
		}
	 
	 @RequestMapping("view.do")
		public String view(AHelp vo,HttpSession ss,Model model,
				 @RequestParam(defaultValue="1") int curPage,
				RedirectAttributes rdAttr, HttpServletResponse response	) 
				  throws Exception
		{
			
		 
		 
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			
		 AHelp list = hs.viewList(vo);
		 
		 model.addAttribute("list", list);
		 
			
			return "admin/help/view";
		}
	 
}
