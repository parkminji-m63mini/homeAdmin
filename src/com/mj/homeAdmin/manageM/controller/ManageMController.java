// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageMController.java

package com.mj.homeAdmin.manageM.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.manageM.model.service.ManageMServiceImpl;
import com.mj.homeAdmin.manageM.vo.ManageM;

@Controller
@RequestMapping("/manageM/*")
public class ManageMController
{
	
	@Autowired
	private ManageMServiceImpl ms;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
    public ManageMController()
    {
    }

    @RequestMapping("index.do")
    public String manegeMIndex(ManageM vo, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
        throws Exception
    {
    	// 나중에 세션으로 가져오기
        vo.setuId("m63mini");
        
        
        System.out.println(LocalDate.now().getYear()  + "  현재 년");      
        System.out.println(LocalDate.now().getMonthValue()  + "  현재 월");   
       
        String yyyy= "" + LocalDate.now().getYear();
        String yyyy2 = "";
        String yyyy3= "";
        String mm= "" +LocalDate.now().getMonthValue();
        String mm2= "" +(LocalDate.now().getMonthValue()-1);
        String mm3= "" +(LocalDate.now().getMonthValue()-2);
        
        
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageIndex(vo);
        
        //-------------------------------//
        // 이번달, 이전달 비교
        vo.setMm2(mm2);
        
        // 전월이 12월 일 때는 전년도로 변경
        if(mm2.equals("12")) {
        	 yyyy2 = ""+ (LocalDate.now().getYear()- 1);
        	 System.out.println("전월이 12월이라면  현재년도 -1 : " + yyyy2);
        	 
        }else {
        	yyyy2 = yyyy;
        }
        vo.setYyyy2(yyyy2);
        List<ManageM> arrViewPast = ms.manageNP(vo);
        
        //------------------------------------//
        // 이번달, 3개월 평균값 비교
        
        
        // 2개월전 월(month)가 12월 일 때 전년도로 변경
        if(mm3.equals("12")) {
       	 yyyy3 = ""+ (LocalDate.now().getYear()- 1);
       	 System.out.println("전월이 12월이라면  현재년도 -1 yyyy3 : " + yyyy3);
       	 
       }else {
       	yyyy3 = yyyy;
       }
        vo.setYyyy3(yyyy3);
        
        List<ManageM> arrViewPast3 = ms.manageListP3(vo); 
        
        //-------------------------------------//
        
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        model.addAttribute("arrViewPast3", arrViewPast3);
     //   System.out.println((new StringBuilder(String.valueOf(((ManageM)arrViewNow.get(0)).getGasM()))).append(" \uC778\uB371\uC2A4 \uAC00\uC2A4").toString());
     //   System.out.println("index \uB85C\uB529 \uC644");
        return "manageM/index";	
    }

    @ResponseBody
    @RequestMapping(value="updateMAll.do", produces = "application/json; charset=utf-8")
    public String updateMAll(ManageM vo, Model model, RedirectAttributes rdAttr, HttpServletResponse res)
        throws Exception
    {
        System.out.println((new StringBuilder(String.valueOf(vo.getuId()))).append(" : id").toString());
        System.out.println((new StringBuilder(String.valueOf(vo.getGasM()))).append(" : gas").toString());
        System.out.println((new StringBuilder(String.valueOf(vo.getYyyy()))).append(" : yyyy").toString());
        System.out.println((new StringBuilder(String.valueOf(vo.getMode()))).append(" : mode").toString());
        
        String str = "";
        
        if(vo.getMode().equals("i")) {
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
    public String gas(ManageM vo, Model model, RedirectAttributes rdAttr, HttpServletResponse response) throws Exception
    {
    	
    	// 나중에 세션으로 가져오기
    	vo.setuId("m63mini");
    	
    	
    	String yyyy= "" + LocalDate.now().getYear();
    	String yyyy2 = "";
    	String yyyy3= "";
    	String mm= "" +LocalDate.now().getMonthValue();
    	String mm2= "" +(LocalDate.now().getMonthValue()-1);
    	String mm3= "" +(LocalDate.now().getMonthValue()-2);

    	// 당월분만
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageIndex(vo);
    	
    	
    	// 당월에서부터 전 6개월치 가스비
    	
    	
    	// 당월 계절에 맞는 가스비 불러오기
    	// 봄 3~5
    	// 여름  6~9
    	// 가을 10~11
    	// 겨울 12~2
    	
        
        
        model.addAttribute("arrViewNow", arrViewNow);
    	return "manageM/gas";
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
    public String it(ManageM vo, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
    {
        return "manageM/gas";
    }
    
}
