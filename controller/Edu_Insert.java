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

@WebServlet("/Edu_Insert.do")
public class Edu_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_main.jsp에서 강의 등록 누르면 edu_insert.jsp로 이동시키는 메소드
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//edu_insert.jsp로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_insert.jsp에서 강의 등록하기
		
		//요청 시 전송 데이터 받기
		String edu_title = (String)request.getParameter("edu_title");
		String edu_content = (String)request.getParameter("edu_content");
		String edu_date = (String)request.getParameter("edu_date");
		String edu_place = (String)request.getParameter("edu_place");
		String edu_time = (String)request.getParameter("edu_time");
		int edu_fee = Integer.parseInt(request.getParameter("edu_fee"));
		int edu_limit = Integer.parseInt(request.getParameter("edu_limit"));
		
		EducationVO vo = new EducationVO();
		vo.setEdu_title(edu_title);
		vo.setEdu_content(edu_content);
		vo.setEdu_date(edu_date);
		vo.setEdu_place(edu_place);
		vo.setEdu_time(edu_time);
		vo.setEdu_fee(edu_fee);
		vo.setEdu_limit(edu_limit);
		
		//service 객체 얻어오기
		EducationService service = EducationServiceImpl.getInstance();
								
		//결과값 받을 객체 생성 후 servlet 메소드 호출해서 결과값 받기
		int resultNum = service.insertEdu(vo);
							
		//결과 값 받은 객체 request에 저장
		request.setAttribute("resultNum", resultNum);
				
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_main.jsp").forward(request, response);
	}

}
