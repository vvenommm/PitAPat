package kr.or.ddit.pitapet.education.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.vo.ClassVO;

public interface ClassDAO {
	
	//온라인 강의/////////////////////////////////////////////////////////

	
	//////////////////////////////////////////////////////////////////

	
	// 1. 모든 온라인 강좌 목록 조회
	/**
	 * 모든 온라인 강좌 목록 조회
	 * @return 모든 강의를 담은 List<ClassVO>
	 * @throws SQLException
	 */
	public List<ClassVO> getAllClass() throws SQLException;

	
	//////////////////////////////////////////////////////////////////

	
	//1-1. cls_main.jsp에서 모든 패키지 목록 조회
	/**
	 * cls_main.jsp에서 모든 패키지 목록 조회
	 * @return 모든 패키지를 담은 List<ClassVO>
	 * @throws SQLException
	 */
	public List<ClassVO> getAllPack() throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////

	
	//1-2. cls_main.jsp에서 모든 패키지 목록에서 각 패키지의 총 강의 수 조회
	/**
	 * cls_main.jsp에서 모든 패키지 목록에서 각 패키지의 총 강의 수 조회
	 * @return 각 패키지 당 강의 수를 담은 List<ClassVO>
	 * @throws SQLException
	 */
	public List<ClassVO> getClsCount() throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////

	
	// 2. 온라인 강좌 상세 조회
	/**
	 * 온라인 강좌 상세 조회
	 * @param cls_no
	 * @return 선택한 강좌 정보를 담은 ClassVO
	 * @throws SQLException
	 */
	public ClassVO getClsInfo (int cls_no) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 훈련사가 온라인 강좌 등록 신청
	/**
	 * 훈련사가 온라인 강좌 등록 신청
	 * @param vo 훈련사가 등록하고자 하는 강좌 정보를 담은 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int insertCls (ClassVO vo) throws SQLException;

	
	//////////////////////////////////////////////////////////////////
	
	
	// 4. 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	/**
	 * 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	 * @param vo 훈련사/관리자가 등록, 승인, 취소, 삭제하고자 하는 강좌 정보를 담은 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int appInsCls (ClassVO vo) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////

	
	// 5. 온라인 강좌 수정
	/**
	 * 온라인 강좌 수정
	 * @param vo 훈련사가 자기 강좌를 수정하고 싶을 때 수정 정보를 담은 객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int modiCls (ClassVO vo) throws SQLException;

	
	//////////////////////////////////////////////////////////////////
	
	
	// 10. 교육 일정 조회(옵션)
	
	
}
