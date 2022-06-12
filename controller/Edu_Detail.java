package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.pitapet.education.service.EducationService;
import kr.or.ddit.pitapet.education.service.EducationServiceImpl;
import kr.or.ddit.pitapet.vo.EducationVO;

@WebServlet("/Edu_Detail.do")
public class Edu_Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_main.jsp에서 강의 목록 중 하나 누르면 상세 글로 가도록
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//edu_main.jsp에서 클릭한 교육글번호 값 변수에 담기
		int edu_no = Integer.parseInt(request.getParameter("edu_no"));
		System.out.println(edu_no);
		
		//서비스 객체 생성 ---- 여기서 문제..ㅠㅠㅠ
		EducationService service = EducationServiceImpl.getInstance();
		
		//결과값 받기 위한 객체 생성 후 값 받기
		EducationVO eduOne = service.getEduInfo(edu_no);
		System.out.println("edu detail.java" + eduOne);
		
		//결과값 저장한 객체 request에 저장
		request.setAttribute("eduOne", eduOne);
		
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_detail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
