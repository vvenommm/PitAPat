package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		doGet(request, response);
	}

}
