package com.mj.homeAdmin.food.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
			List<Food> arrList = null;
		 // 냉장고 타입을 선택했는지 데이터 가져오기
		 String chkF = fs.frFind(vo);
		 
		 if(chkF != null) { // 데이터 있음
			 // 나의 냉장고 가져오기 (+ 음식 리스트)
			  arrList = fs.selectFr(vo);
			 // 여기부터 만들기
		 }else {
			 url ="food/typeChk";
		 }
		 
		 model.addAttribute("arrList", arrList);
		 
		 return url;
	    }
	
	 @RequestMapping("frTypeProc.do")
	    public String frTypeProc(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			List<Food> arrList = null;
		 // 냉장고 타입을 선택했는지 데이터 가져오기
		 String chkF = fs.frFind(vo);
		 
		 // 냉장고 IDX 가져오기 세팅
		 vo.setJidx(fs.frJidx(vo));
		 
		 String url = "";
		 
		 if(chkF != null) { // 냉장고 타입 데이터 있음
			 // 나의 냉장고 가져오기 (+ 음식 리스트)
			  arrList = fs.selectFr(vo);
		 }
		 
		 
		 if(chkF.equals("FR01")) {
			url = "food/type/fr01";
		 }
		 
		 model.addAttribute("arrList", arrList);
		 model.addAttribute("chkF", chkF);
		 model.addAttribute("vo", vo);
		 
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
	 
	 @RequestMapping("fr01Insert.do")
	    public String fr01Insert(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
				
			System.out.println("ddd/ " + Arrays.toString(vo.getFnmL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getBdtL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getVmL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getPriceL()));
		
			fs.fr01Insert(vo);
			
		 return "food/index";
	    }
	
	
}
