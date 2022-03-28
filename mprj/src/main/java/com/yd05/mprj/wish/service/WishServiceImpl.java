package com.yd05.mprj.wish.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class WishServiceImpl implements WishService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private WishMapper map = sqlSession.getMapper(WishMapper.class);	

	@Override
	public List<WishVO> selectWishList() {
		// 전체조회
		return map.selectWishList();
	}

	@Override
	public WishVO selectWish(WishVO vo) {
		// 단건조회
		return map.selectWish(vo);
	}

	@Override
	public int insertWish(WishVO vo) {
		// db 저장
		return map.insertWish(vo);
	}

	@Override
	public int updateWish(WishVO vo) {
		// 수정
		return map.updateWish(vo);
	}

	@Override
	public int deleteWish(WishVO vo) {
		// 삭제
		return map.deleteWish(vo);
	}

	@Override
	public List<WishVO> searchWishList(String key) {
		// 검색
		return map.searchWishList(key);
	}

	@Override
	public boolean isCIdCheck(String str) {
		// contentId 중복체크
		return map.isCIdCheck(str);
	}

}
