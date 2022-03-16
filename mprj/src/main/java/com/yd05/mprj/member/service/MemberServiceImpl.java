package com.yd05.mprj.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public List<MemberVO> memberList() {
		
		return map.memberList();
	}

}
