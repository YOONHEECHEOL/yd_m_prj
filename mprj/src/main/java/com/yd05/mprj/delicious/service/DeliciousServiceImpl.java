package com.yd05.mprj.delicious.service;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class DeliciousServiceImpl implements DeliciousService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private DeliciousMapper map = sqlSession.getMapper(DeliciousMapper.class);
	
	@Override
	public DeliciousVO selectDeli(DeliciousVO vo) {
		// 단건
		return map.selectDeli(vo);
	}
	
	@Override
	public int insertDeli(DeliciousVO vo) {
		// 등록
		return map.insertDeli(vo);
	}

	@Override
	public boolean isConidCheck(String str) {
		// 중복체크
		return map.isConidCheck(str);
	}
}
