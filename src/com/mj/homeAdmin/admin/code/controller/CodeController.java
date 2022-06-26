package com.mj.homeAdmin.admin.code.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.homeAdmin.admin.code.model.service.CodeSerivce;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Controller
@RequestMapping("/admin/code/*")
public class CodeController {

	@Autowired
	private CodeSerivce cs;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public CodeController() {
		// TODO Auto-generated constructor stub
	}
}
