package com.mj.homeAdmin.admin.userManage.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.admin.userManage.model.service.UserManageSerivce;
import com.mj.homeAdmin.admin.userManage.vo.UserManage;
import com.mj.homeAdmin.comm.Pagination;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.notice.vo.Notice;

@Controller
@RequestMapping("/admin/userM/*")
public class UserManageController {

	@Autowired
	private UserManageSerivce us;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public UserManageController() {
		// TODO Auto-generated constructor stub
	}
	
	
	 @RequestMapping("index.do")
		public String index(UserManage vo,HttpSession ss,Model model,
				 @RequestParam(defaultValue="1") int curPage,
				RedirectAttributes rdAttr, HttpServletResponse response	) 
				  throws Exception
		{
			
		 model.addAttribute("curPage", curPage);
		 
		 
		//세션으로 가져오기
			vo.setId((String)ss.getAttribute("ssID"));
			
			
		 List<UserManage> list = us.userList(vo);
		 
		 model.addAttribute("list", list);
		 
			
			return "admin/userManage/index";
		}
	 

}
