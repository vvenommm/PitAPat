package kr.or.ddit.pitapet.education.dao;


import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.vo.DogVO;
import kr.or.ddit.pitapet.vo.EducationVO;

public interface EducationDAO {
	
	//오프라인 교육///////////////////////////////////////////
	
	
	//1. 모든 오프라인 강좌 목록 조회
	/**
	 * 모든 오프라인 강좌(교육)들 목록 조회
	 * @return 모든 강좌 정보가 담긴 List 반환
	 * @throws SQLException
	 */
	public List<EducationVO> getAllEdu() throws SQLException;

	
	//////////////////////////////////////////////////////////////////

	
	//1-1. 모든 오프라인 강좌 목록 조회
	/**
	 * 모든 오프라인 강좌(교육)들 목록 조회
	 * @return 모든 강좌 정보가 담긴 List 반환
	 * @throws SQLException
	 */
	public List<EducationVO> getAllEdu2() throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//2. 오프라인 강좌 상세 조회
	/**
	 * 강좌 목록에서 상세 조회는 원할 때 사용
	 * @param edu_no 강좌 번호를 매개변수로 사용
	 * @return 강좌 번호에 해당되는 강좌 정보를 담은 vo 반환
	 * @throws SQLException
	 */
	public EducationVO getEduInfo(int edu_no) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////

	
	//3. 오프라인 강좌 신청 시 강아지 정보 불러오기
	/**
	 * 회원이 강좌 신청 시 기존에 입력한 강아지 정보 불러오기(있는지 없는지 확인 한 후에 사용하게 코딩)
	 * @param mem_id 해당 회원의 강아지 정보를 불러오기 위해 아이디를 매개변수로
	 * @return 해당 회원의 강아지 정보를 담은 vo 반환
	 * @throws SQLException
	 */
	public DogVO getDogInfo (String mem_id) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//4. 오프라인 강좌 신청 시 강아지 정보 입력
	/**
	 * 강좌 신청 시 (강아지 정봉 없는 경우) 새로 입력한 강아지 정보 추가하기
	 * @param vo 회원이 입력한 강아지 정보를 담은 vo
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int insertDogInfo (DogVO vo) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////

	
	//5. 오프라인 강좌 신청 시 강아지 정보 수정된거 있으면 update
	/**
	 * 기존에 입력한 강아지 정보에서 수정한 값이 있을 때 정보 업데이트
	 * @param vo 수정한 정보를 담은 vo
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int updateDogInfo (DogVO vo) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//6. 손님이 원하는 강좌 강아지 정보 입력 후 장바구니에 담기
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	//7. 훈련사가 오프라인 강좌 등록 신청(INSERT)
	/**
	 * 훈련사가 자신의 강좌를 새로 등록 신청할 때 사용
	 * @param vo 자신의 강좌 정보를 담고 있는 vo
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int insertEdu (EducationVO vo) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//8. 신청된 오프라인 강좌 삭제 신청, 관리자의 승인/비승인(UPDATE) - status에 넣을 String이랑 edu_no
	/**
	 * 훈련사가 신청한 강좌를 관리자가 승인, 비승인, 훈련사가 자신의 강좌를 삭제 신청할 때 사용하는 메소드
	 * @param vo 해당 강좌 정보를 담고 있는 vo
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int appInsEdu (EducationVO vo) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//9. 오프라인 강좌 수정
	/**
	 * 훈련사가 자신의 강좌 정보를 수정하고 싶을 때 사용하는 메소드
	 * @param vo 수정한 정보를 담고 있는 vo
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public int editEdu (EducationVO vo) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//10. 훈련사의 내 오프라인 강좌 보기
	/**
	 * 훈련사가 내 강좌 보기 클릭 시 본인 강의만 목록으로 출력
	 * @param emp_id 훈련사 본인의 아이디이자 사번
	 * @return 본인의 강의를 담고 있는 List<EducationVO) 객체
	 * @throws SQLException
	 */
	public List<EducationVO> getMyEdu (String emp_id) throws SQLException;
	
	
	//////////////////////////////////////////////////////////////////
	
	
	//10. 교육 일정 조회(옵션)
	
	
}
