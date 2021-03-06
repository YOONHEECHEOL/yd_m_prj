package com.yd05.mprj.wish.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface WishMapper {
	// 전체조회
	List<WishVO> selectWishList(WishVO vo);

	// 등록
	int insertWish(WishVO vo);

	// 삭제
	int deleteWish(WishVO vo);

	// contentId 중복체크
	boolean isCIdCheck(@Param("str1") String str1, @Param("str2") String str2);
}
