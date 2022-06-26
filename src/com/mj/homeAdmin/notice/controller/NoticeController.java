package com.mj.homeAdmin.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.comm.Pagination;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.help.vo.Help;
import com.mj.homeAdmin.notice.model.service.NoticeService;
import com.mj.homeAdmin.notice.vo.Notice;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

	@Autowired
	private NoticeService ns;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public NoticeController() {
	}
	
	
	 @RequestMapping("index.do")
		public String notice(Notice vo,HttpSession ss,Model model,
				 @RequestParam(defaultValue="1") int curPage,
				RedirectAttributes rdAttr, HttpServletResponse response	) 
				  throws Exception
		{
			
		 model.addAttribute("curPage", curPage);
			
			return "notice/index";
		}
	 
	 @RequestMapping("indexProc.do")
	    public String noticeIndexProc(Notice vo, HttpSession ss, Model model, 
	    		 @RequestParam(defaultValue="1") int curPage,
	    		 RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			
			
			// 전체리스트 개수
	        int listCnt  = ns.listCnt(vo);
	        
	        System.out.println(listCnt + " : listCnt");
	        
	        Pagination pagination = new Pagination(listCnt, curPage);
	        
	        vo.setStartPage(pagination.getStartIndex());
			vo.setCntPerPage(pagination.getPageSize());
			
			System.out.println(vo.getStartPage() + "시작");
			System.out.println(vo.getCntPerPage() + " : cntpage");
			System.out.println(pagination.getCurRange() + "왜 없어");
			
		 List<Notice> list = ns.NoticeList(vo);
		 
		 model.addAttribute("list", list);
		 model.addAttribute("listCnt", listCnt);
		 model.addAttribute("pagination", pagination);
		 
		 return "notice/indexProc";
		 
	    }
}
