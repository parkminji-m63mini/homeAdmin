// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CmmnServiceImpl.java

package com.mj.homeAdmin.commn.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

// Referenced classes of package com.mj.homeAdmin.commn.service:
//            CmmnService

@Service
public class CmmnServiceImpl
    implements CmmnService
{

	@Autowired
	private CmmnService myutil;

    public CmmnServiceImpl()
    {
    }

    @Override
    public void webScript(HttpServletResponse res, String strScript)
        throws Exception
    {
        res.setContentType("text/html; charset=UTF-8");
        res.setCharacterEncoding("utf-8");
        PrintWriter writer = res.getWriter();
        writer.println("<script type='text/javascript'>");
        writer.println(strScript);
        writer.println("</script>");
        writer.flush();
    }
    
	public void goSessionChk(MyinfoVo vo, HttpSession ss, HttpServletRequest req) throws Exception {
		// LOGGER.info("========================= 로그인 세션체크 생성 =====================================");
		ss.setAttribute("ssID", vo.getId());
		ss.setAttribute("ssNM", vo.getNm());
		ss.setAttribute("ssnNM", vo.getnNm());
		ss.setAttribute("ssGB", vo.getGb());
		ss.setAttribute("ssTYPE", vo.getSnsInfo());
		ss.setAttribute("ssIP", req.getRemoteAddr());
	}
	
	public MyinfoVo getSessionChk(HttpSession ss) throws Exception {
		// LOGGER.info("========================= 로그인 정보 가져오기 =====================================");
		MyinfoVo vo = new MyinfoVo();
		vo.setId((String) ss.getAttribute("ssID"));
		vo.setGb((char) ss.getAttribute("ssGB"));
		vo.setNm((String) ss.getAttribute("ssNM"));
		vo.setnNm((String) ss.getAttribute("ssnNM"));
		
		return vo;
	}
	
	public boolean loginchk(HttpSession ss) {
		boolean result = false;
		String test = (String) ss.getAttribute("ssID");
		if(!test.equals("") || !test.equals(null)) {
			result = true;
		}
		
		return result;
	}

	public String fielUrl(String type) {
		
		String url = "C:\\workspace\\famework\\homeAdmin2\\WebContent\\upload\\";
		
		url += type;
		
		
		return url;
	}
	
public String defalutFielUrl() {
		
		String url = "C:\\workspace\\famework\\homeAdmin2\\WebContent\\upload\\";
		
		return url;
	}
}
