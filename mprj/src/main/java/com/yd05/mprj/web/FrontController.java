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
import com.yd05.mprj.delicious.command.DeliciousSelect;
import com.yd05.mprj.indel.command.inDel;
import com.yd05.mprj.mcComment.command.AjaxAddComment;
import com.yd05.mprj.member.command.MemberList;
import com.yd05.mprj.myCourse.command.AddMyCourse;
import com.yd05.mprj.myCourse.command.CourseList;
import com.yd05.mprj.myCourse.command.DeleteCourse;
import com.yd05.mprj.myCourse.command.InsertCourse;
import com.yd05.mprj.myCourse.command.MyCourseList;
import com.yd05.mprj.myCourse.command.ViewCourse;
import com.yd05.mprj.notice.command.AjaxNoticeSearch;
import com.yd05.mprj.notice.command.AjaxSortNotice;
import com.yd05.mprj.notice.command.NoticeDelete;
import com.yd05.mprj.notice.command.NoticeInsert;
import com.yd05.mprj.notice.command.NoticeInsertForm;
import com.yd05.mprj.notice.command.NoticeList;
import com.yd05.mprj.notice.command.NoticeUpdate;
import com.yd05.mprj.notice.command.NoticeUpdateConfirm;
import com.yd05.mprj.notice.command.NoticeView;
import com.yd05.mprj.spot.command.AjaxSpotAddWish;
import com.yd05.mprj.spot.command.CateSpotList;
import com.yd05.mprj.spot.command.ChoiceSpotView;
import com.yd05.mprj.spot.command.KeySearch;
import com.yd05.mprj.spot.command.NextRecSpot;
import com.yd05.mprj.spot.command.RecSpot;
import com.yd05.mprj.spot.command.SpotList;
import com.yd05.mprj.spot.command.viewSpot;
import com.yd05.mprj.type.command.AjaxContentTypeList;
import com.yd05.mprj.user.command.AjaxloginCheck;
import com.yd05.mprj.user.command.Login;
import com.yd05.mprj.user.command.LoginCheck;
import com.yd05.mprj.user.command.Logout;
import com.yd05.mprj.user.command.Mypage;
import com.yd05.mprj.user.command.SignUp;
import com.yd05.mprj.user.command.SignUpCheck;
import com.yd05.mprj.visit.command.VisitDelete;
import com.yd05.mprj.visit.command.VisitInsert;
import com.yd05.mprj.visit.command.VisitList;
import com.yd05.mprj.weather.command.WeatherDetail;
import com.yd05.mprj.weather.command.WeatherSearch;
import com.yd05.mprj.weather.command.WeatherSpot;
import com.yd05.mprj.wish.command.WishDelete;
import com.yd05.mprj.wish.command.WishInsert;
import com.yd05.mprj.wish.command.WishList;

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
		// FrontController ??? ?????? ??? ?????? ?????? ????????? ???????????????.
		
		// ======================yoon=======================
		map.put("/home.do", new HomeCommand());
		
		// member (test ???)
		map.put("/memberList.do", new MemberList());
		
		// user
		map.put("/login.do", new Login()); // ?????????
		map.put("/loginCheck.do", new LoginCheck()); // ????????? ??????		
		map.put("/signUp.do", new SignUp()); // ????????????
		map.put("/signUpCheck.do", new SignUpCheck()); // ???????????? ?????? ??? dao ??????		
		map.put("/logout.do", new Logout()); // ????????????
		map.put("/mypage.do", new Mypage()); // ???????????????
		map.put("/ajaxloginCheck.do", new AjaxloginCheck()); // ????????? ????????????
		// contentTypeId ??? ????????????
		map.put("/ajaxContentTypeList.do", new AjaxContentTypeList()); // contentTypeId, cat1 ,cat2, cat3 ??????
		// myCourse
		map.put("/addMyCourse.do", new AddMyCourse()); // ?????? ???????????? ???????????????
		map.put("/myCourseList.do", new MyCourseList());
		map.put("/courseList.do", new CourseList());
		map.put("/spotList.do", new SpotList());
		map.put("/insertCourse.do", new InsertCourse());		
		map.put("/viewCourse.do", new ViewCourse());		
		// spot
		map.put("/viewSpot.do", new viewSpot());		
		map.put("/ajaxSpotAddWish.do", new AjaxSpotAddWish());		
		map.put("/deleteCourse.do", new DeleteCourse());
		// comment
		map.put("/ajaxAddComment.do", new AjaxAddComment());
		// keySearch page
		map.put("/keySearch.do", new KeySearch());
		
		
		// ======================woong=======================
		// ????????? ??????
		map.put("/cateSpotList.do", new CateSpotList());
		map.put("/recSpot.do", new RecSpot());// ????????? ?????? ?????? ????????? ??????+?????? ????????? ??????????????? ???????????? ?????????
		map.put("/nextRecSpot.do", new NextRecSpot()); // ???????????????(??????????????? ????????? ???????????? ????????????)
		map.put("/choiceSpotView.do", new ChoiceSpotView()); // ????????? ????????? ????????? ??????????????? ??????
		
		// ======================been=======================
		// ????????? ??????
		// ??????
		map.put("/deliciousList.do", new DeliciousList()); //?????? ??????
		map.put("/deliciousSelect.do", new DeliciousSelect()); //????????? ?????? 
		// wish
		map.put("/wishInsert.do", new WishInsert()); //db insert
		map.put("/wishList.do", new WishList()); // wish??????
		map.put("/wishDelete.do", new WishDelete()); // wish ??????
		// visited
		map.put("/visitInsert.do", new VisitInsert()); //db insert
		map.put("/visitList.do", new VisitList()); // visit ??????
		map.put("/visitDelete.do", new VisitDelete()); // visit ??????
		// indel
		map.put("/inDel.do", new inDel()); // wish ?????? ??? visit ?????? 
		
		
		// ======================domin=======================
		// ????????? ??????
		map.put("/noticeList.do", new NoticeList());
		map.put("/noticeInsertForm.do", new NoticeInsertForm());
		map.put("/noticeInsert.do", new NoticeInsert());
		map.put("/noticeView.do", new NoticeView());
	    map.put("/ajaxNoticeSearch.do", new AjaxNoticeSearch());
	    map.put("/ajaxSortNotice.do", new AjaxSortNotice());
	    map.put("/noticeUpdate.do", new NoticeUpdate());
	    map.put("/noticeDelete.do", new NoticeDelete());
	    map.put("/noticeUpdateConfirm.do", new NoticeUpdateConfirm());
	    
	    
	    map.put("/weatherSpot.do", new WeatherSpot());
	    map.put("/weatherDetail.do", new WeatherDetail());
	    map.put("/weatherSearch.do", new WeatherSearch());
	    

	    
	    

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
