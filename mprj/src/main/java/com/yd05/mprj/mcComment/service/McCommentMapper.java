package com.yd05.mprj.mcComment.service;

import java.util.List;

public interface McCommentMapper {
	// 게시글의 댓글 찾기
	List<McCommentVO> selectComments();
	
	// 삭제
	void deleteComments(McCommentVO vo);
}
