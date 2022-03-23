package com.yd05.mprj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.user.service.UserService;
import com.yd05.mprj.user.service.UserServiceImpl;
import com.yd05.mprj.user.service.UserVO;

public class AjaxloginCheck implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 중복 체크
		UserService dao = new UserServiceImpl();
		String idCheckValue = request.getParameter("rId");
		
		String resultValue = dao.idCheck(idCheckValue);
		// 0 -> false, 1 -> true
		if(!resultValue.equals("0")) {
			return "ajax:" + "true";
		}
		return "ajax:" + "false";
	}

}
