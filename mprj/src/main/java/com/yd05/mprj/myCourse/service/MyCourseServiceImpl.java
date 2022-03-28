package com.yd05.mprj.myCourse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class MyCourseServiceImpl implements MyCourseService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MyCourseMapper map = sqlSession.getMapper(MyCourseMapper.class);
	
	@Override
	public List<MyCourseVO> selectAllCourse(MyCourseVO vo) {
		// 전체선택
		return map.selectAllCourse(vo);
	}

	@Override
	public MyCourseVO selectCourse(MyCourseVO vo) {
		// 단건조회
		return map.selectCourse(vo);
	}

	@Override
	public void updateCourse(MyCourseVO vo) {
		// 수정
		map.updateCourse(vo);
	}

	@Override
	public void deleteCourse(MyCourseVO vo) {
		// 삭제
		map.deleteCourse(vo);
	}

	@Override
	public void insertCourse(MyCourseVO vo) {
		// 등록
		map.insertCourse(vo);
	}

}
