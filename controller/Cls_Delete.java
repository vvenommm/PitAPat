package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.pitapet.education.service.ClassService;
import kr.or.ddit.pitapet.education.service.ClassServiceImpl;
import kr.or.ddit.pitapet.vo.ClassVO;

@WebServlet("/Cls_Delete.do")
public class Cls_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 강의 상세 조회인 Cls_detail.jsp에서 강의 삭제를 눌러 confirm-확인을 누르면 여기로 이동
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cls_subject = request.getParameter("cls_subject");
		String cls_count = request.getParameter("cls_count");
		ClassVO vo = new ClassVO();
		vo.setCls_subject(cls_subject);
		vo.setCls_status("삭제");
		System.out.println(cls_subject);
		
		//서비스 객체 생성 후 db 갔다오기
		ClassService service = ClassServiceImpl.getInstance();
		int resultNum = service.appInsCls(vo);
		
		if(resultNum > 0) {
			request.setAttribute("resultNum", resultNum);
			
			//view페이지로 이동
			request.getRequestDispatcher("/Cls_Main.do").forward(request, response);
		}else {
			List<ClassVO> clsOne = service.getClsInfo(cls_subject);
			request.setAttribute("clsOne", clsOne);
			request.setAttribute("cls_count", cls_count);
			
			//view페이지로 이동
			request.getRequestDispatcher("WEB-INF/view.class/cls_detail.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
