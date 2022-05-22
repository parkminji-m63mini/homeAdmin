package com.mj.homeAdmin.checkList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mj.homeAdmin.checkList.model.service.checkListService;
import com.mj.homeAdmin.checkList.vo.checkList;

@SessionAttributes({"loginMemger"})

@Component
@RequestMapping("/checkList/*")
public class checkListController {

	@Autowired
	private checkListService cs;
	
	// 조회화면
	@RequestMapping("index.do")
	public String checkListView(checkList vo, HttpSession ss, Model model) throws Exception{
		System.out.println("체크리스트 : " );
		vo.setId((String)ss.getAttribute("ssID"));
		
		List<checkList> list = null;
		List<checkList> listDetail = null;
		
		
		list = cs.selectCheckList(vo.getId());
		listDetail = cs.selectCheckListDetail(vo.getId());
		
		model.addAttribute("checkList", list);
		model.addAttribute("checkListDetail", listDetail);
		
		
		return "checkList/index";
	}
	
	// 수정화면조회
	@RequestMapping("updateView/{idx}")
	public String updateView(@PathVariable int idx, checkList vo, HttpSession ss, Model model ) throws Exception{
		
		List<checkList> listDetail = null;
		vo.setIdx(idx);
		vo.setId((String)ss.getAttribute("ssID"));
		listDetail = cs.checkListDetailView(vo);
		
		System.out.println("업뎃" + listDetail.get(0).getListName());
		model.addAttribute("checkListDetail", listDetail);		
		
		return "checkList/update";
	}
	
	// 수정
	@RequestMapping("update/{idx}")
	public ModelAndView updateAction(@PathVariable int idx, checkList vo, ModelAndView mv) throws Exception{
		System.out.println("idx :" + idx);
		
		vo.setIdx(idx);
		
		int result = cs.checkListUpdate(vo);
		
		
		//return "checkList/index";
		return mv;
	}
	
	// 입력화면
	@RequestMapping("insertView")
	public String insertView() throws Exception{
		return "checkList/insert";
	}
	
	// 입력
	@ResponseBody
	@RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
	public ModelAndView insert( String[] contentL, checkList vo, ModelAndView mv,HttpSession ss) throws Exception{
		
		vo.setId((String)ss.getAttribute("ssID"));
		vo.setListName(vo.getListName());
		
		System.out.println("Id : " + vo.getId());
		System.out.println("ListName : " +vo.getListName());
		
		
		int chk = cs.insertCheckList(vo);
		int result = 0;
		System.out.println("listName : " + vo.getListName());
		System.out.println("contentL : " + contentL[0]);
		
		if (chk > 0) {
			for (int i=0 ; i< contentL.length; i++) {
				vo.setContent(contentL[i]);
				vo.setdIdx(i+1);
				result = cs.insertCheckListDetail(vo);
				
				
			}
			
		}
		mv.setViewName("redirect:/checkList/index.do");
		return mv;
	}
	
}
