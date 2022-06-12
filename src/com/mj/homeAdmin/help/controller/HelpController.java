package com.mj.homeAdmin.help.controller;

import java.io.PrintWriter;
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
import com.mj.homeAdmin.help.model.service.HelpService;
import com.mj.homeAdmin.help.vo.Help;

@Controller
@RequestMapping("/help/*")
public class HelpController {

	@Autowired
	private HelpService hs;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public HelpController() {
	}
	
	 @RequestMapping("index.do")
	    public String helpIndex(Help vo, HttpSession ss, Model model, 
	    		 @RequestParam(defaultValue="1") int curPage,
	    		 RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		 
		 model.addAttribute("curPage", curPage);
			 
		 return "help/index";
		 
	    }
	 
	 @RequestMapping("indexProc.do")
	    public String helpIndexProc(Help vo, HttpSession ss, Model model, 
	    		 @RequestParam(defaultValue="1") int curPage,
	    		 RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			System.out.println(vo.getLimit() + " : 리밋트");
			
			
			// 전체리스트 개수
	        int listCnt  = hs.listCnt(vo);
	        
	        System.out.println(listCnt + " : listCnt");
	        
	        Pagination pagination = new Pagination(listCnt, curPage);
	        
	        vo.setStartPage(pagination.getStartIndex());
			vo.setCntPerPage(pagination.getPageSize());
			
			System.out.println(vo.getStartPage() + "시작");
			System.out.println(vo.getCntPerPage() + " : cntpage");
			System.out.println(pagination.getCurRange() + "왜 없어");
			
		 List<Help> list = hs.helpList(vo);
		 
		 model.addAttribute("list", list);
		 model.addAttribute("listCnt", listCnt);
		 model.addAttribute("pagination", pagination);
		 
		 return "help/indexProc";
		 
	    }
	
	 @RequestMapping("write.do")
	    public String helpIWrite(Help vo, HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		 return "help/write";
		 
	    }
	
	 // 1:1 문의 사항 등록
	 @RequestMapping("submitHelp.do")
	    public void submitHelp(Help vo, HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse res)
	        throws Exception
	    {
		 System.out.println(vo.getType() + " : type");
		 
		//세션으로 가져오기
			vo.setuId((String)ss.getAttribute("ssID"));
			
			
			 System.out.println(vo.getuId() + " : Uid");
			
			hs.submitHelp(vo);
		 
			res.setContentType("text/html; charset=UTF-8");
			res.setCharacterEncoding("utf-8");
			PrintWriter writer = res.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('등록완료');location.href = '/homeAdmin2/help/index.do';");
			writer.println("</script>");
			writer.flush();
			
			
		 
	    }
	 
	 @RequestMapping("qna.do")
	    public String helpIqna(Help vo, HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
	        throws Exception
	    {
		 
		 // 나중에 1:1 문의가 쌓이면 그 데이터를 기반으로 만들 예정
		 
		 
		 
		 return "help/qna";
		 
	    } 
}
