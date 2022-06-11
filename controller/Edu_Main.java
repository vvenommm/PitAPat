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

@WebServlet("/Edu_Main.do")
public class Edu_Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 메인에서 유치원 클릭하면 나오는 메인 jsp로 이동하기
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//로그인 정보 가져오기
//		String mem_id = request.getParameter("id");
//		String mem_pass = request.getParameter("pass");
//		
//		MemberVO loginVO = new MemberVO();
//		loginVO.setMem_id(mem_id);
//		loginVO.setMem_pass(mem_pass);
		
		//요청 시 전송 데이터 받기 - (ajax로 넘겨받기)
				
		//service 객체 얻어오기
		EducationService service = EducationServiceImpl.getInstance();
		
		//결과값 받을 객체 생성 후 servlet 메소드 호출해서 결과값 받기
		List<EducationVO> eduList = service.getAllEdu();
				
		//결과 값 받은 객체 request에 저장
//		request.setAttribute("eduList", eduList);
		
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.education/edu_main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
