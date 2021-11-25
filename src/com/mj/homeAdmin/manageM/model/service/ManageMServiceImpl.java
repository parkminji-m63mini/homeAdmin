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

/**
 * @author Administrator
 *
 */
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
    	 System.out.println(arrList + ": 테스트 1");
    	 
    	 // 당월 데이터가 없다면 새로 생성
    	 if(arrList.isEmpty()) {
    		 System.out.println("들어옴");
    		 dao.insertMAll(vo);
    		 System.out.println("넘어옴3");
    		 
    		 //가스비 상세 데이터 생성 하기 ------------------
    		 
    		 // 조인idx 가져옴 (새로만든 MANAGE_MA 의 IDX)
    		 int jidx = dao.manageIndex(vo);
    		 
    		 System.out.println("넘어옴 2");
    		 vo.setJidx(jidx);
    		 
    		 System.out.println("jidx : " + jidx);
    		 //가스비 상세 데이터 생성
    		 dao.insertMGAS(vo);
    		 //------------------------
    		 System.out.println("넘어옴");
    		 
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

    
    // 공과금 테이블 데이터 INSERT (MANAGE_MA)
    @Transactional(rollbackFor=Exception.class)
    @Override
    public void insertMAll(ManageM vo)
        throws Exception
    {
        dao.insertMAll(vo);
    }

    // 공과금 테이블 데이터 UPDATE (MANAGE_MA)
    @Transactional(rollbackFor=Exception.class)
    @Override
    public void updateMAll(ManageM vo, HttpServletResponse res)
        throws Exception
    {
        dao.updateMAll(vo);
    }

    
    // 공과금 상세 가스 테이블 데이터 INSRT (MANAGE_GAS)
    @Transactional(rollbackFor=Exception.class)
    @Override
    public void insertMGAS(ManageM vo)
        throws Exception
    {
        dao.insertMGAS(vo);
    }
    
	/**
	 * 공과금 전체 데이터 조회 (3개월)
	 */
	public List<ManageM> manageListP3(ManageM vo) {
		
		List<ManageM> arrList = dao.manageListP3(vo);
		return arrList;
	}

	/**
	 * 가스비 상세 데이터 조회 (당월)
	 */
	public List<ManageM> manageGasNow(ManageM vo) {
		
		List<ManageM> arrList = dao.manageGasNow(vo);
		
		 // 당월 가스 데이터가 없다면 새로 생성
   	 if(arrList.isEmpty()) {
   		 
   		 // 공과금 전체 데이터를 가지고 있는 지 부터 확인
   		 List<ManageM> arrListChk = dao.manageList(vo);

   		 // 전체 데이터가 없다면 생성
   		 if(arrListChk.isEmpty()) {
   			 dao.insertMAll(vo);
   		 }
   		 int jidx = 0;
   		 
   		 //가스비 상세 데이터 생성 하기 ------------------

   		 // 조인idx 가져옴 (새로만든 MANAGE_MA 의 IDX)
   		 jidx = dao.manageIndex(vo); // 공과금 전체 데이터 idx 가져오기
   		   
   		  // 생성 후 다시 인덱스 조회
   		   jidx = dao.manageIndex(vo);
   		 vo.setJidx(jidx);
   		 
   		 //가스비 상세 데이터 생성
   		 dao.insertMGAS(vo);
   		 //------------------------
   		 System.out.println("넘어옴");
   		 
   		 // 다시 불러오기
   		  arrList = dao.manageGasNow(vo);
   	 }
  	 
		
		
		return arrList;
	}

	public void updateGas(ManageM vo, HttpServletResponse res)   throws Exception{
		
		dao.updateGas(vo);
		
		// 값 들어가지 않아서 잠시 멈춤
		// 기본 테이블 가스 컬럼도 수정 (상세값 전부 + 했을 때 값으로) update
		//dao.updateMGas(vo);
	}

	public void updateGchk(ManageM vo, HttpServletResponse res) {
		dao.updateGchk(vo);
	}

	public void updateTgasM(ManageM vo, HttpServletResponse res) {
		dao.updateTgasM(vo);
	}

	public void updateGchkA(ManageM vo, HttpServletResponse res) {
		dao.updateGchkA(vo);
		
	}

	public void updateGasNum(ManageM vo, HttpServletResponse res) {
		dao.updateGasNum(vo);
		
	}


}
