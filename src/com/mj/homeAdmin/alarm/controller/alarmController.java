package com.mj.homeAdmin.alarm.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.alarm.model.service.alarmService;
import com.mj.homeAdmin.alarm.vo.alarm;

@SessionAttributes({"loginMember"})

@Component
@RequestMapping("/alarm/*")
public class alarmController {

	@Autowired
	private alarmService service;
	
	// 조회화면
	@RequestMapping("index.do")
	public String alarmListView(alarm vo, HttpSession ss,  Model model) throws Exception{
		vo.setId((String)ss.getAttribute("ssID"));
		List<alarm> list = null;
		list = service.selectAlarmList(vo.getId());
		
	
		model.addAttribute("alarmList", list);
		
		return "alarm/index";
		
	}
	
	// 입력화면
	@RequestMapping("insertView")
	public String insertView() throws Exception{
		return "alarm/insert";
	}
	
	// 입력
	@ResponseBody
	@RequestMapping(value = "insert.do", produces = "application/json;charset=utf-8")
	public ModelAndView insert(alarm vo, ModelAndView mv, HttpSession ss)throws Exception{
		
		vo.setId((String)ss.getAttribute("ssID"));
		
		int result = service.insertAlarm(vo);
		 
		if (result > 0) {
			
		}
		
		return mv;
	}
	
	// 수정화면 조회
	@RequestMapping("updateView/{idx}")
	public String updateView(@PathVariable int idx,  alarm vo, HttpSession ss, Model model) throws Exception{
		
		System.out.println(vo.getIdx());
		alarm alarm = service.selectAlarmOne(idx);
		
		model.addAttribute("alarm", alarm);
		
		return "alarm/update";
	}
	
	// 수정
	@ResponseBody
	@RequestMapping(value = "update.do", produces = "application/json; charset=utf-8")
	public String update(alarm vo, HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception{
		
		int result = 0;
		
		vo.setId((String)ss.getAttribute("ssID"));
		
		result = service.updateAlarm(vo);
		
		if (result > 0 ) {
			return "true";
		}else {
			return "false";
		}
		
		
	}
	
	// 사용여부 변경
	@ResponseBody
	@RequestMapping(value = "updateYN.do", produces = "application/json; charset = utf-8")
	public String updateYN(int idx, String YN) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("useYN", YN);
		
		int result = service.updateYN(map);
		
		if (result > 0) {
			return "true";
		}else {
			return "false";
		}
		
	};
	
	// 삭제
	@RequestMapping("delete/{idx}")
	public String delete(@PathVariable int idx, Model model, RedirectAttributes rdAttr ,HttpServletRequest request) throws Exception{
		
		int result = service.deleteAlarm(idx);
		String path;
		if (result > 0 ) {
			rdAttr.addFlashAttribute("msg", "삭제되었습니다.");
			path = request.getHeader("referer");
		}else {
			rdAttr.addFlashAttribute("msg", "삭제실패");
			path = request.getHeader("referer");
		}
		
		return  "redirect:"+path;
	};
}
