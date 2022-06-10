package kr.or.ddit.pitapet.education.service;

import java.util.List;

import kr.or.ddit.pitapet.vo.DogVO;
import kr.or.ddit.pitapet.vo.EducationVO;

public class EducationServiceImpl implements EducationService{
	private static EducationServiceImpl service;
	private EducationServiceImpl() {}
	public static EducationServiceImpl getInstance() {
		if(service == null) service = new EducationServiceImpl();
		return service;
	}
	
	//오프라인 교육///////////////////////////////////////////
	
	
	
	//1. 모든 오프라인 강좌 목록 조회
	@Override
	public List<EducationVO> getAllEdu() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//2. 오프라인 강좌 상세 조회
	@Override
	public EducationVO getEduInfo(int edu_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//3. 오프라인 강좌 신청 시 강아지 정보 불러오기
	@Override
	public DogVO getDogInfo(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//4. 오프라인 강좌 신청 시 강아지 정보 입력
	@Override
	public int insertDogInfo(DogVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//5. 오프라인 강좌 신청 시 강아지 정보 수정된거 있으면 update
	@Override
	public int updateDogInfo(DogVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//6. 손님이 원하는 강좌 강아지 정보 입력 후 장바구니에 담기
	
	
	//////////////////////////////////////////////////////////////

	
	//7. 훈련사가 오프라인 강좌 등록 신청(INSERT)
	@Override
	public int insertEdu(EducationVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////

	
	//8. 신청된 오프라인 강좌 삭제 신청, 관리자의 승인/비승인(UPDATE) - status에 넣을 String이랑 edu_no
	@Override
	public int appInsEdu(EducationVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//9. 오프라인 강좌 수정
	@Override
	public int modiEdu(EducationVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//10. 교육 일정 조회(옵션)
	
	
}
