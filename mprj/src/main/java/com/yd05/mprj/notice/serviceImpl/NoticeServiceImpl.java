package com.yd05.mprj.notice.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;
import com.yd05.mprj.notice.service.NoticeMapper;
import com.yd05.mprj.notice.service.NoticeService;
import com.yd05.mprj.notice.service.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private NoticeMapper map = sqlSession.getMapper(NoticeMapper.class);

	@Override
	public List<NoticeVO> noticeSelectList() {
		// TODO Auto-generated method stub
		return map.noticeSelectList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeDelete(vo);
	}

	@Override
	public int noticeUpdateHit(int id) {
		// TODO Auto-generated method stub
		return map.noticeUpdateHit(id);
	}

	@Override
	public List<NoticeVO> noticeSelectSearchList(String key, String val) {
		// TODO Auto-generated method stub
		return map.noticeSelectSearchList(key, val);
	}

	@Override
	public List<NoticeVO> noticeSortList(String key) {
		// TODO Auto-generated method stub
		return map.noticeSortList(key);
	}

}
