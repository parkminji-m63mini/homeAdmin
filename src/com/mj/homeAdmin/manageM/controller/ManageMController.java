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
        String mm= "" +LocalDate.now().getMonthValue();
        
	       vo.setYyyy(yyyy);
	       vo.setMm(mm);
       
        // 이번달
        List<ManageM> arrViewNow = ms.manageIndex(vo);
        
        // 이번달, 이전달 비교
        String mm2= "" +(LocalDate.now().getMonthValue()-1);
        vo.setMm2(mm2);
        
        
        String yyyy2 = "";
        
        // 전월이 12월 일 때는 전년도로 변경
        if(mm2.equals("12")) {
        	 yyyy2 = ""+ (LocalDate.now().getYear()- 1);
        	
        	
        }else {
        	yyyy2 = yyyy;
        }
        vo.setYyyy2(yyyy2);
        List<ManageM> arrViewPast = ms.manageNP(vo);
        
        
        // 이번달, 이전달 비교
        
        
        // 이번달, 3개월 평균값 비교
        
        
        
        System.out.println((new StringBuilder()).append(arrViewNow.get(0)).append(": 000").toString());
        model.addAttribute("arrViewNow", arrViewNow);
        model.addAttribute("arrViewPast", arrViewPast);
        System.out.println((new StringBuilder(String.valueOf(((ManageM)arrViewNow.get(0)).getGasM()))).append(" \uC778\uB371\uC2A4 \uAC00\uC2A4").toString());
        System.out.println("index \uB85C\uB529 \uC644");
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

    public String electric()
    {
        return "manageM/electric";
    }

    public String water()
    {
        return "manageM/water";
    }

    public String gas(ManageM manageM, Model model, RedirectAttributes rdAttr, HttpServletResponse response)
    {
        return "manageM/gas";
    }

}
