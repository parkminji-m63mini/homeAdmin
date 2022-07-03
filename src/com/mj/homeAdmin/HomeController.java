// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HomeController.java

package com.mj.homeAdmin;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.checkList.model.service.checkListService;
import com.mj.homeAdmin.checkList.vo.checkList;
import com.mj.homeAdmin.comm.JavaUtil;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.manageM.model.service.ManegeMService;
import com.mj.homeAdmin.manageM.vo.ManageM;
import com.mj.homeAdmin.myinfo.model.service.MyinfoService;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.mj.homeAdmin.visit.model.service.VisitService;
import com.mj.homeAdmin.visit.vo.Visit;

@Controller
public class HomeController
{
	@Autowired
	private MyinfoService ms;
	
	@Autowired
	private checkListService checkListService;

	@Autowired
	private ManegeMService manageService;
	
	@Autowired
	private VisitService visitService;
	
	@Autowired
	private CmmnServiceImpl cm;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(MyinfoVo vo, Model model, HttpSession ss, HttpServletRequest req) throws Exception{
		
		//세션으로 가져오기
		vo.setId((String)ss.getAttribute("ssID"));
		
		//세션에 필요한 정보가져오기
				// 여기부터
				 List<MyinfoVo> user = ms.selectUser(vo);
				 
				 
				 
				
				 // 메인에 나타날 것들
				 // 집 이미지
				 String homeImg = ms.getHomeImg(user.get(0).getId());
				 // 체크리스트
				 System.out.println("확인");
				 List<checkList> checkList = checkListService.selectCheckList(user.get(0).getId());
				 List<checkList> checkListDetail = checkListService.selectCheckListDetail(user.get(0).getId());
			
				 // 공과금 전월vs당월
				 
				 String flag = "false";
				 ManageM manageVo = new ManageM();
				 manageVo.setuId(user.get(0).getId());
				 String	yyyy= "" + LocalDate.now().getYear();
		         String mm= JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
		        
		        // 체크하는 용도로 사용함
		        manageVo.setgChk(flag);
		        
		        
		        manageVo.setYyyy(yyyy);
		        manageVo.setMm(mm);
		         System.out.println("manageVo.getuId()  " + manageVo.getuId());
		         System.out.println("manageVo.getuId()  " + manageVo.getYyyy());
		         System.out.println("manageVo.getuId()  " + manageVo.getMm());
		        // 이번달
		        List<ManageM> arrViewNow = manageService.manageIndex(manageVo);
		        
		        //-------------------------------//
		        // 이번달, 이전달 비교
		 
		        manageVo.setMm2(JavaUtil.checkMM(mm, "1"));
		        manageVo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
		        
		        List<ManageM> arrViewPast = manageService.manageNP(manageVo);
		        
		        // 방명록
				 List<Visit> visitList = visitService.mainVistList(user.get(0).getId());
				
				 vo.setId(user.get(0).getId());
				 vo.setNm(user.get(0).getNm());
				 vo.setnNm(user.get(0).getnNm());
				 vo.setGb(user.get(0).getGb());
			//	 System.out.println(user.get(0).getNm() + " 리스트 값");
			//	 System.out.println(vo.getNm() + " vo값");
				 
				// 세션에 세팅
				cm.goSessionChk(vo, ss, req);
				cm.getSessionChk(ss);
				model.addAttribute("user" ,vo);
				model.addAttribute("homeImg", homeImg);
				model.addAttribute("checkList", checkList);
				model.addAttribute("checkListDetail", checkListDetail);
				model.addAttribute("arrViewNow", arrViewNow);
		        model.addAttribute("arrViewPast", arrViewPast);
		        model.addAttribute("visitList", visitList);
		
		
		return "../../main";
	}
	
	@RequestMapping(value = "/snsLogin", method = RequestMethod.GET)
	public String snsLogin() {
		return "../snsLogin";
	}
	
	
	@RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String naverLogin() {
		return "../naverLogin";
	}
	@RequestMapping(value = "kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(MyinfoVo vo,  HttpSession ss, Model model, RedirectAttributes rdAttr,HttpServletRequest req)
			 throws Exception{
		
		System.out.println(vo.getId() + "/" + vo.getEmail());
		
		
		 String result ="false";
			
			
		 // 아이디가 존재하는지 확인
		 String chk = ms.idChk(vo);
		 
		 
		 // 아이디 없다면
		 if(chk == null || chk.equals("") || chk.isEmpty() == true) {
		 
			 // 임의 셋팅
			 vo.setGb('1');
			 vo.setLtype("1");
			 vo.setHtype("1");
			 vo.setSnsInfo("kakao");
			 ms.signUp(vo);
		 }	 
			 
			 //세션에 필요한 정보가져오기
			 // 여기부터
			 List<MyinfoVo> user = ms.selectUser(vo);
			 
			 vo.setId(user.get(0).getId());
			 vo.setNm(user.get(0).getNm());
			 vo.setnNm(user.get(0).getnNm());
			 vo.setGb(user.get(0).getGb());
			 //	 System.out.println(user.get(0).getNm() + " 리스트 값");
			 //	 System.out.println(vo.getNm() + " vo값");
			 
			 // 세션에 세팅
			 cm.goSessionChk(vo, ss, req);
			 cm.getSessionChk(ss);
			 
		
			
		 
	result ="true";
	model.addAttribute("user" ,vo);
	
		System.out.println(ss.getAttribute("ssNM") + " 세션 확인");
	
	return "../../main" ;
		
	}
	
	
	
	
	@ResponseBody
	 @RequestMapping(value="login.do", produces = "application/json; charset=utf-8")
	 public String login(MyinfoVo vo,  HttpSession ss, Model model, RedirectAttributes rdAttr,HttpServletRequest req)
			 throws Exception{
			 String result ="false";
	
			 System.out.println(vo.getBirth() + "birth");
			vo.getBirth().replace("-", "");
			 
			 
			 // 아이디가 존재하는지 확인
			 String chk = ms.idChk(vo);
			 
			 // 성별
			 if(vo.getSex()== 'F') { // 여자
				 vo.setSex('2');
				 
			 }else if(vo.getSex()== 'M') { // 남자
				 vo.setSex('1');
				 
			 }else {
				 vo.setSex('3');
			 }
			 
			 // 아이디 없다면
			 if(chk == null || chk.equals("") || chk.isEmpty() == true) {
			 
				 // 임의 셋팅
				 vo.setGb('1');
				 vo.setLtype("1");
				 vo.setHtype("1");
				 
				 ms.signUp(vo);
			 }	 
				 
				 //세션에 필요한 정보가져오기
				 // 여기부터
				 List<MyinfoVo> user = ms.selectUser(vo);
				 
				 vo.setId(user.get(0).getId());
				 vo.setNm(user.get(0).getNm());
				 vo.setnNm(user.get(0).getnNm());
				 vo.setGb(user.get(0).getGb());
				 vo.setSnsInfo(user.get(0).getSnsInfo());
				 //	 System.out.println(user.get(0).getNm() + " 리스트 값");
				 //	 System.out.println(vo.getNm() + " vo값");
				 
				 // 세션에 세팅
				 cm.goSessionChk(vo, ss, req);
				 cm.getSessionChk(ss);
				 
			
				
			 
		result ="true";
		model.addAttribute("user" ,vo);
		
			System.out.println(ss.getAttribute("ssNM") + " 세션 확인");
		
		return "../../main" ;
		}
	
	
	
	
	
	
	@RequestMapping(value = "/code.do", method = RequestMethod.GET)
	public String code()  throws Exception{
		System.out.println("코드 들어옴");
		return "../common/code";
	}
}
