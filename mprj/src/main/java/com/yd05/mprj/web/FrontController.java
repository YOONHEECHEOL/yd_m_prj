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
import com.yd05.mprj.member.command.MemberList;
import com.yd05.mprj.myCourse.command.AddMyCourse;
import com.yd05.mprj.myCourse.command.CourseList;
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
import com.yd05.mprj.weather.command.WeatherData;
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
		// FrontController 에 추가 시 자기 이름 아래에 작성하세요.
		
		// ======================yoon=======================
		map.put("/home.do", new HomeCommand());
		
		// member (test 용)
		map.put("/memberList.do", new MemberList());
		
		// user
		map.put("/login.do", new Login()); // 로그인
		map.put("/loginCheck.do", new LoginCheck()); // 로그인 검증		
		map.put("/signUp.do", new SignUp()); // 회원가입
		map.put("/signUpCheck.do", new SignUpCheck()); // 회원가입 체크 및 dao 수행		
		map.put("/logout.do", new Logout()); // 로그아웃
		map.put("/mypage.do", new Mypage()); // 마이페이지
		map.put("/ajaxloginCheck.do", new AjaxloginCheck()); // 아이디 중복체크
		// contentTypeId 값 불러오기
		map.put("/ajaxContentTypeList.do", new AjaxContentTypeList()); // contentTypeId, cat1 ,cat2, cat3 반환
		// myCourse
		map.put("/addMyCourse.do", new AddMyCourse()); // 나의 관광코스 추가페이지
		map.put("/myCourseList.do", new MyCourseList());
		map.put("/courseList.do", new CourseList());
		map.put("/spotList.do", new SpotList());
		map.put("/insertCourse.do", new InsertCourse());		
		map.put("/viewCourse.do", new ViewCourse());		
		// spot
		map.put("/viewSpot.do", new viewSpot());		
		map.put("/ajaxSpotAddWish.do", new AjaxSpotAddWish());		
		
		
		// ======================woong=======================
		// 이곳에 작성
		map.put("/cateSpotList.do", new CateSpotList());
		map.put("/recSpot.do", new RecSpot());// 오늘의 추천 숙박 리스트 출력+지역 디테일 뷰페이지를 보여주는 버튼부
		map.put("/nextRecSpot.do", new NextRecSpot()); // 추천숙박소(지역버튼을 클릭시 보여주는 뷰페이지)
		map.put("/choiceSpotView.do", new ChoiceSpotView()); // 숙박소 클릭시 상세한 뷰페이지로 이동
		
		// ======================been=======================
		// 이곳에 작성
		// 맛집
		map.put("/deliciousList.do", new DeliciousList()); //맛집 검색
		map.put("/deliciousSelect.do", new DeliciousSelect()); //개별건 화면 
		// wish
		map.put("/wishInsert.do", new WishInsert()); //db insert
		map.put("/wishList.do", new WishList()); // wish목록
		map.put("/wishDelete.do", new WishDelete()); // wish 삭제
		// visited
		map.put("/visitInsert.do", new VisitInsert()); //db insert
		map.put("/visitList.do", new VisitList()); // visit 목록
		map.put("/visitDelete.do", new VisitDelete()); // visit 삭제
		
		// ======================domin=======================
		// 이곳에 작성
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
	    map.put("/weatherData.do", new WeatherData());
	    

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
