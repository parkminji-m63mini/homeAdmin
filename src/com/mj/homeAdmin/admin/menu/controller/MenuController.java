package com.mj.homeAdmin.admin.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.homeAdmin.admin.menu.model.service.MenuSerivce;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Controller
@RequestMapping("/admin/menu/*")
public class MenuController {

	@Autowired
	private MenuSerivce ms;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public MenuController() {
		// TODO Auto-generated constructor stub
	}
}
