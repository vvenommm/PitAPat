package kr.or.ddit.pitapet.education.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.pitapet.vo.ClassVO;
import kr.or.ddit.pitapet.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ClassDAOImpl implements ClassDAO {
	
	private static ClassDAOImpl dao;
	SqlMapClient smc = SqlMapClientFactory.getSqlMapClient();
	private ClassDAOImpl() {}
	
	public static ClassDAOImpl getInstance() {
		if(dao == null ) dao = new ClassDAOImpl();
		return dao;
	}
	
	
	
	//온라인 강의/////////////////////////////////////////////////////////
	
	
	//////////////////////////////////////////////////////////////////

	
	// 1. 모든 온라인 강좌 목록 조회
	@Override
	public List<ClassVO> getAllClass() throws SQLException {
		return smc.queryForList("class.getAllClass");
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	//1-1. cls_main.jsp에서 모든 패키지 목록 조회
	public List<ClassVO> getAllPack() throws SQLException {
		return smc.queryForList("class.getAllPack");
	}
	
	
	//////////////////////////////////////////////////////////////////

	
	//1-2. cls_main.jsp에서 모든 패키지 목록에서 각 패키지의 총 강의 수 조회
	public List<ClassVO> getClsCount() throws SQLException {
		return smc.queryForList("class.getClsCount");
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 2. 온라인 강좌 상세 조회
	@Override
	public List<ClassVO> getClsInfo(String cls_subject) throws SQLException {
		return smc.queryForList("class.getClsInfo", cls_subject);
	}
	
	
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////
	
	
	// 3. 훈련사가 온라인 강좌 등록 신청
	@Override
	public int insertCls(ClassVO vo) throws SQLException {
		ClassVO result = (ClassVO)smc.insert("class.insertCls", vo);
		int resultNum = 0;
		if(result == null) {
			resultNum = 1;
		}
		return resultNum; 
	}
	
	@Override
	public int getClsNo() throws SQLException {
		int resultNum = (int) smc.queryForObject("class.getClsNo");
//		if(resultNum == null) {
//			resultNum = 0;
//		}
		return resultNum+1;
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
	public int editCls(ClassVO vo) throws SQLException {
		return smc.update("class.modiCls", vo);
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 6. 훈련사의 내 온라인 강좌 보기
	@Override
	public List<ClassVO> getMyCls(String emp_id) throws SQLException {
		return smc.queryForList("class.getMyCls", emp_id);
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	// 10. 교육 일정 조회(옵션)
	
}
