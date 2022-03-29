package com.yd05.mprj.visit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class VisitServiceImpl implements VisitService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private VisitMapper map = sqlSession.getMapper(VisitMapper.class);
	
	@Override
	public List<VisitVO> selectVisit(VisitVO vo) {
		// 전체조회
		return map.selectVisit(vo);
	}

	@Override
	public int insertVisit(VisitVO vo) {
		// 등록
		return map.insertVisit(vo);
	}

	@Override
	public int deleteVisit(VisitVO vo) {
		// 삭제
		return map.deleteVisit(vo);
	}

	@Override
	public boolean isCIdCheck(String str1, String str2) {
		// contentId 중복체크
		return map.isCIdCheck(str1, str2);
	}

}
