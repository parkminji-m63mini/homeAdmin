package com.mj.homeAdmin.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mj.homeAdmin.main.model.service.MainService;

@Controller
@RequestMapping("/main/")
public class MainController {

	@Autowired
	private MainService service;
	
	@RequestMapping(value = "getData.do", produces = "application/json; charset=utf-8")
	public String getHomeImg(HttpSession ss, String id, Model model) throws Exception {
		System.out.println("아이디 : " + id);
		model.addAttribute("id", id);
		
		return "redirect:/";
	}
	
	
}
