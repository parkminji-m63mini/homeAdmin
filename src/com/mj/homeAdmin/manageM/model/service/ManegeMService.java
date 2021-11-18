// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManegeMService.java

package com.mj.homeAdmin.manageM.model.service;

import com.mj.homeAdmin.manageM.vo.ManageM;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public interface ManegeMService
{

    public abstract  List<ManageM> manageIndex(ManageM managem)
        throws Exception;
    
    public abstract  List<ManageM> manageNP(ManageM managem)
    		throws Exception;
    
    public abstract  List<ManageM> manageListP3(ManageM managem)
    		throws Exception;

    public abstract void insertMAll(ManageM managem)
        throws Exception;

    public abstract void updateMAll(ManageM managem, HttpServletResponse httpservletresponse)
        throws Exception;
    
    public abstract void insertMGAS(ManageM managem)
    		throws Exception;
    
}
