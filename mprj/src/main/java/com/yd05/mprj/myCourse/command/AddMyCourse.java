package com.yd05.mprj.myCourse.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class AddMyCourse implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 관광코스 추가 페이지 이동
		return "myCourse/addMyCourse.tiles";
	}

}
