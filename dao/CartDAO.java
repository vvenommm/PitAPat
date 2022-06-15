package kr.or.ddit.pitapet.payment.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.vo.CartVO;
import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.EducationVO;
import kr.or.ddit.pitapet.vo.KindercartenVO;
import kr.or.ddit.pitapet.vo.MemberVO;
import kr.or.ddit.pitapet.vo.PaymentVO;

public interface CartDAO {
	
	//장바구니/////////////////////////////////////////////////////////
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 1. 모든 카트 상품 가져오기
	/**
	 * 카트에 담긴 모든 상품 가져오기
	 * @param memVO 로그인 회원
	 * @return 카트에 담긴 모든 상품을 담은 List<CartVO> 객체
	 * @throws SQLException
	 */
	public List<CartVO> getAllCart(MemberVO memVO) throws SQLException;

	
	//////////////////////////////////////////////////////////////////
	
	
	// 2. 미결인 모든 상품 가져오기 = 현 장바구니 목록
	/**
	 * 현재 장바구니에 담겨있는 상품들
	 * @param memVO 로그인 회원
	 * @return 현재 장바구니에 담겨있는 상품을 담고 있는 List<CartVO> 객체
	 * @throws SQLException
	 */
	public List<CartVO> inCart(MemberVO memVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 결제한 모든 상품 조회
	/**
	 * 결제한 모든 상품 조회
	 * @param memVO 로그인 회원
	 * @return 결제한 모든 상품이 담긴 List<CartVO> 객체
	 * @throws SQLException
	 */
	public List<CartVO> payedCart(MemberVO memVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 4. 장바구니 비었을 때 첫 상품 넣기
	// 4-1. 유치원////////////////////////////////////////////////////
	/**
	 * 장바구니가 비어있을 때 유치원 상품 넣기
	 * @param kinVO 장바구니에 들어갈 유치원 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int kinFinCart(KindercartenVO kinVO) throws SQLException;
	
	
	// 4-2. 온라인////////////////////////////////////////////////////
	/**
	 * 장바구니가 비어있을 때 온라인 상품 넣기
	 * @param clsVO 장바구니에 들어갈 온라인 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int clsFinCart(ClassVO clsVO) throws SQLException;

	
	// 4-3. 오프라인//////////////////////////////////////////////////
	/**
	 * 장바구니가 비어있을 때 오프라인 상품 넣기
	 * @param eduVO 장바구니에 들어갈 오프라인 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int eduFinCart(EducationVO eduVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 5. 장바구니에 이미 담겨 있을 때
	// 5-1. 유치원////////////////////////////////////////////////////
	/**
	 * 장바구니가 이미 있어서 추가로 담는 상품을 업데이트
	 * @param kinVO 장바구니에 들어갈 유치원 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int kinAddCart(KindercartenVO kinVO) throws SQLException;
	
	
	// 5-2. 온라인////////////////////////////////////////////////////
	/**
	 * 장바구니가 이미 있어서 추가로 담는 상품을 업데이트
	 * @param clsVO 장바구니에 들어갈 온라인 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int clsAddCart(ClassVO clsVO) throws SQLException;
	
	
	// 5-3. 오프라인//////////////////////////////////////////////////
	/**
	 * 장바구니가 이미 있어서 추가로 담는 상품을 업데이트
	 * @param eduVO 장바구니에 들어갈 오프라인 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int eduAddCart(EducationVO eduVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 6. 결제하기
	// 6-1. 전체 결제/////////////////////////////////////////////////
	/**
	 * 현 장바구니 출력 상품(미결인 상태) 전체 구매
	 * @param cartVO 구매할 장바구니 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int payAll(CartVO cartVO) throws SQLException;
	
	
	// 6-2. 선택 결제/////////////////////////////////////////////////
	/**
	 * 현 장바구니 출력 상품(미결인 상태) 일부 구매
	 * @param cartVO
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int payPart(CartVO cartVO) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
}
