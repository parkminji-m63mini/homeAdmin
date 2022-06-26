package com.mj.homeAdmin.admin.dash.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.admin.dash.model.service.DashService;
import com.mj.homeAdmin.admin.dash.vo.Dash;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.help.vo.Help;

@Controller
@RequestMapping("/admin/dash/*")
public class DashController {

		@Autowired
		private DashService ds;
		

		@Autowired
		private CmmnServiceImpl myutil;
		
		public DashController() {
			// TODO Auto-generated constructor stub
		}
	
		
		@RequestMapping("index.do")
		public String index(Dash vo, HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response) {
		
		return "admin/dash/index";
		}
}
