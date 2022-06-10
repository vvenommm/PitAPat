package kr.or.ddit.pitapet.education.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ClassDAOImpl implements ClassDAO {
	
	private static ClassDAOImpl dao;
	private ClassDAOImpl() {}
	
	public static ClassDAOImpl getInstance() {
		if(dao == null ) dao = new ClassDAOImpl();
		return dao;
	}
	
	SqlMapClient smc = SqlMapClientFactory.getSqlMapClient();
	
	
	//온라인 강의/////////////////////////////////////////////////////////
	
	
	//////////////////////////////////////////////////////////////////

	
	// 1. 모든 온라인 강좌 목록 조회
	@Override
	public List<ClassVO> getAllClass() throws SQLException {
		return smc.queryForList("class.getAllClass");
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 2. 온라인 강좌 상세 조회
	@Override
	public ClassVO getClsInfo(int cls_no) throws SQLException {
		return (ClassVO) smc.queryForObject("class.getClsInfo", cls_no);
	}
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 훈련사가 온라인 강좌 등록 신청
	@Override
	public int insertCls(ClassVO vo) throws SQLException {
		return (int) smc.insert("class.insertCls", vo);
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 4. 신청된 온라인 강좌 승인/비승인 (등록, 승인, 취소, 삭제)
	@Override
	public int appInsCls(ClassVO vo) throws SQLException {
		return smc.update("class.appInsCls", vo);
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 5. 온라인 강좌 수정
	@Override
	public int modiCls(ClassVO vo) throws SQLException {
		return smc.update("class.modiCls", vo);
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 10. 교육 일정 조회(옵션)
	
}
