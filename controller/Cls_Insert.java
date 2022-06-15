package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.pitapet.education.service.ClassService;
import kr.or.ddit.pitapet.education.service.ClassServiceImpl;
import kr.or.ddit.pitapet.education.service.EducationService;
import kr.or.ddit.pitapet.education.service.EducationServiceImpl;
import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.EducationVO;
import kr.or.ddit.pitapet.vo.MemberVO;

@WebServlet("/Cls_Insert.do")
public class Cls_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO cls_main.jsp에서 강의 등록 누르면 cls_insert.jsp로 이동시키는 메소드

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// cls_insert.jsp로 이동
		request.getRequestDispatcher("WEB-INF/view.class/cls_insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO cls_insert.jsp에서 강의 등록하기

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//JSON 데이터로 응답 시 Content-Type 설정 방법
		response.setContentType("application/json; charset=utf-8");
		
		// request에서 매개변수 받기
//		HttpSession session = request.getSession();
//		MemberVO id = (MemberVO) session.getAttribute("loginMember");
		MemberVO id = new MemberVO();
		id.setMem_id("20007TR");
//		System.out.println("저장된 MemberVO id : " + id.getMem_id());

		// service 객체 얻어오기
		ClassService service = ClassServiceImpl.getInstance();

		//JSP에서 보낸 ajax의 data 가져오기
		String[] arr = request.getParameterValues("arr[]");
		
		int cls_no = service.getClsNo(); //클래스 고유코드+1

		Gson gson = new Gson();
		int resultNum = 0;
//		List<ClassVO> clsList = new ArrayList<ClassVO>();
		for(String data : arr) {

			ClassVO vo =  gson.fromJson(data, ClassVO.class);
			vo.setCls_no(cls_no);
			vo.setEmp_id(id.getMem_id());
			
			resultNum += service.insertCls(vo);
//			clsList.add(vo);
			cls_no++;
		}

		if(resultNum  == arr.length) {
			System.out.println("성공");
		}
		
		// 결과 값 받은 객체 request에 저장
		request.setAttribute("resultNum", resultNum);
		System.out.println("ㄴset attribute?");

		// view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.class/resultNum.jsp").forward(request, response);
		
		
		System.out.println("성공?");

	}

}
