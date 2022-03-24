package com.yd05.mprj.delicious.service;

public interface DeliciousMapper {
	// 단건조회
	DeliciousVO selectDel(DeliciousVO vo);

	// db등록
	int insertDel(DeliciousVO vo);
}
