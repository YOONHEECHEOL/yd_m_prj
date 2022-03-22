package com.yd05.mprj.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.command.HomeCommand;
import com.yd05.mprj.delicious.command.DeliciousList;
import com.yd05.mprj.member.command.MemberList;
import com.yd05.mprj.myCourse.command.MyCourseList;
import com.yd05.mprj.notice.command.AjaxNoticeSearch;
import com.yd05.mprj.notice.command.AjaxSortNotice;
import com.yd05.mprj.notice.command.NoticeInsert;
import com.yd05.mprj.notice.command.NoticeInsertForm;
import com.yd05.mprj.notice.command.NoticeList;
import com.yd05.mprj.notice.command.NoticeView;
import com.yd05.mprj.spot.command.CateSpotList;
import com.yd05.mprj.spot.command.RecSpot;
import com.yd05.mprj.spot.command.SpotList;
import com.yd05.mprj.user.command.Login;
import com.yd05.mprj.user.command.SignUp;
import com.yd05.mprj.user.command.VisitedList;

// @WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
	
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// FrontController 에 추가 시 자기 이름 아래에 작성하세요.
		
		// ======================yoon=======================
		map.put("/home.do", new HomeCommand());
		
		// member (test 용)
		map.put("/memberList.do", new MemberList());
		
		// user
		map.put("/login.do", new Login()); // 로그인
		map.put("/signUp.do", new SignUp()); // 회원가입
		
		map.put("/myCourseList.do", new MyCourseList());
		map.put("/spotList.do", new SpotList());
		
		
		// ======================woong=======================
		// 이곳에 작성
		map.put("/cateSpotList.do", new CateSpotList());
		map.put("/recSpot.do", new RecSpot());
		
		// ======================been=======================
		// 이곳에 작성
		map.put("/visitedList.do", new VisitedList());
		map.put("/deliciousList.do", new DeliciousList());
		
		
		// ======================domin=======================
		// 이곳에 작성
		map.put("/noticeList.do", new NoticeList());
		map.put("/noticeInsertForm.do", new NoticeInsertForm());
		map.put("/noticeInsert.do", new NoticeInsert());
		map.put("/noticeView.do", new NoticeView());
	    map.put("ajaxNoticeSearch.do", new AjaxNoticeSearch());
	    map.put("/ajaxSortNotice.do", new AjaxSortNotice());

		// yes
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// super.service(request, response);
		
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());
		
		Command comm = map.get(page);
		String viewPage = comm.excute(request, response);			
		
		if(viewPage != null) {
			if(viewPage.startsWith("ajax:")) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			}
			if(viewPage.endsWith(".jsp")) {
				viewPage = "WEB-INF/views/" + viewPage;
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}


}
