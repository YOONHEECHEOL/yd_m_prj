package com.yd05.mprj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.member.service.MemberService;
import com.yd05.mprj.member.service.MemberServiceImpl;

public class MemberList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		MemberService dao = new MemberServiceImpl();
		
		request.setAttribute("memberList", dao.memberList());
		
		return "member/memberList.tiles";
	}

}
