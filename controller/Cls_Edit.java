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

@WebServlet("/Cls_Edit.do")
public class Cls_Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO cls_detail.jsp에서 훈련사가 자기 강의에서 수정하기 버튼 누르면 여기로
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String cls_subject = (String)request.getParameter("cls_subject");
		int cls_count = Integer.parseInt(request.getParameter("cls_count"));
		System.out.println("cls_detail.jsp에서 넘긴 cls_subject 값 : " + cls_subject);
		System.out.println("cls_detail.jsp에서 넘긴 cls_count 값 : " + cls_count);
		
		// 서비스 객체 생성
		ClassService service = ClassServiceImpl.getInstance();
				
		// 서비스로 값 가져와서 받기
		List<ClassVO> clsOne = service.getClsInfo(cls_subject);
		System.out.println("Cls detail.java의 service로 받아온 객체=수정할 패키지 " + clsOne);
		
		//결과값 저장한 객체 request에 저장
		request.setAttribute("clsOne", clsOne);
		request.setAttribute("cls_count", cls_count);
				
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.class/cls_edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
