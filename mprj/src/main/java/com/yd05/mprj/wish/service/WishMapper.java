package com.yd05.mprj.wish.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface WishMapper {
	// 전체조회
	List<WishVO> selectWishList(WishVO vo);

	// 단건조회
	WishVO selectWish(WishVO vo);

	// 등록
	int insertWish(WishVO vo);

	// 삭제
	int deleteWish(WishVO vo);

	// 검색
	List<WishVO> searchWishList(String key); // 검색할 항목 -> key -> ajax

	// contentId 중복체크
	boolean isCIdCheck(@Param("str") String str, @Param("str2") String str2);
}
