// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CmmnServiceImpl.java

package com.mj.homeAdmin.commn.service;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
