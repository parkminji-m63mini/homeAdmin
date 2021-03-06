// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageMController.java

package com.mj.homeAdmin.manageM.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mj.homeAdmin.comm.JavaUtil;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.vo.Food;
import com.mj.homeAdmin.manageM.model.service.ManageMServiceImpl;
import com.mj.homeAdmin.manageM.model.service.ManegeMService;
import com.mj.homeAdmin.manageM.vo.ManageM;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Controller
@RequestMapping("/manageM/*")
public class ManageMController
{
	
	@Autowired
	private ManegeMService ms;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	
    public ManageMController()
    {
    }

    @RequestMapping("index.do")
    public String manegeMIndex(ManageM vo,  HttpSession ss,Model model, RedirectAttributes rdAttr, HttpServletResponse response)
        throws Exception
    {
    	
    	String flag = "false";
    	
    	// 세션으로 가져오기
        vo.setuId((String)ss.getAttribute("ssID"));
        
        String yyyy= vo.getYyyy();
        String mm=  vo.getMm();
        if(yyyy == null || yyyy.equals("")) {
        	yyyy= "" + LocalDate.now().getYear();
        	mm=   JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        }else {
        	yyyy= vo.getYyyy();
        	mm = JavaUtil.checkMM(vo.getMm(), "0");
        	flag = "true";
        }
        
        // 체크하는 용도로 사용함
        vo.setgChk(flag);
        
        String yyyy2 = "";
        String yyyy3= "";
        String mm2= "" ;
        String mm3= "" ;
        
        
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageIndex(vo);
        
        //-------------------------------//
        // 이번달, 이전달 비교
 
        vo.setMm2(JavaUtil.checkMM(mm, "1"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        List<ManageM> arrViewPast = ms.manageNP(vo);
        
        System.out.println(vo.getMm() + "chk0");
        System.out.println(vo.getMm2() + "chk");
        System.out.println(vo.getYyyy2() + "chk2");
     
      
      //-------------------------------------//
        // 작년 동월 값
        
        List<ManageM> arrViewPast4 = ms.managePassSame(vo);
        
        
        //------------------------------------//
        // 이번달, 3개월 평균값 비교
        
        
        vo.setMm3(JavaUtil.checkMM(mm, "2"));
        vo.setYyyy3(JavaUtil.checkYYYY(yyyy, mm, "2"));
        
        List<ManageM> arrViewPast3 = ms.manageListP3(vo); 
        
        //-------------------------------------//
        // 12개월 평균값 비교
        
        List<ManageM> arrViewPast12 = ms.manageListP12(vo); 
        
        
        System.out.println("확인1 :" + vo.getYyyy() + "/" + vo.getMm());
        System.out.println("확인2 :" + vo.getYyyy2() + "/" + vo.getMm2());
        System.out.println("확인3 :" + vo.getYyyy3() + "/" + vo.getMm3());
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast3", arrViewPast3);
        model.addAttribute("arrViewPast4", arrViewPast4);
        model.addAttribute("arrViewPast12", arrViewPast12);
        model.addAttribute("repeat", "3"); // 1년 차트(x축 컬럼수 만큼) 반복횟수 (원하는 컬럼 수 - 1)
        model.addAttribute("type", "all"); // 차트  메뉴별로 구성 컬럼이 달라서 타입으로 구분
        
     //   System.out.println((new StringBuilder(String.valueOf(((ManageM)arrViewNow.get(0)).getGasM()))).append(" \uC778\uB371\uC2A4 \uAC00\uC2A4").toString());
     //   System.out.println("index \uB85C\uB529 \uC644");
        return "manageM/index";	
    }

    @ResponseBody
    @RequestMapping(value="updateMAll.do", produces = "application/json; charset=utf-8")
    public String updateMAll(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
        throws Exception
    {
        System.out.println((new StringBuilder(String.valueOf(vo.getuId()))).append(" : id").toString());
        System.out.println((new StringBuilder(String.valueOf(vo.getGasM()))).append(" : gas").toString());
        System.out.println((new StringBuilder(String.valueOf(vo.getYyyy()))).append(" : yyyy").toString());
        System.out.println((new StringBuilder(String.valueOf(vo.getMode()))).append(" : mode").toString());
        
        String str = "";
        
        if(vo.getMode().equals("i")) {
        	 vo.setMm(JavaUtil.checkMM(vo.getMm(), "0"));
             
        	 System.out.println(vo.getMm() + "mm 확인");
        	
        	ms.insertMAll(vo);
            str ="성공";
            
        }else if(vo.getMode().equals("u"))
        {
            ms.updateMAll(vo, res);
            str ="성공";
          //  String strScript = "alert('\uC5C5\uB370\uC774\uD2B8 \uC644\uB8CC'); location.href = './index.do';";
        //    myutil.webScript(res, strScript);
        }
        return str;
    }

    @RequestMapping("gas.do")
    public String gas(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception
    {
    	
    	String flag = "false";
    	
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    	
        //System.out.println("값 체크 : " + vo.getYyyy() + " / " + vo.getMm());
    	
        String yyyy= vo.getYyyy();
        String mm= vo.getMm();
        if(yyyy == null || yyyy.equals("")) {
        	yyyy= "" + LocalDate.now().getYear();
        	mm=  JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        }else {
        	yyyy= vo.getYyyy();
        	mm = JavaUtil.checkMM(vo.getMm(), "0");
        	flag = "true";
        }
        
        // 체크하는 용도로 사용함
        vo.setgChk(flag);
        
    	String yyyy2 = "";
    	String yyyy3= "";
    	String mm2= "" +(LocalDate.now().getMonthValue()-1);
    	String mm3= "" +(LocalDate.now().getMonthValue()-2);

    	// 당월분만
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
	       
	       System.out.println(vo.getuId() + " 1");
	       System.out.println(vo.getYyyy()+ " 1");
	       System.out.println(vo.getMm() + " 1");
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageGasNow(vo);
    	
        //-------------------------------//
        // 이번달, 이전달 비교
        
        
        vo.setMm2(JavaUtil.checkMM(mm, "1"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        System.out.println("함수로 체크 확인  : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast = ms.gasNP(vo);
        //-------------------------------------//
        // 작년 동월 값
        
        List<ManageM> arrViewPastY = ms.gasPassSame(vo);
        //--------------------------------
        
        
    	// 당월에서부터 전 6개월치 가스비
        vo.setMm2(JavaUtil.checkMM(mm, "6"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "6"));
    	
        System.out.println("함수로 체크 확인 2 : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast6 = ms.gasNP6m(vo);
        
      //--------------------------------
        
        //12개월 데이터
        vo.setYyyy(yyyy);
        	vo.setMm(mm);
        List<ManageM> arrViewPast12 = ms.gasNP12m(vo);
      //--------------------------------  
    	
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
        
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast6", arrViewPast6);
        model.addAttribute("arrViewPast12", arrViewPast12);
        model.addAttribute("arrViewPastY", arrViewPastY);
        model.addAttribute("repeat", "1"); // 1년 차트(x축 컬럼수 만큼) 반복횟수 (원하는 컬럼 수 - 1)
        model.addAttribute("type", "gas"); // 차트  메뉴별로 구성 컬럼이 달라서 타입으로 구분
        model.addAttribute("vo", vo);
    	return "manageM/gas";
    }
    
      
    
    // 가스상세 업데이트 1
    @ResponseBody
    @RequestMapping(value="updateGas.do", produces = "application/json; charset=utf-8")
    public String updatGas(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
        throws Exception
    {
        
        String str = "";
        
            ms.updateGas(vo, res);
            str ="성공";
          //  String strScript = "alert('\uC5C5\uB370\uC774\uD2B8 \uC644\uB8CC'); location.href = './index.do';";
        //    myutil.webScript(res, strScript);
        return str;
    }
    // 가스상세 지불여부 업데이트
    @ResponseBody
    @RequestMapping(value="updateGchk.do", produces = "application/json; charset=utf-8")
    public String updateGchk(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    
    	System.out.println(vo.getgChk() + "확인");
    	ms.updateGchk(vo, res);
    	str ="성공";
    	return str;
    }
    // 가스상세 자동이체 업데이트
    @ResponseBody
    @RequestMapping(value="updateGchkA.do", produces = "application/json; charset=utf-8")
    public String updateGchkA(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	System.out.println(vo.getAutoM() + "확인");
    	ms.updateGchkA(vo, res);
    	str ="성공";
    	return str;
    }
    
    // 기본 가스비 업데이트
    @ResponseBody
    @RequestMapping(value="updateTgasM.do", produces = "application/json; charset=utf-8")
    public String updateTgasM(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	System.out.println(vo.getGasM() + "확인");
    	ms.updateTgasM(vo, res);
    	str ="성공";
    	return str;
    }
    
    // 가스 계량기 번호 업데이트
    @ResponseBody
    @RequestMapping(value="updateGasNum.do", produces = "application/json; charset=utf-8")
    public String updateGasNum(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	System.out.println(vo.getgNum() + "확인");
    	ms.updateGasNum(vo, res);
    	str ="성공";
    	return str;
    }
    // 가스 고객 번호 업데이트
    @ResponseBody
    @RequestMapping(value="updatepNum.do", produces = "application/json; charset=utf-8")
    public String updatepNum(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	System.out.println(vo.getpNum() + "확인");
    	
    	ms.updatepNum(vo, res);
    	str ="성공";
    	return str;
    }
    
    // 가스 전체 업데이트
    @ResponseBody
    @RequestMapping(value="allUpdateGas.do", produces = "application/json; charset=utf-8")
    public String allUpdateGas(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	System.out.println(vo.getpNum() + "확인");
    	ms.allUpdateGas(vo, res);
    	str ="성공";
    	return str;
    }

    
    @RequestMapping("electric.do")
    public String electric(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	
    	String flag = "false";
    	
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    	
        //System.out.println("값 체크 : " + vo.getYyyy() + " / " + vo.getMm());
    	
        String yyyy= vo.getYyyy();
        String mm= vo.getMm();
        if(yyyy == null || yyyy.equals("")) {
        	yyyy= "" + LocalDate.now().getYear();
        	mm=  JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        }else {
        	yyyy= vo.getYyyy();
        	mm = JavaUtil.checkMM(vo.getMm(), "0");
        	flag = "true";
        }
        
        // 체크하는 용도로 사용함
        vo.setgChk(flag);
        
    	String yyyy2 = "";
    	String yyyy3= "";
    	String mm2= "" +(LocalDate.now().getMonthValue()-1);
    	String mm3= "" +(LocalDate.now().getMonthValue()-2);

    	// 당월분만
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
	       
	       System.out.println(vo.getuId() + " 1");
	       System.out.println(vo.getYyyy()+ " 1");
	       System.out.println(vo.getMm() + " 1");
       
	       
	       // 여기부터 시작
        // 이번달
	       List<ManageM> arrViewNow = ms.manageElNow(vo);
        //-------------------------------//
        // 이번달, 이전달 비교
        
        
        vo.setMm2(JavaUtil.checkMM(mm, "1"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        System.out.println("함수로 체크 확인  : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast = ms.elNP(vo);
        //-------------------------------------//
        // 작년 동월 값
        
        List<ManageM> arrViewPastY = ms.elPassSame(vo);
        //--------------------------------
        
        //12개월 데이터
        vo.setYyyy(yyyy);
        vo.setMm(mm);
        List<ManageM> arrViewPast12 = ms.elNP12m(vo);
        //--------------------------------  
        
        
    	// 당월에서부터 전 6개월치 가스비
        vo.setMm2(JavaUtil.checkMM(mm, "6"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "6"));
    	
        System.out.println("함수로 체크 확인 2 : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast6 = ms.elNP6m(vo);
        
      //--------------------------------
        
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
        
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast6", arrViewPast6);
        model.addAttribute("arrViewPast12", arrViewPast12);
        model.addAttribute("arrViewPastY", arrViewPastY);
        model.addAttribute("repeat", "1"); // 1년 차트(x축 컬럼수 만큼) 반복횟수 (원하는 컬럼 수 - 1)
        model.addAttribute("type", "el"); // 차트  메뉴별로 구성 컬럼이 달라서 타입으로 구분
        model.addAttribute("vo", vo);
    	
        return "manageM/electric";
    }
  

    @RequestMapping("it.do")
    public String it(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response)throws Exception
    {
    	
    	String flag = "false";
    	
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    	
        //System.out.println("값 체크 : " + vo.getYyyy() + " / " + vo.getMm());
    	
        String yyyy= vo.getYyyy();
        String mm= vo.getMm();
        if(yyyy == null || yyyy.equals("")) {
        	yyyy= "" + LocalDate.now().getYear();
        	mm=  JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        }else {
        	yyyy= vo.getYyyy();
        	mm = JavaUtil.checkMM(vo.getMm(), "0");
        	flag = "true";
        }
        
        // 체크하는 용도로 사용함
        vo.setgChk(flag);
        
    	String yyyy2 = "";
    	String yyyy3= "";
    	String mm2= "" +(LocalDate.now().getMonthValue()-1);
    	String mm3= "" +(LocalDate.now().getMonthValue()-2);

    	// 당월분만
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
	       
	       System.out.println(vo.getuId() + " 1");
	       System.out.println(vo.getYyyy()+ " 1");
	       System.out.println(vo.getMm() + " 1");
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageItNow(vo);
	       
        //-------------------------------//
        // 이번달, 이전달 비교
        
        
        vo.setMm2(JavaUtil.checkMM(mm, "1"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        System.out.println("함수로 체크 확인  : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast = ms.itNP(vo);
        
        //-------------------------------------//
        // 작년 동월 값
        
        List<ManageM> arrViewPastY = ms.itPassSame(vo);
        //--------------------------------
        
        
    	// 당월에서부터 전 6개월치 가스비
        vo.setMm2(JavaUtil.checkMM(mm, "6"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "6"));
    	
        System.out.println("함수로 체크 확인 2 : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
     //   List<ManageM> arrViewPast6 = ms.gasNP6m(vo);
        
      //--------------------------------
        
        //12개월 데이터
        vo.setYyyy(yyyy);
        	vo.setMm(mm);
        List<ManageM> arrViewPast12 = ms.itNP12m(vo);
      //--------------------------------  
    	
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
        
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
     //   model.addAttribute("arrViewPast6", arrViewPast6);
        model.addAttribute("arrViewPast12", arrViewPast12);
        model.addAttribute("arrViewPastY", arrViewPastY);
        model.addAttribute("repeat", "0"); // 1년 차트(x축 컬럼수 만큼) 반복횟수 (원하는 컬럼 수 - 1)
        model.addAttribute("type", "it"); // 차트  메뉴별로 구성 컬럼이 달라서 타입으로 구분
        model.addAttribute("vo", vo);
    	
    	
        return "manageM/it";
    }
    
    // 가스 계량기, 고객번호 최근 데이터로 업데이트
    @ResponseBody
    @RequestMapping(value="newUp.do", produces = "application/json; charset=utf-8")
    public String newUp(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception
    {
    	
    	// 세션으로 가져오기
        vo.setuId((String)ss.getAttribute("ssID"));
    	
    	System.out.println(vo.getTp());
    	System.out.println(vo.getIdx() + "확인");
    	System.out.println(vo.getYyyy() + "확인");
    	
    	String result = ms.newUp(vo, ss);
    	
    	
    	
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	
    	System.out.println(result + "확인");
    	
    	return  gson.toJson(result); 
    	
    }
    
    
    
    
    @RequestMapping("detailView.do")
    public String detailView(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception
    {
    	
    	
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    	
    	
		//가스 데이터
		 vo.setMm(JavaUtil.checkMM(vo.getMm(), "0"));

		 // 체크하는 용도로 사용함
	        vo.setgChk("true");
	        
        List<ManageM> gasV = ms.manageGasNow(vo);
        List<ManageM> elV = ms.manageElNow(vo);
        List<ManageM> waV = ms.manageWaNow(vo);
        List<ManageM> itV = ms.manageItNow(vo);
        List<ManageM> maV = ms.manageMaNow(vo);
        
        //관리비  총합
        String suma = ms.manageMaNowSum(vo);
    	
        System.out.println("test");
        
        model.addAttribute("gasV", gasV);
        model.addAttribute("elV", elV);
        model.addAttribute("waV", waV);
        model.addAttribute("itV", itV);
        model.addAttribute("maV", maV);
        model.addAttribute("suma", suma);
    	return "manageM/detailView";
    }
    
    
    
    // 인터넷 전체 업데이트
    @ResponseBody
    @RequestMapping(value="allUpdateIt.do", produces = "application/json; charset=utf-8")
    public String allUpdateIt(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	

    	System.out.println(vo.getuId() + "/" + vo.getDefM() + "/" + vo.getIdx() + "/ ddddd");

    	ms.allUpdateIt(vo, res);
    	str ="성공";
    	return str;
    }

    // 기본 인터넷 업데이트
    @ResponseBody
    @RequestMapping(value="updateTItM.do", produces = "application/json; charset=utf-8")
    public String updateTItM(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	ms.updateTItM(vo, res);
    	str ="성공";
    	return str;
    }
    
   
    // 전기 계량기, 고객번호 최근 데이터로 업데이트
    @ResponseBody
    @RequestMapping(value="newUpel.do", produces = "application/json; charset=utf-8")
    public String newUpel(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception
    {
    	
    	// 세션으로 가져오기
        vo.setuId((String)ss.getAttribute("ssID"));
    	
    	System.out.println(vo.getTp());
    	System.out.println(vo.getIdx() + "확인");
    	System.out.println(vo.getYyyy() + "확인");
    	
    	// 여기부터
    	String result = ms.newUpel(vo, ss);
    	
    	
    	
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	
    	System.out.println(result + "확인");
    	
    	return  gson.toJson(result); 
    	
    }
    
 // 기본 전기료 업데이트
    @ResponseBody
    @RequestMapping(value="allUpdateEl.do", produces = "application/json; charset=utf-8")
    public String allUpdateEl(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	System.out.println(vo.getElM() + "확인");
    	ms.allUpdateEl(vo, res);
    	str ="성공";
    	return str;
    }
    
    // 전기상세 업데이트 1
    @ResponseBody
    @RequestMapping(value="updateTelM.do", produces = "application/json; charset=utf-8")
    public String updatEl(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
        throws Exception
    {
        
        String str = "";
        System.out.println(vo.getMode() + "//" + vo.getuId() + "//" + vo.getIdx());
        
            ms.updateEl(vo, res);
            str ="성공";
          //  String strScript = "alert('\uC5C5\uB370\uC774\uD2B8 \uC644\uB8CC'); location.href = './index.do';";
        //    myutil.webScript(res, strScript);
        return str;
    }
    
    
    ///------------------------관리비
    
    
    @RequestMapping("manage.do")
    public String manage(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response)throws Exception
    {
    	
    	String flag = "false";
    	
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    	
        //System.out.println("값 체크 : " + vo.getYyyy() + " / " + vo.getMm());
    	
        String yyyy= vo.getYyyy();
        String mm= vo.getMm();
        if(yyyy == null || yyyy.equals("")) {
        	yyyy= "" + LocalDate.now().getYear();
        	mm=  JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        }else {
        	yyyy= vo.getYyyy();
        	mm = JavaUtil.checkMM(vo.getMm(), "0");
        	flag = "true";
        }
        
        // 체크하는 용도로 사용함
        vo.setgChk(flag);
        
    	String yyyy2 = "";
    	String yyyy3= "";
    	String mm2= "" +(LocalDate.now().getMonthValue()-1);
    	String mm3= "" +(LocalDate.now().getMonthValue()-2);

    	// 당월분만
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
	       
	       System.out.println(vo.getuId() + " 1");
	       System.out.println(vo.getYyyy()+ " 1");
	       System.out.println(vo.getMm() + " 1");
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageMaNow(vo);
        
        //전체 총합
        String suma = ms.manageMaNowSum(vo);
	       
        //-------------------------------//
        // 이번달, 이전달 비교
        
        
        vo.setMm2(JavaUtil.checkMM(mm, "1"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        System.out.println("함수로 체크 확인  : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast = ms.MmNP(vo);
        
        //-------------------------------------//
        // 작년 동월 값
        
        List<ManageM> arrViewPastY = ms.mMPassSame(vo);
        //--------------------------------
        
        
    	// 당월에서부터 전 6개월치 가스비
   //     vo.setMm2(JavaUtil.checkMM(mm, "6"));
    //    vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "6"));
    	
     //   System.out.println("함수로 체크 확인 2 : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
     //   List<ManageM> arrViewPast6 = ms.gasNP6m(vo);
        
      //--------------------------------
        
        //12개월 데이터
        vo.setYyyy(yyyy);
        	vo.setMm(mm);
       List<ManageM> arrViewPast12 = ms.mMNP12m(vo);
      //--------------------------------  
    	
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
        System.out.println(suma + "  suma ");
        
       model.addAttribute("arrViewNow", arrViewNow);
       model.addAttribute("suma", suma);
       model.addAttribute("arrViewPast", arrViewPast);
       model.addAttribute("arrViewPast12", arrViewPast12);
       model.addAttribute("arrViewPastY", arrViewPastY);
      model.addAttribute("repeat", "0"); // 1년 차트(x축 컬럼수 만큼) 반복횟수 (원하는 컬럼 수 - 1)
        model.addAttribute("type", "ma"); // 차트  메뉴별로 구성 컬럼이 달라서 타입으로 구분
        model.addAttribute("vo", vo);
    	
    	
        return "manageM/manage";
    }
    
    // 관리비 업데이트 1
    @ResponseBody
    @RequestMapping(value="allUpMm.do", produces = "application/json; charset=utf-8")
    public String allUpMm(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    			
    	String str = "";
    //	System.out.println(vo.getMode() + "//" + vo.getuId() + "//" + vo.getIdxL());
    	System.out.println("확인");
    	System.out.println(vo.getIdxL());
    	
    	ms.updateMm(vo, res); // insert, update 둘다 함
    	str ="성공";
    	//  String strScript = "alert('\uC5C5\uB370\uC774\uD2B8 \uC644\uB8CC'); location.href = './index.do';";
    	//    myutil.webScript(res, strScript);
    	return str;
    }
    
    // 관리비 삭제
    @ResponseBody
    @RequestMapping(value="deleteMm.do", produces = "application/json; charset=utf-8")
    public String deleteMm(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    			
    	String str = "";
    //	System.out.println(vo.getMode() + "//" + vo.getuId() + "//" + vo.getIdxL());
    	System.out.println("확인");
    	System.out.println(vo.getIdxL());
    	
    	ms.deleteMm(vo); // insert, update 둘다 함
    	str ="성공";
    	//  String strScript = "alert('\uC5C5\uB370\uC774\uD2B8 \uC644\uB8CC'); location.href = './index.do';";
    	//    myutil.webScript(res, strScript);
    	return str;
    }
    
    
    // 기본 관리비 업데이트
    @ResponseBody
    @RequestMapping(value="updateTMm.do", produces = "application/json; charset=utf-8")
    public String updateTMm(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	System.out.println(vo.getJiML());
    	
    	ms.updateTMm(vo, res);
    	str ="성공";
    	return str;
    }
    
    
    
    //---------------수도
    
    @RequestMapping("water.do")
    public String water(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
     
	String flag = "false";
    	
		//세션으로 가져오기
		vo.setuId((String)ss.getAttribute("ssID"));
    	
        //System.out.println("값 체크 : " + vo.getYyyy() + " / " + vo.getMm());
    	
        String yyyy= vo.getYyyy();
        String mm= vo.getMm();
        if(yyyy == null || yyyy.equals("")) {
        	yyyy= "" + LocalDate.now().getYear();
        	mm=  JavaUtil.checkMM(""+LocalDate.now().getMonthValue(), "0");
        }else {
        	yyyy= vo.getYyyy();
        	mm = JavaUtil.checkMM(vo.getMm(), "0");
        	flag = "true";
        }
        
        // 체크하는 용도로 사용함
        vo.setgChk(flag);
        
    	String yyyy2 = "";
    	String yyyy3= "";
    	String mm2= "" +(LocalDate.now().getMonthValue()-1);
    	String mm3= "" +(LocalDate.now().getMonthValue()-2);

    	// 당월분만
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
	       
	       System.out.println(vo.getuId() + " 1");
	       System.out.println(vo.getYyyy()+ " 1");
	       System.out.println(vo.getMm() + " 1");
       
	       
	       // 여기부터 시작
        // 이번달
	       List<ManageM> arrViewNow = ms.manageWaNow(vo);
        
        //-------------------------------------//
        // 작년 동월 값
        
        List<ManageM> arrViewPastY = ms.waPassSame(vo);
        //--------------------------------
        
        //12개월 데이터
        vo.setYyyy(yyyy);
        vo.setMm(mm);
        List<ManageM> arrViewPast12 = ms.waNP12m(vo);
        //--------------------------------  
    
        // 이번달, 이전달 비교
        
        
        vo.setMm2(JavaUtil.checkMM(mm, "1"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "1"));
        
        System.out.println("함수로 체크 확인  : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast = ms.waNP(vo);
        //-------------------------------//
    	// 당월에서부터 전 6개월치 가스비
        vo.setMm2(JavaUtil.checkMM(mm, "6"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "6"));
    	
        System.out.println("함수로 체크 확인 2 : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast6 = ms.waNP6m(vo);
        
      //--------------------------------
        
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
        
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast6", arrViewPast6);
        model.addAttribute("arrViewPast12", arrViewPast12);
        model.addAttribute("arrViewPastY", arrViewPastY);
        model.addAttribute("repeat", "1"); // 1년 차트(x축 컬럼수 만큼) 반복횟수 (원하는 컬럼 수 - 1)
        model.addAttribute("type", "wa"); // 차트  메뉴별로 구성 컬럼이 달라서 타입으로 구분
        model.addAttribute("vo", vo);
    	
    	return "manageM/water";
    }
    
 // 기본 수도료 업데이트
    @ResponseBody
    @RequestMapping(value="allUpdateWa.do", produces = "application/json; charset=utf-8")
    public String allUpdateWa(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
    		throws Exception
    {
    	
    	String str = "";
    	
    	ms.allUpdateWa(vo, res);
    	str ="성공";
    	return str;
    }
    
    // 수도상세 업데이트 1
    @ResponseBody
    @RequestMapping(value="updateTwaM.do", produces = "application/json; charset=utf-8")
    public String updatWa(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse res)
        throws Exception
    {
        
        String str = "";
        System.out.println(vo.getMode() + "//" + vo.getuId() + "//" + vo.getIdx());
        
            ms.updateWa(vo, res);
            str ="성공";
          //  String strScript = "alert('\uC5C5\uB370\uC774\uD2B8 \uC644\uB8CC'); location.href = './index.do';";
        //    myutil.webScript(res, strScript);
        return str;
    }
    
    // 가스 계량기, 고객번호 최근 데이터로 업데이트
    @ResponseBody
    @RequestMapping(value="newUpwa.do", produces = "application/json; charset=utf-8")
    public String newUpwa(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception
    {
    	
    	// 세션으로 가져오기
        vo.setuId((String)ss.getAttribute("ssID"));
    	
    	System.out.println(vo.getTp());
    	System.out.println(vo.getIdx() + "확인");
    	System.out.println(vo.getYyyy() + "확인");
    	
    	String result = ms.newUpwa(vo, ss);
    	
    	
    	
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	
    	System.out.println(result + "확인");
    	
    	return  gson.toJson(result); 
    	
    }
    
}
