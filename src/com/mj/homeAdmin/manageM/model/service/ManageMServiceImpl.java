// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageMServiceImpl.java

package com.mj.homeAdmin.manageM.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.manageM.model.dao.ManageMDAO;
import com.mj.homeAdmin.manageM.vo.ManageM;

// Referenced classes of package com.mj.homeAdmin.manageM.model.service:
//            ManegeMService

@Service
public class ManageMServiceImpl
    implements ManegeMService
{

	@Autowired
    private ManageMDAO dao;
    
	@Autowired
    private CmmnServiceImpl myutil;
	
    public ManageMServiceImpl()
    {
    }

    @Override
    public  List<ManageM> manageIndex(ManageM vo)
        throws Exception
    {
    	
    	 List<ManageM> arrList = dao.manageList(vo);
    	 
    	 
    	 // 여기부터 데이터 값 받는거 확인!
    	 System.out.println();
    	 
    	 // 당월 데이터가 없다면 새로 생성
    	 if(arrList.isEmpty()) {
    		 dao.insertMAll(vo);
    		 
    		 //가스비 상세 데이터 생성 하기 ------------------
    		 
    		 // 조인idx 가져옴 (새로만든 MANAGE_MA 의 IDX)
    		 int jidx = dao.manageIndex(vo);
    		 vo.setJidx(jidx);
    		 
    		 System.out.println("jidx : " + jidx);
    		 //가스비 상세 데이터 생성
    		 dao.insertMGAS(vo);
    		 //------------------------
    		 
    		 // 다시 불러오기
    		  arrList = dao.manageList(vo);
    	 }
        System.out.println((new StringBuilder()).append(arrList).append(" : arrList").toString());
        return arrList;
    }
    
    public List<ManageM> manageNP(ManageM vo) {
    	List<ManageM> arrList = dao.manageNP(vo);
    	
    	return arrList;
    }

    
    // 공과금 테이블 데이터 INSRT (MANAGE_MA)
    @Transactional(rollbackFor=Exception.class)
    @Override
    public void insertMAll(ManageM vo)
        throws Exception
    {
        dao.insertMAll(vo);
    }

    @Transactional(rollbackFor=Exception.class)
    @Override
    public void updateMAll(ManageM vo, HttpServletResponse res)
        throws Exception
    {
        dao.updateMAll(vo);
    }

    
    // 공과금 상세 테이블 데이터 INSRT (MANAGE_GAS)
    @Transactional(rollbackFor=Exception.class)
    @Override
    public void insertMGAS(ManageM vo)
        throws Exception
    {
        dao.insertMGAS(vo);
    }
    
	public List<ManageM> manageListP3(ManageM vo) {
		
		List<ManageM> arrList = dao.manageListP3(vo);
		return arrList;
	}


}
