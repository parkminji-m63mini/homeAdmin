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
import com.mj.homeAdmin.manageM.model.service.ManageMServiceImpl;
import com.mj.homeAdmin.manageM.model.service.ManegeMService;
import com.mj.homeAdmin.manageM.vo.ManageM;

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
        
        
        //------------------------------------//
        // 이번달, 3개월 평균값 비교
        
        
        vo.setMm3(JavaUtil.checkMM(mm, "2"));
        vo.setYyyy3(JavaUtil.checkYYYY(yyyy, mm, "2"));
        
        List<ManageM> arrViewPast3 = ms.manageListP3(vo); 
        
        //-------------------------------------//
        
        System.out.println("확인1 :" + vo.getYyyy() + "/" + vo.getMm());
        System.out.println("확인2 :" + vo.getYyyy2() + "/" + vo.getMm2());
        System.out.println("확인3 :" + vo.getYyyy3() + "/" + vo.getMm3());
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast3", arrViewPast3);
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
        //--------------------------------
        
        
    	// 당월에서부터 전 6개월치 가스비
        vo.setMm2(JavaUtil.checkMM(mm, "6"));
        vo.setYyyy2(JavaUtil.checkYYYY(yyyy, mm, "6"));
    	
        System.out.println("함수로 체크 확인 2 : " + vo.getYyyy2() + "년 " + vo.getMm2() + "월 ");
        
        List<ManageM> arrViewPast2 = ms.gasNP6m(vo);
        
        
    	
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
        
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast2", arrViewPast2);
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
    public String electric()
    {
        return "manageM/electric";
    }
    @RequestMapping("water.do")
    public String water()
    {
        return "manageM/water";
    }

    @RequestMapping("it.do")
    public String it(ManageM vo, Model model, HttpSession ss, RedirectAttributes rdAttr, HttpServletResponse response)
    {
        return "manageM/gas";
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
    	
        System.out.println("test");
        
        model.addAttribute("gasV", gasV);
    	return "manageM/detailView";
    }
    
    
}
