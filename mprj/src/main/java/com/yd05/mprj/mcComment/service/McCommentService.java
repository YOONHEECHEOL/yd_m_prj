package com.yd05.mprj.mcComment.service;

import java.util.List;

public interface McCommentService {
	// 게시글의 댓글 찾기
	List<McCommentVO> selectComments(McCommentVO vo);
	
	// 게시글 입력
	void insertComments(McCommentVO vo);
	
	// 삭제
	void deleteComments(McCommentVO vo);
	
}
