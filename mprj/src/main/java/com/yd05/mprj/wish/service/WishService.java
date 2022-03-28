package com.yd05.mprj.wish.service;

import java.util.List;

public interface WishService {
	// 전체조회
	List<WishVO> selectWishList();
	
	// 단건조회
	WishVO selectWish(WishVO vo);
	
	// 등록
	int insertWish(WishVO vo);
	
	// 수정
	int updateWish(WishVO vo);
	
	// 삭제
	int deleteWish(WishVO vo);
	
	// 검색
	List<WishVO> searchWishList(String key); // 검색할 항목 -> key -> ajax
}
