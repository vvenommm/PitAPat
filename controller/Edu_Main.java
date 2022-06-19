package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pitapet.education.service.EducationService;
import kr.or.ddit.pitapet.education.service.EducationServiceImpl;
import kr.or.ddit.pitapet.vo.EducationVO;
import kr.or.ddit.pitapet.vo.MemberVO;

@WebServlet("/Edu_Main.do")
public class Edu_Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 메인에서 유치원 클릭하면 나오는 edu_main.jsp로 이동하기
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//service 객체 얻어오기
		EducationService service = EducationServiceImpl.getInstance();
		
		//결과값 받을 객체 생성 후 servlet 메소드 호출해서 결과값 받기
		List<EducationVO> eduList = service.getAllEdu();
		System.out.println("edu main. java");
		
		//결과 값 받은 객체 request에 저장
		request.setAttribute("eduList", eduList);
		
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
