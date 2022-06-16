package kr.or.ddit.pitapet.education.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.MemberVO;

public interface ClassService {
	
	//온라인 강의/////////////////////////////////////////////////////////

	
	//////////////////////////////////////////////////////////////////

	
	// 1. 모든 온라인 강좌 목록 조회
	/**
	 * 모든 온라인 강좌 목록 조회
	 * @return 모든 강의를 담은 List<ClassVO>
	 */
	public List<ClassVO> getAllClass();

	
	//////////////////////////////////////////////////////////////////

	
	//1-1. cls_main.jsp에서 모든 패키지 목록 조회
	/**
	 * cls_main.jsp에서 모든 패키지 목록 조회
	 * @return 모든 패키지를 담은 List<ClassVO>
	 */
	public List<ClassVO> getAllPack();
	
	
	//////////////////////////////////////////////////////////////////

	
	//1-2. cls_main.jsp에서 모든 패키지 목록에서 각 패키지의 총 강의 수 조회
	/**
	 * cls_main.jsp에서 모든 패키지 목록에서 각 패키지의 총 강의 수 조회
	 * @return 각 패키지 당 강의 수를 담은 List<ClassVO>
	 */
	public List<ClassVO> getClsCount();
	
	
	//////////////////////////////////////////////////////////////////

	
	// 2. 온라인 강좌 상세 조회
	/**
	 * 온라인 강좌 상세 조회
	 * @param cls_no
	 * @return 선택한 강좌 정보를 담은 ClassVO
	 */
	public List<ClassVO> getClsInfo (String cls_subject);
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 훈련사가 온라인 강좌 등록 신청
	/**
	 * 훈련사가 온라인 강좌 등록 신청
	 * @param vo 훈련사가 등록하고자 하는 강좌 정보를 담은 객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertCls (ClassVO vo);
	
	public int getClsNo();

	
	//////////////////////////////////////////////////////////////////
	
	
	// 4. 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	/**
	 * 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	 * @param vo 훈련사/관리자가 등록, 승인, 취소, 삭제하고자 하는 강좌 정보를 담은 객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int appInsCls (ClassVO vo);
	
	
	//////////////////////////////////////////////////////////////////

	
	// 5. 온라인 강좌 수정
	/**
	 * 온라인 강좌 수정
	 * @param vo 훈련사가 자기 강좌를 수정하고 싶을 때 수정 정보를 담은 객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int modiCls (ClassVO vo);

	
	//////////////////////////////////////////////////////////////////
	
	
	// 6. 훈련사의 내 온라인 강좌 보기
	/**
	 * 훈련사가 내 강좌 보기 클릭 시 본인 강의만 목록으로 출력
	 * @param emp_id 훈련사 본인의 아이디이자 사번이 있는 멤버vo
	 * @return 본인의 강의를 담고 있는 List<ClassVO) 객체
	 * @throws SQLException
	 */
	public List<ClassVO> getMyCls (MemberVO vo);
		
		
	//////////////////////////////////////////////////////////////////
	
	
	// 10. 교육 일정 조회(옵션)
	

}
