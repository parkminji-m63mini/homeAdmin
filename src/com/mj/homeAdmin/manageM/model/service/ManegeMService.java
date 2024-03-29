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
	
	  public abstract void allUpdateIt(ManageM managem, HttpServletResponse httpservletresponse)
	    		throws Exception;
	  public abstract void updateTItM(ManageM vo, HttpServletResponse httpservletresponse)
	    		throws Exception;
	  public abstract  List<ManageM> itNP(ManageM managem)
	    		throws Exception;
	  
	  public abstract List<ManageM> itNP12m(ManageM vo)throws Exception;
	  public abstract List<ManageM> itPassSame(ManageM vo)throws Exception;
	  
	 //-------------------전기------------------------ 
	    public abstract  List<ManageM> manageElNow(ManageM managem)
	    		throws Exception;
	    public abstract  List<ManageM> elNP(ManageM managem)
	    		throws Exception;
	    public abstract List<ManageM> elPassSame(ManageM vo)throws Exception;
	    
	    public abstract  List<ManageM> elNP6m(ManageM managem)
	    		throws Exception;
	    public abstract List<ManageM> elNP12m(ManageM vo)throws Exception;

	    public abstract void updateTelM(ManageM vo, HttpServletResponse httpservletresponse)
	    		throws Exception;
	    public abstract String newUpel(ManageM vo, HttpSession ss)throws Exception;
	    public abstract void updateEl(ManageM managem, HttpServletResponse httpservletresponse)
	            throws Exception;
	    public abstract void allUpdateEl(ManageM managem, HttpServletResponse httpservletresponse)
	    		throws Exception;
//----------------------관리------------------------------------
		public abstract List<ManageM> manageMaNow(ManageM vo)throws Exception;
		 public abstract void updateMm(ManageM managem, HttpServletResponse httpservletresponse)
		            throws Exception;

		public abstract String manageMaNowSum(ManageM vo)  throws Exception;

		public abstract void deleteMm(ManageM vo)throws Exception;

		public abstract List<ManageM> MmNP(ManageM vo)throws Exception;

		public abstract List<ManageM> mMPassSame(ManageM vo)throws Exception;
		 public abstract void updateTMm(ManageM vo, HttpServletResponse httpservletresponse)
		    		throws Exception;
		  
		  public abstract List<ManageM> mMNP12m(ManageM vo)throws Exception;
		  
		  
//---------------수도-------------------
		   public abstract  List<ManageM> manageWaNow(ManageM managem)
		    		throws Exception;
		    public abstract  List<ManageM> waNP(ManageM managem)
		    		throws Exception;
		    public abstract List<ManageM> waPassSame(ManageM vo)throws Exception;
		    
		    public abstract  List<ManageM> waNP6m(ManageM managem)
		    		throws Exception;
		    public abstract List<ManageM> waNP12m(ManageM vo)throws Exception;

		    public abstract void updateTwaM(ManageM vo, HttpServletResponse httpservletresponse)
		    		throws Exception;
		    public abstract String newUpwa(ManageM vo, HttpSession ss)throws Exception;
		    public abstract void updateWa(ManageM managem, HttpServletResponse httpservletresponse)
		            throws Exception;
		    public abstract void allUpdateWa(ManageM managem, HttpServletResponse httpservletresponse)
		    		throws Exception;
		  
		  
		  
}

