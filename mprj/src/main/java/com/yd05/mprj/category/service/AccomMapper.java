package com.yd05.mprj.category.service;

import java.util.List;

public interface AccomMapper {
	List<AccomVO> AccomList(); // 숙박시설 전체 출력
	
	AccomVO AccomRecList(int accomId); // 추천 숙박 시설 단건 출력
}
