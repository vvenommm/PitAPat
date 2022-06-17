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

@WebServlet("/Edu_Edit.do")
public class Edu_Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_detail.jsp에서 훈련사가 자기 강의에서 수정하기 버튼 누르면 여기로
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int edu_no = Integer.parseInt(request.getParameter("edu_no"));
		
		System.out.println("edu_detail.jsp에서 넘긴 edu_no 값 : " + edu_no);

		// 서비스 객체 생성
		EducationService service = EducationServiceImpl.getInstance();
		
		//결과값 받기 위한 객체 생성 후 값 받기
		EducationVO eduOne = service.getEduInfo(edu_no);
		System.out.println("edu edit.java" + eduOne);
		
		//결과값 저장한 객체 request에 저장
		request.setAttribute("eduOne", eduOne);

		// 서비스로 값 가져와서 받기
		System.out.println("edu detail.java의 service로 받아온 객체=수정할 패키지 " + eduOne);

		// view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_edit.jsp에서 강의 수정하기
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//request에서 매개변수 받기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("세션의 저장된 id : " + id);
		
		//요청 시 전송 데이터 받기
		int edu_no = Integer.parseInt(request.getParameter("edu_no"));
		String edu_title = (String)request.getParameter("edu_title");
		String edu_content = (String)request.getParameter("edu_content");
		String edu_date = (String)request.getParameter("edu_date");
		String edu_place = (String)request.getParameter("edu_place");
		String edu_time = (String)request.getParameter("edu_time");
		int edu_fee = Integer.parseInt(request.getParameter("edu_fee"));
		int edu_limit = Integer.parseInt(request.getParameter("edu_limit"));
		System.out.println("세션의 저장된 edu_no : " + edu_no);
		
		EducationVO vo = new EducationVO();
		vo.setEdu_no(edu_no);
		vo.setEdu_title(edu_title);
		vo.setEdu_content(edu_content);
		vo.setEdu_date(edu_date);
		vo.setEdu_place(edu_place);
		vo.setEdu_time(edu_time);
		vo.setEdu_fee(edu_fee);
		vo.setEdu_limit(edu_limit);
		vo.setEmp_id(id);
		
		System.out.println(vo);
		
		
		//service 객체 얻어오기
		EducationService service = EducationServiceImpl.getInstance();
								
		//결과값 받을 객체 생성 후 servlet 메소드 호출해서 결과값 받기
		int resultNum = service.editEdu(vo);
		System.out.println(resultNum);
							
		//결과 값 받은 객체 request에 저장
		request.setAttribute("resultNum", resultNum);
		System.out.println("ㄴset attribute?");
				
		//view페이지로 이동
		request.getRequestDispatcher("/Edu_Main.do").forward(request, response);
		System.out.println("성공?");
	}

}
