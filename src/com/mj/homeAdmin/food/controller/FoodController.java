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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.model.service.FoodService;
import com.mj.homeAdmin.food.vo.Food;
import com.mj.homeAdmin.manageM.vo.ManageM;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.sun.xml.internal.bind.v2.runtime.Location;

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
		 
		 System.out.println(vo.getMode() +  " // mode");
		 
		 if(vo.getMode() == null) {
			 vo.setMode("0");
		 }
		 
		 if(chkF != null) { // 데이터 있음
			
		 }else {
			 url ="food/typeChk";
		 }
		 
		 model.addAttribute("vo", vo);
		 
		 
		 return url;
	    }
	
	 @RequestMapping("frTypeProc.do")
	    public String frTypeProc(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			System.out.println(vo.getChk() +  " : chF ");
			
			List<Food> arrListTop = null;
			List<Food> arrListBottom = null;
		 // 냉장고 타입을 선택했는지 데이터 가져오기
		 String chkF = fs.frFind(vo);
		 
		 System.out.println(chkF +  " : chkF ");
		 
		 // 냉장고 IDX 가져오기 세팅
		 vo.setJidx(fs.frJidx(vo));
		 
		 System.out.println(vo.getJidx() +  " : jidx ");
		 
		 String url = "";
		 
		 if(chkF != null) { // 냉장고 타입 데이터 있음
			 // 나의 냉장고 가져오기 (+ 음식 리스트)
			 vo.setArea("TP01"); // 냉동실
			  arrListTop = fs.selectFr(vo);
			  
			  vo.setArea("TP02");
			  arrListBottom = fs.selectFr(vo);
		 }
		 
		 
		 if(chkF.equals("FR01")) {
			url = "food/type/fr01";
		 }
		 
		 model.addAttribute("arrListTop", arrListTop);
		 model.addAttribute("arrListBottom", arrListBottom);
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
	    public void fr01Insert(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
				
			System.out.println("ddd/ " + Arrays.toString(vo.getFnmL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getBdtL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getFdtL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getVmL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getPriceL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getChkL()));
			System.out.println("ddd/ " + Arrays.toString(vo.getfAreaL()));
			if(vo.getFnmL().length == 1) {
				System.out.println("1 임");
				
				vo.setFnm(vo.getFnmL()[0]);
				
				if(vo.getBdtL().length == 0) {
					vo.setBdt("0000-00-00");
				}else {
					vo.setBdt(vo.getBdtL()[0]);
				}
				if(vo.getFdtL().length == 0) {
					vo.setFdt("0000-00-00");
				}else {
					vo.setFdt(vo.getFdtL()[0]);
				}
				if(vo.getVmL().length == 0) {
					vo.setVm("");
				}else {
					vo.setVm(vo.getVmL()[0]);
				}
				if(vo.getPriceL().length == 0) {
					vo.setPrice("");
				}else {
					vo.setPrice(vo.getPriceL()[0]);
				}
				if(vo.getfAreaL().length == 0) {
					vo.setArea("");
				}else {
					vo.setArea(vo.getfAreaL()[0]);
				}
				
				fs.fr01InsertOne(vo);
			}else {
				
				fs.fr01Insert(vo);
			}

			
			
			
			response.sendRedirect("index.do?mode=0");
			
	    }
	 @ResponseBody
	 @RequestMapping(value="update.do", produces = "application/json; charset=utf-8")
	 public String update(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
			 throws Exception
	 {
		 String result = "false";
		 
		 //세션으로 가져오기
		 vo.setuId((String)ss.getAttribute("ssID"));
		 
		 System.out.println("ddd/ " + Arrays.toString(vo.getFnmL()));
		 System.out.println("ddd/ " + Arrays.toString(vo.getBdtL()));
		 System.out.println("ddd/ " + Arrays.toString(vo.getVmL()));
		 System.out.println("ddd/ " + Arrays.toString(vo.getPriceL()));
		 System.out.println("ddd/ " + Arrays.toString(vo.getIdxL()));
		 System.out.println("ddd/ " + Arrays.toString(vo.getChkL()));
		 System.out.println("ddd/ " + Arrays.toString(vo.getfAreaL()));
		 System.out.println("ddd/ " + vo.getJidx());
		 
		 String idx [] = vo.getIdxL();
		 
		 for (int i = 0; i < vo.getIdxL().length; i++) {
			 
			 // idx가 0 이면 insert 해야하는 데이터 임으로 insert
			if(idx[i].equals("0")) {
				
				vo.setFnm(vo.getFnmL()[i]);
				vo.setArea(vo.getfAreaL()[i]);
				vo.setPrice(vo.getPriceL()[i]);
				
				vo.setBdt(fs.dtNullRp(vo.getBdtL()[i]));
				vo.setFdt(fs.dtNullRp(vo.getFdtL()[i]));
				vo.setVm(vo.getVmL()[i]);
				
				 fs.fr01InsertOne(vo);
				
			}else {
				vo.setIdx(Integer.parseInt(vo.getIdxL()[i]));
				vo.setChk(vo.getChkL()[i].charAt(0));
				vo.setFnm(vo.getFnmL()[i]);
				vo.setFnm(vo.getFnmL()[i]);
				vo.setPrice(vo.getPriceL()[i]);
				
				
				vo.setBdt(fs.dtNullRp(vo.getBdtL()[i]));
				vo.setFdt(fs.dtNullRp(vo.getFdtL()[i]));
				
				vo.setVm(vo.getVmL()[i]);
				
				fs.fr01Update(vo);
			}
		}
		 
		 
		 //response.sendRedirect("index.do");
		 result = "true";
		 
		 return "true";
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="delete.do", produces = "application/json; charset=utf-8")
	 public String delete(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
			 throws Exception
	 {
		 String result = "flase";
		 
		 System.out.println(vo.getJidx() + " / / " + vo.getIdxL());
		 
		 fs.fr01delete(vo);
		 if(vo.getIdxL() != null) {
			 result = "true";
		 }else {
			 result ="index.do";
		 }
		 return result;
	 }
	 
	 @ResponseBody // 상세등록 1개씩  여기부터!!!!
	 @RequestMapping(value="insertOne.do", produces = "application/json; charset=utf-8")
	 public String insertOne(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
			 throws Exception
	 {
		 String result = "flase";
		 
		 System.out.println(vo.getArea() + " / / " );
		 
		vo.setBdt(fs.dtNullRp(vo.getBdt()));
		vo.setFdt(fs.dtNullRp(vo.getFdt()));
				 
		 
		 fs.fr01InsertOne(vo);
		 if(vo.getIdxL() != null)result = "true";
			 
		 return result;
	 }
	
	
	 @RequestMapping("view.do")
	    public String view(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));

		List<Food> arrList = null;
		
		if(vo.getIdx() != 0) {
			arrList = fs.selectFr(vo);
		}
		
		 model.addAttribute("arrList", arrList);
		 model.addAttribute("vo", vo);
		 
		 return "food/view";
	    }
	 
	 @RequestMapping("updateAll.do") // 식재료 상세 업데이트
	    public void updateAll(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			vo.setBdt(fs.dtNullRp(vo.getBdt()));
			vo.setFdt(fs.dtNullRp(vo.getFdt()));
			
			fs.fr01Update(vo);
			
			response.sendRedirect("index.do?mode=" + vo.getMode());
	    }
	 
	 
	 
	 // 사용완료 체크시 업데이트
	 @ResponseBody
	 @RequestMapping(value="updateChk.do", produces = "application/json; charset=utf-8")
	 public String updateChk(Food vo, MyinfoVo mvo,  HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
			 throws Exception
	 {
		 String result = "false";
		 
		 //세션으로 가져오기
		 vo.setuId((String)ss.getAttribute("ssID"));
		 
		 System.out.println("ddd/ " + vo.getJidx());
		
				 fs.updateChk(vo);
		 
		 
		 //response.sendRedirect("index.do");
		 result = "true";
		 
		 return "true";
	 }
	 
}
