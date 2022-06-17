package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.pitapet.education.service.EducationService;
import kr.or.ddit.pitapet.education.service.EducationServiceImpl;
import kr.or.ddit.pitapet.vo.EducationVO;

import com.google.gson.Gson;

@WebServlet("/Edu_myEdu.do")
public class Edu_myEdu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_main.jsp에서 훈련사가 자기 강의만 보기 클릭 시
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		//값 받기
		String emp_id = request.getParameter("mem_id");
		
		//Gson 객체 생성
//		Gson gson = new Gson();
		
		// 서비스 객체 생성
		EducationService service = EducationServiceImpl.getInstance();

		// 서비스로 값 가져와서 받기
		List<EducationVO> myEduList = service.getMyEdu(emp_id);
		
		System.out.println(myEduList); //삭제하기
		
		//응답용 데이터를 JSON 문자열로 변환 & JSON 문자열이 저장될 변수 선언
//		String jsonData = gson.toJson(myEduList);
		
		
		System.out.println(myEduList); //삭제하기

		// 값 저장하기
		request.setAttribute("myEduList", myEduList);
		
		//변환된 JSON 문자열을 응답 데이터로 전송
//		PrintWriter out = response.getWriter();
//		out.write(jsonData);
//		response.flushBuffer();
		
		// view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_myEdu.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
