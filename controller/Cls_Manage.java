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
import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.MemberVO;

@WebServlet("/Cls_Manage.do")
public class Cls_Manage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO cls_main.jsp에서 강의 관리 누르면 cls_manage.jsp로 이동시키기
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("loginMember");

		// service 객체 얻어오기
		ClassService service = ClassServiceImpl.getInstance();

		// 결과값 받을 객체 생성 후 servlet 메소드 호출해서 결과값 받기
//		List<ClassVO> packList = service.getAllPack();
//		List<ClassVO> countList = service.getClsCount();
		
		System.out.println("cls_main.java");
		System.out.println("cls_main.java에서 뭐 출력할지 결정하기");
		
		//결과 값 받은 객체 request에 저장
//		request.setAttribute("packList", packList);
//		request.setAttribute("countList", countList);
//		System.out.println("총 강의 : " + countList);
		
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.class/cls_manage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
