package com.yd05.mprj.delicious.service;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class DeliciousServiceImpl implements DeliciousService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private DeliciousMapper map = sqlSession.getMapper(DeliciousMapper.class);
	
	@Override
	public int insertDel(DeliciousVO vo) {
		// TODO Auto-generated method stub
		return map.insertDel(vo);
	}

	

}
