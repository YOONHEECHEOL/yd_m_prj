package com.yd05.mprj.wish.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class WishServiceImpl implements WishService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private WishMapper map = sqlSession.getMapper(WishMapper.class);	

	@Override
	public List<WishVO> selectWishList(WishVO vo) {
		// 전체조회
		return map.selectWishList(vo);
	}

	@Override
	public int insertWish(WishVO vo) {
		// db 저장
		return map.insertWish(vo);
	}

	@Override
	public int deleteWish(WishVO vo) {
		// 삭제
		return map.deleteWish(vo);
	}

	@Override
	public boolean isCIdCheck(String str1, String str2) {
		// contentId 중복체크
		return map.isCIdCheck(str1, str2);
	}

}
