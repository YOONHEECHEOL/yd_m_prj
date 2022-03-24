package com.yd05.mprj.type.service;

import java.util.List;

public interface TypeMapper {
	// contentTypeId 값 반환
	List<TypeVO> selectContentTypeId();
	// cat1 값 반환
	List<TypeVO> selectCat1(TypeVO vo);
	// cat2 값 반환
	List<TypeVO> selectCat2(TypeVO vo);
	// cat3 값 반환
	List<TypeVO> selectCat3(TypeVO vo);
}
