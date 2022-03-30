package com.yd05.mprj.mcComment.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;

public class McCommentServiceImpl implements McCommentService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private McCommentMapper map = sqlSession.getMapper(McCommentMapper.class);
	
	@Override
	public List<McCommentVO> selectComments(McCommentVO vo) {
		// 게시글 댓글 찾기
		return map.selectComments(vo);
	}

	@Override
	public void insertComments(McCommentVO vo) {
		// 댓글 입력
		map.insertComments(vo);
	}
	@Override
	public void deleteComments(McCommentVO vo) {
		// 댓글 삭제
		map.deleteComments(vo);
	}

}
