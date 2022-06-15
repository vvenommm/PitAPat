package kr.or.ddit.pitapet.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pitapet.payment.service.CartService;
import kr.or.ddit.pitapet.payment.service.CartServiceImpl;
import kr.or.ddit.pitapet.vo.MemberVO;

/**
 * Servlet implementation class Cart_Main
 */
@WebServlet("/Cart_Main.do")
public class Cart_Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO hom_main.jsp에서 장바구니 누르면 이 서블릿을 통해 cart_main.jsp로 이동
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				
				HttpSession session = request.getSession();
//				MemberVO memVO = (MemberVO) session.getAttribute("loginMember");
				MemberVO memVO = new MemberVO();
				memVO.setMem_id("20006TR");
				session.setAttribute("loginMember", memVO);
				
				// service 객체 얻어오기
				CartService service = CartServiceImpl.getInstance();
				
				// 결과값 받을 객체 생성 후 servlet 메소드 호출해서 결과값 받기
				
				
				
				
				
				
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
