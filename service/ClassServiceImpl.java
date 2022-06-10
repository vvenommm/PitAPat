package kr.or.ddit.pitapet.education.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.pitapet.education.dao.ClassDAO;
import kr.or.ddit.pitapet.education.dao.ClassDAOImpl;
import kr.or.ddit.pitapet.vo.ClassVO;

public class ClassServiceImpl implements ClassService {
	
	private ClassDAO dao;
	private static ClassServiceImpl service;
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
		} catch (SQLException e) {
			classList = null;
			e.printStackTrace();
		}
		return classList;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 2. 온라인 강좌 상세 조회
	@Override
	public ClassVO getClsInfo(int cls_no) {
		ClassVO classVO = null;
		
		try {
			classVO = dao.getClsInfo(cls_no);
		} catch (SQLException e) {
			classVO = null;
			e.printStackTrace();
		}
		return classVO;
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
		} catch (SQLException e) {
			resultNum = 0;
			e.printStackTrace();
		}
		return resultNum;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 10. 교육 일정 조회(옵션)
	
	
}
