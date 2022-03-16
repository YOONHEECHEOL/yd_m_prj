package com.yd05.mprj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class Login implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// login
		return "user/login.tiles";
	}

}
