package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.pitapet.education.service.EducationService;
import kr.or.ddit.pitapet.education.service.EducationServiceImpl;
import kr.or.ddit.pitapet.vo.EducationVO;

@WebServlet("/Edu_Manage.do")
public class Edu_Manage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_main.jsp에서 강의 관리 버튼 누르면 관리 페이지로 이동
		
		//서비스 객체 생성
		EducationService service = EducationServiceImpl.getInstance();
		
		//서비스로 값 가져와서 받기
		List<EducationVO> eduList = service.getAllEdu();
		
		//값 저장하기
		request.setAttribute("eduList", eduList);
		
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_manage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
