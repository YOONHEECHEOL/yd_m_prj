package com.yd05.mprj.delicious.service;

public interface DeliciousMapper {
	// 단건조회
	DeliciousVO selectDeli(DeliciousVO vo);

	// db등록
	int insertDeli(DeliciousVO vo);

	// contentid 중복체크
	boolean isConidCheck(String str);
}
