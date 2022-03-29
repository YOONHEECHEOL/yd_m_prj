package com.yd05.mprj.recomm.service;

public interface RecommService {
	// 추천 수 조회
	long selectRecomm(RecommVO vo);
	// 추천 관광지 입력하기
	void insertRecomm(RecommVO vo);
	// 추천 취소
	void deleteRecomm(RecommVO vo);
}
