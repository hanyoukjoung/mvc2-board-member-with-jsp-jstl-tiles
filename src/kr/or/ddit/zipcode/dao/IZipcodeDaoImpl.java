package kr.or.ddit.zipcode.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZiptbVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IZipcodeDaoImpl implements IZipcodeDao{
	
	private static IZipcodeDaoImpl dao = new IZipcodeDaoImpl();
	private SqlMapClient smc;
	private IZipcodeDaoImpl(){
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IZipcodeDaoImpl getInstance(){
		return (dao == null)? dao = new IZipcodeDaoImpl() : dao;
	}
	
	@Override
	public List<ZiptbVO> zipcodeList(Map<String, String> params) throws SQLException{
		List<ZiptbVO> result = smc.queryForList("zipcode.zipcodeList", params);
		return result;
	}

	@Override
	public List<String> sidoList() throws SQLException {
		return smc.queryForList("zipcode.sidoList");
	}

	@Override
	public List<String> gugunList(String sido) throws SQLException {
		return smc.queryForList("zipcode.gugunList", sido);
	}
}
