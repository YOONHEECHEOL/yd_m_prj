package com.yd05.mprj.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class NoticeInsertForm implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "notice/noticeInsertForm";
	}

}
