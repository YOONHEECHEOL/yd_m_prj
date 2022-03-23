package com.yd05.mprj.user.service;

public interface UserService {
	// 선택
	UserVO userSelect(UserVO vo);
	// 수정
	void userUpdate(UserVO vo);
	// 등록
	void userInsert(UserVO vo);
	// idCheck
	String idCheck(String CheckStr);
}
