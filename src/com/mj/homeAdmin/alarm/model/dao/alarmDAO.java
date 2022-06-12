package com.mj.homeAdmin.alarm.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.alarm.vo.alarm;

@Repository
public class alarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	public alarmDAO() {
		
	}

	// 입력
	public int insertAlarm(alarm vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("alarmMapper.insertAlarm", vo);
	}
	
	public List<alarm> selectAlarmList(String id){
		return sqlSession.selectList("alarmMapper.selectAlarmList", id);
	}

	// 수정화면 조회
	public alarm selectAlarmOnd(int idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("alarmMapper.selectAlarmOne", idx);
	}

	// 수정
	public int updateAlarm(alarm vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("alarmMapper.updateAlarm", vo);
	}

	// 사용여부 수정
	public int updateYN(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("alarmMapper.updateYN", map);
	}

	// 삭제
	public int deleteAlarm(int idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("alarmMapper.deleteAlarm", idx);
	}
}
