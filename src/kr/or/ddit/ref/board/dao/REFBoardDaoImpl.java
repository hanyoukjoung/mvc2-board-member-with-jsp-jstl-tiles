package kr.or.ddit.ref.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.RBoardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class REFBoardDaoImpl implements REFBoardDao {
	private static REFBoardDao dao = new REFBoardDaoImpl();
	private SqlMapClient client= SqlMapClientFactory.getSqlMapClient();
	
	public static REFBoardDao getInstance(){
		return (dao == null) ? dao = new REFBoardDaoImpl() : dao ;
	}
	
	private REFBoardDaoImpl(){

	}

	@Override
	public List<RBoardVO> rboardList(Map<String, String> params) throws SQLException {
		return client.queryForList("rboard.rboardList",params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("rboard.totalCount",params);
	}

	@Override
	public String insertBoardInfo(RBoardVO boardInfo) throws SQLException {
		return (String) client.insert("rboard.insertRBoard", boardInfo);
	}

	@Override
	public RBoardVO rboardInfo(Map<String, String> params) throws SQLException {
		RBoardVO rboardInfo = null;
		try {
			client.startTransaction();
			
			client.update("rboard.updateHIT",params);
			rboardInfo = (RBoardVO) client.queryForObject("rboard.rboardInfo", params);
			
			client.commitTransaction();
		} finally{
			client.endTransaction();
		}
		return rboardInfo;
	}

	@Override
	public void insertRBoardInfoReply(RBoardVO rboardInfoReply) throws SQLException {
		try {
			client.startTransaction();
			
			String bo_seq;
			
			if("0".intern() == rboardInfoReply.getBo_seq().intern()){
				bo_seq = (String) client.queryForObject("rboard.incrementSEQ", rboardInfoReply);
			}else{
				client.update("rboard.updateSEQ", rboardInfoReply);
				bo_seq = String.valueOf(Integer.parseInt(rboardInfoReply.getBo_seq())+1);
			}
			rboardInfoReply.setBo_seq(bo_seq);
			
			String bo_depth = String.valueOf(Integer.parseInt(rboardInfoReply.getBo_depth())+1);
			rboardInfoReply.setBo_depth(bo_depth);
	
			client.insert("rboard.insertRBoardReply",rboardInfoReply);
			
			client.commitTransaction();
		} finally{
			client.endTransaction();
		}
	}

	@Override
	public void updateRBoardInfo(RBoardVO rboardInfo) throws SQLException {
		client.update("rboard.updateRBoardInfo", rboardInfo);
	}

	@Override
	public void deleteRBoardInfo(Map<String, String> params) throws SQLException {
		client.update("rboard.deleteRBoardInfo", params);
	}
}
