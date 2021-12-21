// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HomeController.java

package com.mj.homeAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController
{

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "../../main";
	}
	
	@RequestMapping(value = "/code.do", method = RequestMethod.GET)
	public String code()  throws Exception{
		System.out.println("코드 들어옴");
		return "../common/code";
	}
}
