package com.yd05.mprj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class Mypage implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 마이페이지 이동
		return "user/mypage.tiles";
	}

}
