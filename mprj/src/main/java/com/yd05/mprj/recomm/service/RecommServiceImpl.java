package com.yd05.mprj.recomm.service;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class RecommServiceImpl implements RecommService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private RecommMapper map = sqlSession.getMapper(RecommMapper.class);
	
	@Override
	public long selectRecomm(RecommVO vo) {
		// 
		return map.selectRecomm(vo);
	}

	@Override
	public void insertRecomm(RecommVO vo) {
		// 
		map.insertRecomm(vo);
	}

	@Override
	public void deleteRecomm(RecommVO vo) {
		// 
		map.deleteRecomm(vo);
	}

}
