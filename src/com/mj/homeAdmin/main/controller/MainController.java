package com.mj.homeAdmin.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mj.homeAdmin.main.model.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService service;
	
	@RequestMapping("/getHomeImg")
	public String getHomeImg(HttpSession ss) throws Exception {
		String id = (String)ss.getAttribute("ssID");
		String img = service.getHomeImg(id);
		System.out.println(img);
		Gson gson = new GsonBuilder().create();
		return gson.toJson(img);
	}
	
}
