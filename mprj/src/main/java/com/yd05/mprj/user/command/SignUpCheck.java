package com.yd05.mprj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.user.service.UserService;
import com.yd05.mprj.user.service.UserServiceImpl;
import com.yd05.mprj.user.service.UserVO;

public class SignUpCheck implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 수행
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		
		String idValue = request.getParameter("uId") + "@" + request.getParameter("mailVal");
		
		vo.setuId(idValue);
		vo.setuPwd(request.getParameter("uPwd"));
		vo.setuName(request.getParameter("uName"));
		vo.setuAuthor("USER");
		
		dao.userInsert(vo);
		
		request.setAttribute("message", vo.getuName() + " 님 회원가입이 완료되었습니다.");
		
		return "user/message.tiles";
	}

}
