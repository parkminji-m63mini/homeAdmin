package com.mj.homeAdmin.checkList.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.checkList.model.service.checkListService;
import com.mj.homeAdmin.checkList.vo.checkList;

@SessionAttributes({"loginMemger"})

@Component
@RequestMapping("/checkList/*")
public class checkListController {

	@Autowired
	private checkListService service;
	
	// 조회화면
	@RequestMapping("index.do")
	public String checkListView(checkList vo, HttpSession ss, Model model) throws Exception{
		System.out.println("체크리스트 : " );
		vo.setId((String)ss.getAttribute("ssID"));
		
		List<checkList> list = null;
		List<checkList> listDetail = null;
		
		
		list = service.selectCheckList(vo.getId());
		listDetail = service.selectCheckListDetail(vo.getId());
		
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
		
		listDetail = service.checkListDetailView(vo);
		
		model.addAttribute("checkListDetail", listDetail);		
		
		return "checkList/update";
	}
	
	// 수정
	@ResponseBody
	@RequestMapping(value = "update", produces = "application/json;charset=utf-8")
	public ModelAndView updateAction( String[] contentL, checkList vo, ModelAndView mv , HttpServletRequest req) throws Exception{
		
		
		
		int updateMaster = service.updateCheckListMaster(vo);
		if (updateMaster > 0 ) {
			for(int i=0 ; i < contentL.length ; i++) {
				vo.setContent(contentL[i]);
				
				int updateDetail = service.updateCheckListDetail(vo);
				
				if (updateDetail > 0) {
					
				}else {
					mv.setViewName("redirect:" + req.getHeader("referer"));
				}
			}
		}
		
		mv.setViewName("redirect:/checkList/index.do");
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
	public ModelAndView insert( String[] contentL, checkList vo, ModelAndView mv,HttpSession ss, HttpServletRequest req) throws Exception{
		
		vo.setId((String)ss.getAttribute("ssID"));
		vo.setListName(vo.getListName());
				
		int chk = service.insertCheckList(vo);
		int result = 0;
		
		System.out.println("0 "+contentL[0]);
		System.out.println("1 "+contentL[1]);
		System.out.println("contentLlength" + contentL.length);
		
		String status=null;
		String msg=null;
		if (chk > 0) {
			for (int i=0 ; i< contentL.length; i++) {
				vo.setContent(contentL[i]);
				vo.setmIdx(i+1);
				System.out.println(vo.getmIdx());
				result = service.insertCheckListDetail(vo);
				
				if (result > 0) {
					status = "success";
					msg = "성공";
					mv.setViewName("redirect:/checkList/index.do");
				}else {
					status ="error";
					msg = "실패";
					mv.setViewName("redirect:" + req.getHeader("referer"));
				}
				
			}
			
		}
		
		return mv;
	}
	
	// 삭제
	@RequestMapping("delete/{idx}")
	public String delete(@PathVariable int idx, RedirectAttributes rdAttr, HttpServletRequest request) throws Exception{
		int result = service.deleteCheckList(idx);
		String path;
		if (result > 0 ) {
			rdAttr.addFlashAttribute("msg", "삭제되었습니다.");
			path = request.getHeader("referer");
		}else {
			rdAttr.addFlashAttribute("msg", "삭제실패");
			path = request.getHeader("referer");
		}
		
		return  "redirect:"+path;
	}
	
	// 사용여부 변경
	@ResponseBody
	@RequestMapping(value = "updateYN.do", produces = "application/json; charset = utf-8")
	public String updateYN(int dIdx, String YN) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dIdx", dIdx);
		map.put("useYN", YN);
		
		int result = service.updateYN(map);
		if (result > 0) {
			return "true";
		}else {
			return "false";
		}
	}
	
}
