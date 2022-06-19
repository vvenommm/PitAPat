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
import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.EducationVO;

@WebServlet("/Edu_Delete.do")
public class Edu_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO edu_detail.jsp에서 삭제하기 누르면 삭제로 상태 update하기
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int edu_no = Integer.parseInt(request.getParameter("edu_no"));
		String edu_status = "삭제";
		
		EducationVO vo = new EducationVO();
		vo.setEdu_no(edu_no);
		vo.setEdu_status(edu_status);
		
		//서비스 객체 생성 후 db 갔다오기
		EducationService service = EducationServiceImpl.getInstance();
		int resultNum = service.appInsEdu(vo);
		
		//결과에 따라 다르게 이동시키기
		if(resultNum > 0) {
			
			//view페이지로 이동
			request.getRequestDispatcher("/Edu_Main.do").forward(request, response);
		}else {
			//해당 글 상세 조회로 다시 이동
			
			//글 번호 전달하기
			request.setAttribute("edu_no", edu_no);
			
			//view페이지로 이동
			request.getRequestDispatcher("/Edu_Detail.do").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
