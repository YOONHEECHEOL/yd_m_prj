package com.yd05.mprj.wish.service;

import java.util.List;

public interface WishService {
	// 전체조회
	List<WishVO> selectWishList(WishVO vo);
	
	// 등록
	int insertWish(WishVO vo);
	
	// 삭제
	int deleteWish(WishVO vo);
	
	// contentId 중복체크
	boolean isCIdCheck(String str1, String str2);
}
