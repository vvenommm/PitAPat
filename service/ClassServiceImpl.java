package kr.or.ddit.pitapet.education.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import kr.or.ddit.pitapet.education.dao.ClassDAO;
import kr.or.ddit.pitapet.education.dao.ClassDAOImpl;
import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.MemberVO;

public class ClassServiceImpl implements ClassService {
	
	private ClassDAO dao;
	private static ClassServiceImpl service;
	static Logger logger = Logger.getLogger(ClassServiceImpl.class);
	private ClassServiceImpl() {
		dao = ClassDAOImpl.getInstance();
	}
	
	public static ClassServiceImpl getInstance() {
		if(service == null) service = new ClassServiceImpl();
		return service;
	}
	
	//온라인 강의/////////////////////////////////////////////////////////

	
	//////////////////////////////////////////////////////////////////

		
	// 1. 모든 온라인 강좌 목록 조회
	@Override
	public List<ClassVO> getAllClass() {
		List<ClassVO> classList = null;
		
		try {
			classList = dao.getAllClass();
			logger.trace("실행 dao 결과 : " + classList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			classList = null;
			e.printStackTrace();
		}
		return classList;
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	//1-1. cls_main.jsp에서 모든 패키지 목록 조회
	public List<ClassVO> getAllPack() {
		List<ClassVO> packList = null;
		
		try {
			packList = dao.getAllPack();
			logger.trace("실행 dao 결과 : " + packList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			packList = null;
			e.printStackTrace();
		}
		return packList;
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	//1-2. cls_main.jsp에서 모든 패키지 목록에서 각 패키지의 총 강의 수 조회
	public List<ClassVO> getClsCount() {
		List<ClassVO> countList = null;
		
		try {
			countList = dao.getClsCount();
			logger.trace("실행 dao 결과 : " + countList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			countList = null;
			e.printStackTrace();
		}
		return countList;
	}
	

	//////////////////////////////////////////////////////////////////
	
	
	// 2. 온라인 강좌 상세 조회
	@Override
	public List<ClassVO> getClsInfo(String cls_subject) {
		List<ClassVO> clsOneList = null;
		
		try {
			clsOneList = dao.getClsInfo(cls_subject);
			logger.trace("매개변수 : " + cls_subject);
			logger.trace("실행 dao 결과 : " + clsOneList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			clsOneList = null;
			e.printStackTrace();
		}
		return clsOneList;
	}
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 훈련사가 온라인 강좌 등록 신청
	@Override
	public int insertCls(ClassVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.insertCls(vo);
			logger.trace("매개변수 : " + vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	@Override
	public int getClsNo() {
		int resultNum = 0;
		
		try {
			resultNum = dao.getClsNo();
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 4. 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	@Override
	public int appInsCls(ClassVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.appInsCls(vo);
			logger.trace("매개변수 : " + vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	// 5. 온라인 강좌 수정
	@Override
	public int modiCls(ClassVO vo) {
		int resultNum = 0;
		
		try {
			resultNum = dao.modiCls(vo);
			logger.trace("매개변수 : " + vo);
			logger.trace("실행 dao 결과 : " + resultNum);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 6. 훈련사의 내 온라인 강좌 보기
	@Override
	public List<ClassVO> getMyCls(MemberVO vo) {
		List<ClassVO> myClsList = null;
		
		try {
			myClsList = dao.getMyCls(vo);
			logger.trace("매개변수 : " + vo);
			logger.trace("실행 dao 결과 : " + myClsList);
			logger.info("작업 성공~~~");
		} catch (SQLException e) {
			myClsList = null;
			e.printStackTrace();
		}
		return myClsList;
	}
	
	
	//////////////////////////////////////////////////////////////////
	// 10. 교육 일정 조회(옵션)
	
	
}
