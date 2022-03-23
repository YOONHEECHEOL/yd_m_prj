package com.yd05.mprj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;

public class Logout implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 로그아웃 처리
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		// 세션의 검증을 위한 작업 request.isRequestedSessionIdValid() => 유효하면 t 아니면 f
		if (session == null || !request.isRequestedSessionIdValid()) {
		    System.out.println("세션이 무효화 상태입니다.");
		}else {
			System.out.println("세션이 유효 합니다.");
		}
		
		return "main/main.tiles";
	}

}
