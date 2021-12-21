package com.mj.homeAdmin.food.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.model.service.FoodService;
import com.mj.homeAdmin.food.vo.Food;
import com.mj.homeAdmin.manageM.vo.ManageM;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Controller
@RequestMapping("/food/*")
public class FoodController {

	@Autowired
	private FoodService fs;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public FoodController() {
		
	}
	
	 @RequestMapping("index.do")
	    public String foodIndex(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			String url = "food/index";
			
		 // 냉장고 타입을 선택했는지 데이터 가져오기
		 int chkF = fs.frFind(vo);
		 
		 if(chkF == 1) { // 데이터 있음
			 // 나의 냉장고 가져오기 (+ 음식 리스트)
			 List<Food> arrList = fs.selectFr(vo);
			 // 여기부터 만들기
		 }else {
			 url ="food/typeChk";
		 }
		 
		 return url;
	    }
	
	 @RequestMapping("foodTypeInsert.do")
	    public String foodTypeInsert(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
		
		fs.insertType(vo);
			
		 return "food/index";
	    }
	
}
