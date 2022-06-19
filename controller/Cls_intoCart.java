package kr.or.ddit.pitapet.education.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pitapet.payment.service.CartService;
import kr.or.ddit.pitapet.payment.service.CartServiceImpl;

@WebServlet("/Cls_intoCart.do")
public class Cls_intoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO cls_detail.jsp에서 장바구니 넣기 하면 여기로
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		//값 받기
		String cls_subject = request.getParameter("cls_subject");
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("id");

		Map<String, String> map = new HashMap<String, String>();
		map.put("cls_subject", cls_subject);
		map.put("mem_id", mem_id);
		
		// 서비스 객체 생성
		CartService service = CartServiceImpl.getInstance();
		
		//db 값 받아오기
		int resultNum = service.clsFinCart(map);
		
		// 값 저장하기
		request.setAttribute("resultNum", resultNum);
		
		// view페이지로 이동
		request.getRequestDispatcher("WEB-INF/view.class/resultNum.jsp").forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
