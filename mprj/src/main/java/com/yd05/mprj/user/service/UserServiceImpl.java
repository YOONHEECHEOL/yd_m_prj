package com.yd05.mprj.user.service;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class UserServiceImpl implements UserService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private UserMapper map = sqlSession.getMapper(UserMapper.class);
	
	@Override
	public UserVO userSelect(UserVO vo) {
		// 유저 선택
		return map.userSelect(vo);
	}

	@Override
	public void userUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		map.userUpdate(vo);
	}

	@Override
	public void userInsert(UserVO vo) {
		// TODO Auto-generated method stub
		map.userInsert(vo);
	}

	@Override
	public String idCheck(String CheckStr) {
		// TODO Auto-generated method stub
		return map.idCheck(CheckStr);
	}

	

}
