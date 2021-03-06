package com.mj.homeAdmin.checkList.model.service;

import java.util.List;
import java.util.Map;

import com.mj.homeAdmin.checkList.vo.checkList;

public interface checkListService {

	// 체크리스트 조회
	public abstract List<checkList> selectCheckList(String id) throws Exception;

	// 체크리스트 디테일 조회
	public abstract List<checkList> selectCheckListDetail(String id) throws Exception;

	// 체크리스트 수정 조회
	public abstract List<checkList> checkListDetailView(checkList vo);

	// 체크리스트마스터 수정
	public abstract int updateCheckListMaster(checkList vo);

	// 체크리스트 추가
	public abstract int insertCheckList(checkList vo);

	// 체크리스트 디테일 추가
	public abstract int insertCheckListDetail(checkList vo);

	// 체크리스트 디테일 수정
	public abstract int updateCheckListDetail(checkList vo);

	// 삭제
	public abstract int deleteCheckList(int idx);

	// 사용여부 변경
	public abstract int updateYN(Map<String, Object> map);
	

}
