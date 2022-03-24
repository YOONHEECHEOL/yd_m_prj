package com.yd05.mprj.delicious.service;

public interface DeliciousService {
	// 단건조회
	DeliciousVO selectDel(DeliciousVO vo);
	
	// db등록
	int insertDel (DeliciousVO vo);
}
