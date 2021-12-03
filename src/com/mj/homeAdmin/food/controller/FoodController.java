package com.mj.homeAdmin.food.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.model.service.FoodServiceImpl;
import com.mj.homeAdmin.manageM.vo.ManageM;

@Controller
@RequestMapping("/food/*")
public class FoodController {

	@Autowired
	private FoodServiceImpl fs;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public FoodController() {
		
	}
	
	 @RequestMapping("index.do")
	    public String foodIndex(ManageM vo, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		 
		 return "food/index";
	    }
	
	
}
