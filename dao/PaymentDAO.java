package kr.or.ddit.pitapet.payment.dao;

import java.sql.SQLException;

import kr.or.ddit.pitapet.vo.CartVO;

public interface PaymentDAO {

	//결제///////////////////////////////////////////////
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 1. 전체 결제/////////////////////////////////////////////////
	/**
	 * 현 장바구니 출력 상품(미결인 상태) 전체 구매 -> 결제 번호 추가, 결제 상태 '결제'로 업데이트
	 * @param cartVO 구매할 장바구니 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int payAll(CartVO cartVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////

	
	// 2. 선택 결제/////////////////////////////////////////////////
	/**
	 * 현 장바구니 출력 상품(미결인 상태) 일부 구매 -> 결제 번호 추가, 결제 상태 '결제'로 업데이트, 기존 상품 select -> 새 장바구니에 insert, 기존꺼는 delete
	 * @param cartVO
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int payPart(CartVO cartVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
}
