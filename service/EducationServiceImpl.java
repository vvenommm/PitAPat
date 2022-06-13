package kr.or.ddit.pitapet.education.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.education.dao.EducationDAO;
import kr.or.ddit.pitapet.education.dao.EducationDAOImpl;
import kr.or.ddit.pitapet.vo.DogVO;
import kr.or.ddit.pitapet.vo.EducationVO;

import org.apache.log4j.Logger;

public class EducationServiceImpl implements EducationService{
	private EducationDAO dao;
	private static EducationServiceImpl service;
	static Logger logger = Logger.getLogger(EducationServiceImpl.class);
	
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
			logger.trace("실행 dao 결과 : " + eduList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			eduList = null;
			e.printStackTrace();
		}
		
		return eduList;
	}
	
	
	//////////////////////////////////////////////////////////////

	
	
	//1-1. 모든 오프라인 강좌 목록 조회
	@Override
	public List<EducationVO> getAllEdu2() {
		List<EducationVO> eduList = null;
		
		try {
			eduList = dao.getAllEdu2();
			logger.trace("실행 dao 결과 : " + eduList);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + edu_no);
		
		try {
			eduVO = dao.getEduInfo(edu_no);
			logger.trace("실행 dao 결과 : " + eduVO);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + mem_id);
		
		try {
			dogVO = dao.getDogInfo(mem_id);
			logger.trace("실행 dao 결과 : " + dogVO);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + vo);
		
		try {
			resultNum = dao.insertDogInfo(vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + vo);
		
		try {
			resultNum = dao.updateDogInfo(vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + vo);
		
		try {
			resultNum = dao.insertEdu(vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + vo);
		try {
			resultNum = dao.appInsEdu(vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
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
		logger.trace("매개변수 : " + vo);
		
		try {
			resultNum = dao.modiEdu(vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	//10. 훈련사의 내 오프라인 강좌 보기
	@Override
	public List<EducationVO> getMyEdu(String emp_code) {
		List<EducationVO> myEduList = null;
		logger.trace("매개변수 : " + emp_code);
		
		try {
			myEduList = dao.getMyEdu(emp_code);
			logger.trace("실행 dao 결과 : " + myEduList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			myEduList = null;
			e.printStackTrace();
		}
		return myEduList;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//10. 교육 일정 조회(옵션)
	
	
}
