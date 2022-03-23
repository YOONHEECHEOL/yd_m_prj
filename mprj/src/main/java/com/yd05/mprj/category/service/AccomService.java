package com.yd05.mprj.category.service;

import java.util.List;

public interface AccomService {
	List<AccomVO> AccomList(); // 숙박전체 리스트를 반환하는 메소드
	AccomVO AccomRecList(int accomId) ; // 숙박업소중 추천 리스트를 반환하는 메소드
	
}
