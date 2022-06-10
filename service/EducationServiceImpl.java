package kr.or.ddit.pitapet.education.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.education.dao.EducationDAO;
import kr.or.ddit.pitapet.education.dao.EducationDAOImpl;
import kr.or.ddit.pitapet.vo.DogVO;
import kr.or.ddit.pitapet.vo.EducationVO;

public class EducationServiceImpl implements EducationService{
	private EducationDAO dao;
	private static EducationServiceImpl service;
	
	private EducationServiceImpl() {
		dao = EducationDAOImpl.getInstance();
	}
	public static EducationServiceImpl getInstance() {
		if(service == null) service = new EducationServiceImpl();
		return service;
	}
	
	//오프라인 교육///////////////////////////////////////////
	
	
	
	//1. 모든 오프라인 강좌 목록 조회
	@Override
	public List<EducationVO> getAllEdu() {
		List<EducationVO> eduList = null;
		
		try {
			eduList = dao.getAllEdu();
		} catch (SQLException e) {
			eduList = null;
			e.printStackTrace();
		}
		return eduList;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//2. 오프라인 강좌 상세 조회
	@Override
	public EducationVO getEduInfo(int edu_no) {
		EducationVO eduVO = null;
		
		try {
			eduVO = dao.getEduInfo(edu_no);
		} catch (SQLException e) {
			eduVO = null;
			e.printStackTrace();
		}
		return eduVO;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//3. 오프라인 강좌 신청 시 강아지 정보 불러오기
	@Override
	public DogVO getDogInfo(String mem_id) {
		DogVO dogVO = null;
		
		try {
			dogVO = dao.getDogInfo(mem_id);
		} catch (SQLException e) {
			dogVO = null;
			e.printStackTrace();
		}
		return dogVO;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//4. 오프라인 강좌 신청 시 강아지 정보 입력
	@Override
	public int insertDogInfo(DogVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.insertDogInfo(vo);
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//5. 오프라인 강좌 신청 시 강아지 정보 수정된거 있으면 update
	@Override
	public int updateDogInfo(DogVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.updateDogInfo(vo);
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//6. 손님이 원하는 강좌 강아지 정보 입력 후 장바구니에 담기
	
	
	//////////////////////////////////////////////////////////////

	
	//7. 훈련사가 오프라인 강좌 등록 신청(INSERT)
	@Override
	public int insertEdu(EducationVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.insertEdu(vo);
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////

	
	//8. 신청된 오프라인 강좌 삭제 신청, 관리자의 승인/비승인(UPDATE) - status에 넣을 String이랑 edu_no
	@Override
	public int appInsEdu(EducationVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.appInsEdu(vo);
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//9. 오프라인 강좌 수정
	@Override
	public int modiEdu(EducationVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.modiEdu(vo);
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//10. 교육 일정 조회(옵션)
	
	
}
