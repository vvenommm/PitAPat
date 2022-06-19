package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pitapet.education.service.ClassService;
import kr.or.ddit.pitapet.education.service.ClassServiceImpl;
import kr.or.ddit.pitapet.education.service.EducationService;
import kr.or.ddit.pitapet.education.service.EducationServiceImpl;
import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.EducationVO;
import kr.or.ddit.pitapet.vo.MemberVO;

@WebServlet("/Cls_myCls.do")
public class Cls_myCls extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO cls_main.jsp에서 훈련사가 자기 강의만 보기 클릭 시

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		// 값 받기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 서비스 객체 생성
		ClassService service = ClassServiceImpl.getInstance();

		// 서비스로 값 가져와서 받기
		List<ClassVO> myClsList = service.getMyCls(id);

		System.out.println("서비스에서 받아온 내 강의 리스트 " + myClsList); // 삭제하기

		// 값 저장하기
		request.setAttribute("myClsList", myClsList);

		// view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.class/cls_myCls.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
