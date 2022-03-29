package com.yd05.mprj.visit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface VisitMapper {
	// 전체조회
	List<VisitVO> selectVisit(VisitVO vo);

	// 등록
	int insertVisit(VisitVO vo);

	// 삭제
	int deleteVisit(VisitVO vo);

	// contentId 중복체크
	boolean isCIdCheck(@Param("str1") String str1, @Param("str2") String str2);
	
}
