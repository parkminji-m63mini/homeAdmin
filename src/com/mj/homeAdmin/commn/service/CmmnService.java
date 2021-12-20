// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CmmnService.java

package com.mj.homeAdmin.commn.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

public interface CmmnService
{

    public abstract void webScript(HttpServletResponse httpservletresponse, String s)
        throws Exception;
    
    public abstract void goSessionChk(MyinfoVo vo, HttpSession ss, HttpServletRequest req)
            throws Exception;
}
