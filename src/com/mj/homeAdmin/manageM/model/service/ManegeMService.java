// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManegeMService.java

package com.mj.homeAdmin.manageM.model.service;

import com.mj.homeAdmin.manageM.vo.ManageM;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface ManegeMService
{

    public abstract  List<ManageM> manageIndex(ManageM managem)
        throws Exception;
    
    public abstract  List<ManageM> manageNP(ManageM managem)
    		throws Exception;
    
    public abstract  List<ManageM> manageListP3(ManageM managem)
    		throws Exception;
    
    public abstract  List<ManageM> manageGasNow(ManageM managem)
    		throws Exception;

    public abstract void insertMAll(ManageM managem)
        throws Exception;

    public abstract void updateMAll(ManageM managem, HttpServletResponse httpservletresponse)
        throws Exception;
    
    public abstract void insertMGAS(ManageM managem)
    		throws Exception;
    
    public abstract void updateGas(ManageM managem, HttpServletResponse httpservletresponse)
            throws Exception;
    
    public abstract void updateGchk(ManageM managem, HttpServletResponse httpservletresponse)
    		throws Exception;
    
    public abstract void updateTgasM(ManageM managem, HttpServletResponse httpservletresponse)
    		throws Exception;
    public abstract void updateGasNum(ManageM managem, HttpServletResponse httpservletresponse)
    		throws Exception;
    public abstract void updatepNum(ManageM managem, HttpServletResponse httpservletresponse)
    		throws Exception;
    public abstract void allUpdateGas(ManageM managem, HttpServletResponse httpservletresponse)
    		throws Exception;
    public abstract  List<ManageM> gasNP(ManageM managem)
    		throws Exception;
    public abstract  List<ManageM> gasNP6m(ManageM managem)
    		throws Exception;

	public abstract void updateGchkA(ManageM vo, HttpServletResponse res)throws Exception;

	public abstract String newUp(ManageM vo, HttpSession ss)throws Exception;

	public abstract List<ManageM> managePassSame(ManageM vo)throws Exception;

	public abstract List<ManageM> manageListP12(ManageM vo)throws Exception;

	public abstract List<ManageM> gasNP12m(ManageM vo)throws Exception;

	public abstract List<ManageM> gasPassSame(ManageM vo)throws Exception;
	
	//--------------------- 인터넷 --------------------
	public abstract  List<ManageM> manageItNow(ManageM managem)	throws Exception;
	
}

