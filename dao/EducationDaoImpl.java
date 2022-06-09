package kr.or.ddit.pitapet.education.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

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
	
	
	//모든 오프라인 강좌 목록
	@Override
	public List<EducationVO> getAllEdu() throws SQLException {
		
		return null;
	}
	
	
	//////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
}
