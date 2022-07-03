package com.mj.homeAdmin.visit.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.vo.Food;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.mj.homeAdmin.visit.model.service.VisitService;
import com.mj.homeAdmin.visit.vo.Visit;

import jdk.nashorn.internal.runtime.logging.Logger;

@Controller
@RequestMapping("/visit/")
public class VisitController {

	
	@Autowired
	private VisitService vs;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public VisitController() {
	}
	
	
	// 사용자의 친구들이 방명록 쓰는 페이지 이동
	 @RequestMapping("index.do")
	public String visit(Visit vo,HttpSession ss,Model model, RedirectAttributes rdAttr, HttpServletResponse response	) 
			  throws Exception
	{
		
		model.addAttribute("vo", vo);
		
		return "visit/index";
	}
	 
	// 사용자의 친구들이 방명록 쓰는 페이지 이동 리스트
		 @RequestMapping("indexProc.do")
		public String visitProc(Visit vo,HttpSession ss,Model model, RedirectAttributes rdAttr, HttpServletResponse response	) 
				  throws Exception
		{
			
			 vo.setuId((String)ss.getAttribute("ssID"));
			 
			 System.out.println(vo.getSdt() + "aaaa");
			 System.out.println(vo.getEdt() + "bbb");
			 System.out.println(vo.getWord() + "bbb");
			 System.out.println(vo.getKey() + "bbb");
			 
			 
			 
			List<Visit> list = vs.visitList(vo);
			 
			 
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			
			return "visit/indexProc";
		}
	
	// 사용자의 친구들이 방명록 쓰는 페이지 이동
	 @RequestMapping("write.do")
	public String visitFriend(Visit vo,HttpSession ss,Model model, RedirectAttributes rdAttr, HttpServletResponse response	) 
			  throws Exception
	{
		System.out.println(vo.getuId() + "유저아이디");
		
		//사용자의 이름 가져오기
		vo.setuNm(vs.findNm(vo));
		
		System.out.println(vo.getuNm() + "유저 이름");
		
		model.addAttribute("vo", vo);
		
		return "visit/write";
	}
	 
	 @RequestMapping("insert.do")
	public void insertVisit(MultipartFile[] photo2, Visit vo,HttpSession ss,Model model, RedirectAttributes rdAttr, HttpServletResponse res	) 
			  throws Exception
	{
		int chkFile = 1;
		for(MultipartFile multipartFile : photo2) {
 			if(multipartFile.isEmpty()) chkFile = 0;
		}
		
		
		 //----------- 파일 업로드 --------------------
		 String uploadFolder = myutil.fielUrl("visit");
		 
		 String fileNm = "";
		
		 if(chkFile == 1) {
		 
			for(MultipartFile multipartFile : photo2) {
				System.out.println("name = " + multipartFile.getOriginalFilename());	
				System.out.println("size = " + multipartFile.getSize());	
				
				fileNm = vo.getuId() + multipartFile.getOriginalFilename();
				File saveFile = new File(uploadFolder, vo.getuId() + multipartFile.getOriginalFilename());
				
				try {
					multipartFile.transferTo(saveFile);
				}catch (Exception e) {
				}
				
			}
		 }
		
		//---------파일 업로드 끝 ----------------------
		
		vo.setPhoto("visit/" +  fileNm);
		System.out.println(vo.getPhoto() + "/" + vo.getuId() );
		
		vs.insertVisit(vo);
		
		
		res.setContentType("text/html; charset=UTF-8");
		res.setCharacterEncoding("utf-8");
		PrintWriter writer = res.getWriter();
		writer.println("<script type='text/javascript'>");
		writer.println("alert('등록완료');location.href = '/homeAdmin2';");
		writer.println("</script>");
		writer.flush();
		
		
	}
	 
	 // 방명록 삭제
	 @ResponseBody
	 @RequestMapping(value="delete.do", produces = "application/json; charset=utf-8")
	 public void delete(Visit vo, HttpSession ss, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
			 throws Exception
	 {
		 System.out.println(vo.getIdx() + " : idx");
		 vo.setuId((String)ss.getAttribute("ssID")); 
		 vs.delete(vo);
		 
		 
		 
	 }
	
}
