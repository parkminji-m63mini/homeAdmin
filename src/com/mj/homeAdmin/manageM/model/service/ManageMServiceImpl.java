// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ManageMServiceImpl.java

package com.mj.homeAdmin.manageM.model.service;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mj.homeAdmin.comm.JavaUtil;
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
    		 vo.setgChk(LocalDate.now() +"");
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
	public List<ManageM> manageListP3(ManageM vo)  throws Exception{
		
		List<ManageM> arrList = dao.manageListP3(vo);
		return arrList;
	}
	
	/**
	 * 공과금 전체 데이터 조회 (12개월)
	 */
	public List<ManageM> manageListP12(ManageM vo)  throws Exception{
		
		List<ManageM> arrList = dao.manageListP12(vo);
		
		// 1년간의 데이터는 13개의 데이터가 나와야함
		// 그게 아니라면 자리 채우기 데이터 삽입
		if(arrList.size() != 13) {
			
			// 현재 vo있는 yyyy, mm 데이터를 기준함
			for (int i = 1; i < 12; i++) {
				System.out.println(vo.getYyyy() + "/" + vo.getMm() + "시작");
				
				String yy = vo.getYyyy();
				String mm = vo.getMm();
				
			// 현재 데이터는 무조건 있음으로 그 다음월부터 데이터 확인
			vo.setYyyy(JavaUtil.checkYYYY(vo.getYyyy(),vo.getMm(), i+""));
			vo.setMm(JavaUtil.checkMM(vo.getMm(), i+""));
			
			System.out.println( i + "i 값");
			System.out.println(vo.getYyyy() + "/" + vo.getMm() + "확인22");
			// 해당 데이터가 있는지 체크
			String chk = dao.chkD(vo);
			
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 dao.insertMAll(vo);
			}	
			
			// 다시 기본데이터로 값 세팅
			vo.setMm(mm);
			vo.setYyyy(yy);
		}
			arrList = dao.manageListP12(vo);
		}
			
		return arrList;
	}


	/**
	 * 가스비 상세 데이터 조회 (당월)
	 */
	public List<ManageM> manageGasNow(ManageM vo)  throws Exception{
		
		List<ManageM> arrList = dao.manageGasNow(vo);
		
		 // 당월 가스 데이터가 없다면 새로 생성
   	 if(arrList.isEmpty()) {
   		 
   		 // 공과금 전체 데이터를 가지고 있는 지 부터 확인
   		 List<ManageM> arrListChk = dao.manageList(vo);

   		 // gChk는 값 담기위해  일시적으로 사용한거임 별 의미없음
   		 if(vo.getgChk().equals("true")) {
   			 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
   			 vo.setgChk(dt);
   		 }else {
   			 vo.setgChk(LocalDate.now() +"");
   		 }
   		 
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

	public void updateGchk(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.updateGchk(vo);
	}

	public void updateTgasM(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.updateTgasM(vo);
	}

	public void updateGchkA(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.updateGchkA(vo);
		
	}

	public void updateGasNum(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.updateGasNum(vo);
		
	}

	public void updatepNum(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.updatepNum(vo);
		
	}

	public void allUpdateGas(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.allUpdateGas(vo);
		
	}

	public List<ManageM> gasNP(ManageM vo)  throws Exception{
			List<ManageM> arrList = dao.gasNP(vo);
    	
    	return arrList;
	}

	public List<ManageM> gasNP6m(ManageM vo)  throws Exception{
		
		vo.setYyyy(vo.getYyyy() + "/" + vo.getMm());
		vo.setYyyy2(vo.getYyyy2() + "/" + vo.getMm2());
		
		System.out.println(vo.getYyyy() +  "  : yyyy 확인");
		System.out.println(vo.getYyyy2() +  "  : yyyy2 확인");
		
		List<ManageM> arrList = dao.gasNP6m(vo);
		return arrList;
	}

	public String newUp(ManageM vo, HttpSession ss)  throws Exception{
		String result = dao.newUp(vo); 
		return result; 
		
	}

	@Override
	public List<ManageM> managePassSame(ManageM vo) throws Exception {
		
		
		List<ManageM> arrList = dao.managePassSame(vo);

		
		// 작년 동월 데이터가 있는지 확인 
		// 당월 데이터는 무조건 있으니 1이라면 전년도 데이터가 없는 것
		if(arrList.size() == 1) {
			 
			// insert 시 필요한 데이터 셋팅
			vo.setYyyy(Integer.parseInt(vo.getYyyy()) - 1  + "");
			String dt = vo.getYyyy()+ "/" + vo.getMm() + "/1";
   			 vo.setgChk(dt);
   			 
   			 System.out.println(vo.getgChk() + "gChk 확인");
			dao.insertMAll(vo);
			
			// insert 후 다시 원래대로 세팅
			vo.setYyyy(Integer.parseInt(vo.getYyyy()) + 1  + "");
			
			arrList = dao.managePassSame(vo);
		}
	
    	
    	return arrList;
	}

	@Override
	public List<ManageM> gasNP12m(ManageM vo) throws Exception {
	
		List<ManageM> arrList = dao.gasNP12m(vo);
		
		// 1년간의 데이터는 13개의 데이터가 나와야함
		// 그게 아니라면 자리 채우기 데이터 삽입
		if(arrList.size() != 13) {
			
			// 현재 vo있는 yyyy, mm 데이터를 기준함
			for (int i = 1; i <= 12; i++) {
				System.out.println("==============================");
				System.out.println(vo.getYyyy() + "/" + vo.getMm() + "시작");
				
				String yy = vo.getYyyy();
				String mm = vo.getMm();
				
			// 현재 데이터는 무조건 있음으로 그 다음월부터 데이터 확인
			vo.setYyyy(JavaUtil.checkYYYY(vo.getYyyy(),vo.getMm(), i+""));
			vo.setMm(JavaUtil.checkMM(vo.getMm(), i+""));
			
			System.out.println( i + "i 값");
			System.out.println(vo.getYyyy() + "/" + vo.getMm() + "확인22");
			// 해당 데이터가 있는지 체크
			String chk = dao.chkDG(vo);
			
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 
	   			 // 전체 공과금 데이터가 있는지 확인
	   		  String chk2 = dao.manageIndexS(vo);
	   		
	   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
	   			//System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
	   			// 공과금 데이터 생성
	   			dao.insertMAll(vo);
	   			
	   			// 가스 데이터에 넣을 조인 idx 가져오기
	   			// jidx 세팅
	   			vo.setJidx(dao.manageIndex(vo));
	   			//System.out.println("jidx : " + vo.getJidx() );
	   			// gas 월 데이터 새로 생성
	   			dao.insertMGAS(vo);
	   		}else {
	   			//System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
	   			vo.setJidx(dao.manageIndex(vo));
	   			dao.insertMGAS(vo);
	   			//System.out.println("jidx : " + vo.getJidx() );
	   		}
	   			 
			}	
			
			// 다시 기본데이터로 값 세팅
			vo.setMm(mm);
			vo.setYyyy(yy);
		}
			 arrList = dao.gasNP12m(vo);
		}
			
		return arrList;
	}

	@Override
	public List<ManageM> gasPassSame(ManageM vo) throws Exception {
		List<ManageM> arrList = dao.gasPassSame(vo);

		System.out.println(vo.getYyyy() + "/" + vo.getMm() + "날짜 확인");
				
		System.out.println(arrList.size()  + "크기확인");
		
		// 작년 동월 데이터가 있는지 확인 
		// 당월 데이터는 무조건 있으니 1이라면 전년도 데이터가 없는 것
		if(arrList.size() == 1) {
			// 해당 데이터가 있는지 체크
			String chk = dao.chkDG(vo);
			
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 
	   			 // 전체 공과금 데이터가 있는지 확인
	   		  String chk2 = dao.manageIndexS(vo);
	   		
	   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
	   			System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
	   			// 공과금 데이터 생성
	   			dao.insertMAll(vo);
	   			
	   			// 가스 데이터에 넣을 조인 idx 가져오기
	   			// jidx 세팅
	   			vo.setJidx(dao.manageIndex(vo));
	   			System.out.println("jidx : " + vo.getJidx() );
	   			// gas 월 데이터 새로 생성
	   			dao.insertMGAS(vo);
	   		}else {
	   			System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
	   			vo.setJidx(dao.manageIndex(vo));
	   			dao.insertMGAS(vo);
	   			System.out.println("jidx : " + vo.getJidx() );
	   		}
	   			 
			}	
			arrList = dao.gasPassSame(vo);
		}
	
    	
    	return arrList;
	}

	
	//------------ 인터넷 시작 ----------------
	/** 인터넷 당월 요금
	 *
	 */
	@Override
	public List<ManageM> manageItNow(ManageM vo) throws Exception {
		List<ManageM> arrList = dao.manageItNow(vo);
		// 여기부터 만들면 됨~!!!
		
		System.out.println(arrList.isEmpty() + " : arr 체크");

		// 당월 가스 데이터가 없다면 새로 생성
  	 if(arrList.isEmpty() == true || arrList.get(0) == null) {
  		 
  		 
  		 // 공과금 전체 데이터를 가지고 있는 지 부터 확인
  		 List<ManageM> arrListChk = dao.manageList(vo);

  		 // gChk는 값 담기위해  일시적으로 사용한거임 별 의미없음
  		 if(vo.getgChk().equals("true")) {
  			 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
  			 vo.setgChk(dt);
  		 }else {
  			 vo.setgChk(LocalDate.now() +"");
  		 }
  		 
  		 // 전체 데이터가 없다면 생성
  		 if(arrListChk.isEmpty()|| arrListChk.get(0) == null) {
  			 
  			 
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
  		 dao.insertMIT(vo);
  		 //------------------------
  		 System.out.println("넘어옴");
  		 
  		 // 다시 불러오기
  		  arrList = dao.manageItNow(vo);
  	 }
 	 
		
		
		return arrList;
	}

	public void allUpdateIt(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.allUpdateIt(vo);
		
	}

	@Override
	public void updateTItM(ManageM vo, HttpServletResponse httpservletresponse) throws Exception {
		dao.updateTItM(vo);
		
	}

	@Override
	public List<ManageM> itNP(ManageM vo) throws Exception {
	List<ManageM> arrList = dao.itNP(vo);
    	System.out.println(arrList.size() + " /// arrList.si");
    	String mm = vo.getMm();
    	String yyyy = vo.getYyyy();
	if(arrList.size() == 1) {
		// 해당 데이터가 있는지 체크
		
		vo.setMm(JavaUtil.checkMM(vo.getMm(), "1"));
		vo.setYyyy(JavaUtil.checkYYYY(vo.getYyyy(),vo.getMm(), "1"));
		String chk = dao.chkDI(vo);
		System.out.println( chk  + " /chk");
		// 데이터 없으면 insert
		if(chk == null || chk.equals("") || chk.isEmpty() == true) {
			 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
   			 vo.setgChk(dt);
   			 
   			 // 전체 공과금 데이터가 있는지 확인
   		  String chk2 = dao.manageIndexS(vo);
   		
   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
   			System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
   			// 공과금 데이터 생성
   			dao.insertMAll(vo);
   			
   			// 가스 데이터에 넣을 조인 idx 가져오기
   			// jidx 세팅
   			vo.setJidx(dao.manageIndex(vo));
   			System.out.println("jidx : " + vo.getJidx() );
   			// gas 월 데이터 새로 생성
   			dao.insertMIT(vo);
   		}else {
   			System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
   			vo.setJidx(dao.manageIndex(vo));
   			dao.insertMIT(vo);
   			System.out.println("jidx : " + vo.getJidx() );
   		}
   			 
	
		}
		vo.setMm(mm);
		vo.setMm(yyyy);
	 arrList = dao.itNP(vo);
	 
	 System.out.println(vo.getYyyy() + "/"+ vo.getMm() + "   " + vo.getYyyy2() + "/"+ vo.getMm2());
		}
	
    	return arrList;
	}
	
	@Override
	public List<ManageM> itNP12m(ManageM vo) throws Exception {
	
		List<ManageM> arrList = dao.itNP12m(vo);
		System.out.println(arrList.size()  +  " ////");
		// 1년간의 데이터는 13개의 데이터가 나와야함
		// 그게 아니라면 자리 채우기 데이터 삽입
		if(arrList.size() != 13) {
			
			// 현재 vo있는 yyyy, mm 데이터를 기준함
			for (int i = 1; i <= 12; i++) {
				System.out.println("==============================");
				System.out.println(vo.getYyyy() + "/" + vo.getMm() + "시작");
				
				String yy = vo.getYyyy();
				String mm = vo.getMm();
				
			// 현재 데이터는 무조건 있음으로 그 다음월부터 데이터 확인
			vo.setYyyy(JavaUtil.checkYYYY(vo.getYyyy(),vo.getMm(), i+""));
			vo.setMm(JavaUtil.checkMM(vo.getMm(), i+""));
			
			System.out.println( i + "i 값");
			System.out.println(vo.getYyyy() + "/" + vo.getMm() + "확인22");
			// 해당 데이터가 있는지 체크
			String chk = dao.chkDI(vo);
			
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 
	   			 // 전체 공과금 데이터가 있는지 확인
	   		  String chk2 = dao.manageIndexS(vo);
	   		
	   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
	   			//System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
	   			// 공과금 데이터 생성
	   			dao.insertMAll(vo);
	   			
	   			// 가스 데이터에 넣을 조인 idx 가져오기
	   			// jidx 세팅
	   			vo.setJidx(dao.manageIndex(vo));
	   			//System.out.println("jidx : " + vo.getJidx() );
	   			// gas 월 데이터 새로 생성
	   			dao.insertMIT(vo);
	   		}else {
	   			//System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
	   			vo.setJidx(dao.manageIndex(vo));
	   			dao.insertMIT(vo);
	   			//System.out.println("jidx : " + vo.getJidx() );
	   		}
	   			 
			}	
			
			// 다시 기본데이터로 값 세팅
			vo.setMm(mm);
			vo.setYyyy(yy);
		}
			 arrList = dao.itNP12m(vo);
		}
			
		return arrList;
	}

	@Override
	public List<ManageM> itPassSame(ManageM vo) throws Exception {
		List<ManageM> arrList = dao.itPassSame(vo);

		System.out.println(vo.getYyyy() + "/" + vo.getMm() + "날짜 확인");
				
		System.out.println(arrList.size()  + "크기확인");
		
		// 작년 동월 데이터가 있는지 확인 
		// 당월 데이터는 무조건 있으니 1이라면 전년도 데이터가 없는 것
		if(arrList.size() == 1) {
			// 해당 데이터가 있는지 체크
			String chk = dao.chkDI(vo);
			
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 
	   			 // 전체 공과금 데이터가 있는지 확인
	   		  String chk2 = dao.manageIndexS(vo);
	   		
	   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
	   			System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
	   			// 공과금 데이터 생성
	   			dao.insertMAll(vo);
	   			
	   			// 가스 데이터에 넣을 조인 idx 가져오기
	   			// jidx 세팅
	   			vo.setJidx(dao.manageIndex(vo));
	   			System.out.println("jidx : " + vo.getJidx() );
	   			// gas 월 데이터 새로 생성
	   			dao.insertMIT(vo);
	   		}else {
	   			System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
	   			vo.setJidx(dao.manageIndex(vo));
	   			dao.insertMIT(vo);
	   			System.out.println("jidx : " + vo.getJidx() );
	   		}
	   			 
			}	
			arrList = dao.itPassSame(vo);
		}
	
    	
    	return arrList;
	}

	//-----------전기--------------------
	@Override
	public List<ManageM> manageElNow(ManageM vo) throws Exception {
		List<ManageM> arrList = dao.manageElNow(vo);
		
		 // 당월 가스 데이터가 없다면 새로 생성
  	 if(arrList.isEmpty()|| arrList.get(0) == null) {
  		 
  		 // 공과금 전체 데이터를 가지고 있는 지 부터 확인
  		 List<ManageM> arrListChk = dao.manageList(vo);

  		 // gChk는 값 담기위해  일시적으로 사용한거임 별 의미없음
  		 if(vo.getgChk().equals("true")) {
  			 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
  			 vo.setgChk(dt);
  		 }else {
  			 vo.setgChk(LocalDate.now() +"");
  		 }
  		 
  		 // 전체 데이터가 없다면 생성
  		 if(arrListChk.isEmpty() || arrListChk.get(0) == null) {
  			 
  			 
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
  		 dao.insertMEL(vo);
  		 //------------------------
  		 System.out.println("넘어옴");
  		 
  		 // 다시 불러오기
  		  arrList = dao.manageElNow(vo);
  	 }
 	 
		
		
		return arrList;
	}
	
	public List<ManageM> elNP(ManageM vo)  throws Exception{
		List<ManageM> arrList = dao.elNP(vo);
	
	return arrList;
}

	@Override
	public List<ManageM> elPassSame(ManageM vo) throws Exception {
		List<ManageM> arrList = dao.elPassSame(vo);

		System.out.println(vo.getYyyy() + "/" + vo.getMm() + "날짜 확인");
				
		System.out.println(arrList.size()  + "크기확인");
		
		String yyyy = vo.getYyyy();
		String mm = vo.getMaM();
		
		// 작년 동월 데이터가 있는지 확인 
		// 당월 데이터는 무조건 있으니 1이라면 전년도 데이터가 없는 것
		if(arrList.size() == 1) {
			
		vo.setYyyy(JavaUtil.checkYYYY(vo.getYyyy(),vo.getMm(),"1"));
		vo.setMm(JavaUtil.checkMM(vo.getMm(), "1"));
						
		
			// 해당 데이터가 있는지 체크
			String chk = dao.chkDE(vo);
			System.out.println(chk + " chk 확인");
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 
	   			 // 전체 공과금 데이터가 있는지 확인
	   		  String chk2 = dao.manageIndexS(vo);
	   		
	   		  System.out.println(chk2 + "chk2 값");
	   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
	   			System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
	   			// 공과금 데이터 생성
	   			dao.insertMAll(vo);
	   			
	   			// 가스 데이터에 넣을 조인 idx 가져오기
	   			// jidx 세팅
	   			vo.setJidx(dao.manageIndex(vo));
	   			System.out.println("jidx : " + vo.getJidx() );
	   			// gas 월 데이터 새로 생성
	   			dao.insertMEL(vo);
	   		}else {
	   			System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
	   			vo.setJidx(dao.manageIndex(vo));
	   			dao.insertMEL(vo);
	   			System.out.println("jidx : " + vo.getJidx() );
	   		}
	   			 
			}	
			arrList = dao.elPassSame(vo);
		}
	
    	
    	return arrList;
	}

	public List<ManageM> elNP6m(ManageM vo)  throws Exception{
		
		vo.setYyyy(vo.getYyyy() + "/" + vo.getMm());
		vo.setYyyy2(vo.getYyyy2() + "/" + vo.getMm2());
		
		System.out.println(vo.getYyyy() +  "  : yyyy 확인");
		System.out.println(vo.getYyyy2() +  "  : yyyy2 확인");
		
		List<ManageM> arrList = dao.elNP6m(vo);
		return arrList;
	}
	
	@Override
	public List<ManageM> elNP12m(ManageM vo) throws Exception {
	
		List<ManageM> arrList = dao.elNP12m(vo);
		
		// 1년간의 데이터는 13개의 데이터가 나와야함
		// 그게 아니라면 자리 채우기 데이터 삽입
		if(arrList.size() != 13) {
			
			// 현재 vo있는 yyyy, mm 데이터를 기준함
			for (int i = 1; i <= 12; i++) {
				System.out.println("==============================");
				System.out.println(vo.getYyyy() + "/" + vo.getMm() + "시작");
				
				String yy = vo.getYyyy();
				String mm = vo.getMm();
				
			// 현재 데이터는 무조건 있음으로 그 다음월부터 데이터 확인
			vo.setYyyy(JavaUtil.checkYYYY(vo.getYyyy(),vo.getMm(), i+""));
			vo.setMm(JavaUtil.checkMM(vo.getMm(), i+""));
			
			System.out.println( i + "i 값");
			System.out.println(vo.getYyyy() + "/" + vo.getMm() + "확인22");
			// 해당 데이터가 있는지 체크
			String chk = dao.chkDE(vo);
			
			// 데이터 없으면 insert
			if(chk == null || chk.equals("") || chk.isEmpty() == true) {
				 String dt = vo.getYyyy() + "/" + vo.getMm() + "/1";
	   			 vo.setgChk(dt);
	   			 
	   			 // 전체 공과금 데이터가 있는지 확인
	   		  String chk2 = dao.manageIndexS(vo);
	   		
	   		if(chk2 == null || chk2.equals("") || chk2.isEmpty() == true) {
	   			//System.out.println("chk2 null시 값" + vo.getYyyy() + "/" + vo.getMm());
	   			// 공과금 데이터 생성
	   			dao.insertMAll(vo);
	   			
	   			// 가스 데이터에 넣을 조인 idx 가져오기
	   			// jidx 세팅
	   			vo.setJidx(dao.manageIndex(vo));
	   			//System.out.println("jidx : " + vo.getJidx() );
	   			// gas 월 데이터 새로 생성
	   			dao.insertMEL(vo);
	   		}else {
	   			//System.out.println("chk2 null 아님 " + vo.getYyyy() + "/" + vo.getMm());
	   			vo.setJidx(dao.manageIndex(vo));
	   			dao.insertMEL(vo);
	   			//System.out.println("jidx : " + vo.getJidx() );
	   		}
	   			 
			}	
			
			// 다시 기본데이터로 값 세팅
			vo.setMm(mm);
			vo.setYyyy(yy);
		}
			 arrList = dao.elNP12m(vo);
		}
			
		return arrList;
	}
	public void updateTelM(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.updateTelM(vo);
	}
	
	public String newUpel(ManageM vo, HttpSession ss)  throws Exception{
		String result = dao.newUpel(vo); 
		return result; 
		
	}
	public void updateEl(ManageM vo, HttpServletResponse res)   throws Exception{
		
		dao.updateEl(vo);
		
		// 값 들어가지 않아서 잠시 멈춤
		// 기본 테이블 가스 컬럼도 수정 (상세값 전부 + 했을 때 값으로) update
		//dao.updateMGas(vo);
	}
	public void allUpdateEl(ManageM vo, HttpServletResponse res)  throws Exception{
		dao.allUpdateEl(vo);
		
	}

}
