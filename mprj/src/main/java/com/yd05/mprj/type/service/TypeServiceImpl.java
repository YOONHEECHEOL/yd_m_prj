package com.yd05.mprj.type.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class TypeServiceImpl implements TypeService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private TypeMapper map = sqlSession.getMapper(TypeMapper.class);
	
	@Override
	public List<TypeVO> selectContentTypeId() {
		// return contentTypeId
		return map.selectContentTypeId();
	}

	@Override
	public List<TypeVO> selectCat1(TypeVO vo) {
		// return cat1
		return map.selectCat1(vo);
	}

	@Override
	public List<TypeVO> selectCat2(TypeVO vo) {
		// return cat2
		return map.selectCat2(vo);
	}

	@Override
	public List<TypeVO> selectCat3(TypeVO vo) {
		// return cat3
		return map.selectCat3(vo);
	}

}
