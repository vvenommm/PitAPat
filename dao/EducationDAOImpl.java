package kr.or.ddit.pitapet.education.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.pitapet.vo.DogVO;
import kr.or.ddit.pitapet.vo.EducationVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class EducationDAOImpl implements EducationDAO {
	
	private static EducationDAOImpl dao;
	private EducationDAOImpl() {}
	
	public static EducationDAOImpl getInstance() {
		if(dao == null) dao = new EducationDAOImpl();
		return dao;
	}
	
	SqlMapClient smc = SqlMapClientFactory.getSqlMapClient();
	
	
	//////////////////////////////////////////////////////////////
	
	
	//1. 모든 오프라인 강좌 목록 조회
	@Override
	public List<EducationVO> getAllEdu() throws SQLException {
		return smc.queryForList("edu.getAllEdu");
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//2. 오프라인 강좌 상세 조회
	@Override
	public EducationVO getEduInfo(int edu_no) throws SQLException {
		return (EducationVO) smc.queryForObject("edu.getEduInfo", edu_no);
	}
	
	
	//////////////////////////////////////////////////////////////

	
	//3. 오프라인 강좌 신청 시 강아지 정보 불러오기
	@Override
	public DogVO getDogInfo(String mem_id) throws SQLException {
		return (DogVO) smc.queryForObject("edu.getDogInfo", mem_id);
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//4. 오프라인 강좌 신청 시 강아지 정보 입력
	@Override
	public int insertDogInfo(DogVO vo) throws SQLException {
		return (int) smc.insert("edu.insertDogInfo", vo);
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//5. 오프라인 강좌 신청 시 강아지 정보 수정된거 있으면 update
	@Override
	public int updateDogInfo(DogVO vo) throws SQLException {
		return smc.update("edu.updateDogInfo", vo);
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//6. 손님이 원하는 강좌 강아지 정보 입력 후 장바구니에 담기
	
	
	//////////////////////////////////////////////////////////////
	
	
	//7. 훈련사가 오프라인 강좌 등록 신청(INSERT)
	@Override
	public int insertEdu(EducationVO vo) throws SQLException {
		return (int) smc.insert("edu.insertEdu", vo);
	}

	
	//////////////////////////////////////////////////////////////
	
	
	//8. 신청된 오프라인 강좌 삭제 신청, 관리자의 승인/비승인(UPDATE) - status에 넣을 String이랑 edu_no
	@Override
	public int appInsEdu(EducationVO vo) throws SQLException {
		return smc.update("edu.appInsEdu", vo);
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	//9. 오프라인 강좌 수정
	@Override
	public int modiEdu(EducationVO vo) throws SQLException {
		return smc.update("edu.modiEdu", vo);
	}
	
	
	//////////////////////////////////////////////////////////////
	

	//10. 교육 일정 조회(옵션)
	
	
}
