package kr.or.ddit.ntc.board.dao;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FBoardVO;
import kr.or.ddit.vo.NBoardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class NTCBoardDaoImpl implements NTCBoardDao {
	private static NTCBoardDao dao = new NTCBoardDaoImpl();
	private SqlMapClient client;
	
	public static NTCBoardDao getInstance(){
		return (dao == null) ? dao = new NTCBoardDaoImpl() : dao ;
	}
	
	private NTCBoardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public List<NBoardVO> nboardList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("nboard.freeboardList", params);
	}

	@Override
	public NBoardVO nfreeboardInfo(Map<String, String> params)
			throws SQLException {
		NBoardVO nboardInfo = null;
		try {
			client.startTransaction();
			
			client.update("nboard.updateHit", params);
			nboardInfo = (NBoardVO) client.queryForObject("nboard.freeboardInfo", params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
			
		}
		return nboardInfo;
	}
	@Override
	public String totalCount(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("nboard.totalCount",params);
	}
	@Override
	public void updatenboard(NBoardVO freeboardInfo) throws SQLException {
		client.update("nboard.updatenboard", freeboardInfo);
		
	}

	@Override
	public void deletenboard(Map<String, String> params) throws SQLException {
		client.update("nboard.deletenboard",params);
		
	}

	@Override
	public String insertnboard(NBoardVO freeboardInfo) throws SQLException {
		return (String) client.insert("nboard.insertnboard", freeboardInfo);
		
	}
	
	
}
