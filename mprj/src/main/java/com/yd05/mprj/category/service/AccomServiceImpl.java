package com.yd05.mprj.category.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class AccomServiceImpl implements AccomService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private AccomMapper map = sqlSession.getMapper(AccomMapper.class);

	@Override
	public List<AccomVO> AccomList() {
		
		return map.AccomList();
	}

}
