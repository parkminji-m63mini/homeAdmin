// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageMServiceImpl.java

package com.mj.homeAdmin.manageM.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
    	 
    	 // 당월 데이터가 없다면 새로 생성
    	 if(arrList.isEmpty()) {
    		 dao.insertMAll(vo);
    		  arrList = dao.manageList(vo);
    	 }
        System.out.println((new StringBuilder()).append(arrList).append(" : arrList").toString());
        return arrList;
    }
    
    public List<ManageM> manageNP(ManageM vo) {
    	List<ManageM> arrList = dao.manageNP(vo);
    	
    	return arrList;
    }

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


}
