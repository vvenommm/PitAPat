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

@WebServlet("/Cls_Detail.do")
public class Cls_Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO cls_main.jsp에서 강의 목록 중 하나 누르면 상세 글로 가도록
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//edu_main.jsp에서 클릭한 교육글번호 값 변수에 담기
		String cls_subject = (String)request.getParameter("cls_subject");
		int cls_count = Integer.parseInt(request.getParameter("cls_count"));
		System.out.println("Cls_Detail.java의 cls_subject : " + cls_subject);
		System.out.println("Cls_Detail.java의 cls_count : " + cls_count);
		
		//서비스 객체 생성
		ClassService service = ClassServiceImpl.getInstance();
		
		//결과값 받기 위한 객체 생성 후 값 받기
		List<ClassVO> clsOne = service.getClsInfo(cls_subject);
		System.out.println("Cls detail.java의 service로 받아온 객체 " + clsOne);
		
		//결과값 저장한 객체 request에 저장
		request.setAttribute("clsOne", clsOne);
		request.setAttribute("cls_count", cls_count);
		
		String id = "20007TR";
		request.setAttribute("id", id);
		
		//view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.class/cls_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
