package kr.or.ddit.pitapet.education.dao;


import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.vo.DogVO;
import kr.or.ddit.pitapet.vo.EducationVO;

public interface EducationDAO {
	
	//오프라인 교육///////////////////////////////////////////
	
	
	
	//1. 모든 오프라인 강좌 목록 조회
	public List<EducationVO> getAllEdu() throws SQLException;
	
	//2. 오프라인 강좌 상세 조회
	public EducationVO getEduInfo(int edu_no) throws SQLException;
	
	//3. 오프라인 강좌 신청 시 강아지 정보 불러오기
	public DogVO getDogInfo (String mem_id) throws SQLException;
	
	//4. 오프라인 강좌 신청 시 강아지 정보 입력
	public int insertDogInfo (DogVO vo) throws SQLException;
	
	//5. 오프라인 강좌 신청 시 강아지 정보 수정된거 있으면 update
	public int updateDogInfo (DogVO vo) throws SQLException;
	
	//6. 손님이 원하는 강좌 강아지 정보 입력 후 장바구니에 담기
	
	
	//////////////////////////////////////////////////////////////////
	
	//7. 훈련사가 오프라인 강좌 등록 신청(INSERT)
	public int insertEdu (EducationVO vo) throws SQLException;
	
	//8. 신청된 오프라인 강좌 삭제 신청, 관리자의 승인/비승인(UPDATE) - status에 넣을 String이랑 edu_no
	public int appInsEdu (EducationVO vo) throws SQLException;
	
	//9. 오프라인 강좌 수정
	public int modiEdu (EducationVO vo) throws SQLException;
	
	//10. 교육 일정 조회(옵션)
	
	
}
