package kr.or.ddit.pitapet.education.service;

import java.util.List;

import kr.or.ddit.pitapet.vo.ClassVO;

public class ClassServiceImpl implements ClassService {
	
	private static ClassServiceImpl service;
	private ClassServiceImpl() {}
	
	public static ClassServiceImpl getInstance() {
		if(service == null) service = new ClassServiceImpl();
		return service;
	}
	
	//온라인 강의/////////////////////////////////////////////////////////

	
	//////////////////////////////////////////////////////////////////

		
	// 1. 모든 온라인 강좌 목록 조회
	@Override
	public List<ClassVO> getAllClass() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 2. 온라인 강좌 상세 조회
	@Override
	public ClassVO getClsInfo(int cls_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 훈련사가 온라인 강좌 등록 신청
	@Override
	public int insertCls(ClassVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 4. 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	@Override
	public int appInsCls(ClassVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	// 5. 온라인 강좌 수정
	@Override
	public int modiCls(ClassVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 10. 교육 일정 조회(옵션)
	
	
}
