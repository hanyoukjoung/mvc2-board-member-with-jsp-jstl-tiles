package kr.or.ddit.free.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.tagext.TryCatchFinally;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FBoardVO;

import com.ibatis.sqlmap.client.SqlMapClient;


public class IFreeBoardDaoImpl implements IFreeBoardDao {
	private static IFreeBoardDao dao = new IFreeBoardDaoImpl();
	private SqlMapClient client;
	
	public static IFreeBoardDao getInstance(){
		return (dao == null) ? dao = new IFreeBoardDaoImpl() : dao ;
	}
	
	private IFreeBoardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public List<FBoardVO> freeboardList(Map<String, String> params) throws SQLException {
	
		return client.queryForList("fboard.freeboardList",params);
	}

	@Override
	public FBoardVO freeboardInfo(Map<String, String> params)
			throws SQLException {
		FBoardVO freeboardInfo =null;
		try {
			client.startTransaction();
			
			client.update("fboard.updateHit", params);
			freeboardInfo= (FBoardVO) client.queryForObject("fboard.freeboardInfo",params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return freeboardInfo;
	}

	@Override
	public void updatefreeboard(FBoardVO freeboardInfo) throws SQLException {
		client.update("fboard.updateFreeboard", freeboardInfo);
		
	}

	@Override
	public void deletefreeboard(Map<String, String> params) throws SQLException {
		client.update("fboard.deletefreeboard",params);
		
	}

	@Override
	public String insertFreeboard(FBoardVO freeboardInfo) throws SQLException {
		return (String) client.insert("fboard.insertFreeboard", freeboardInfo);
		
		
	}

	@Override
	public String totalCount(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("fboard.totalCount",params);
	}

	@Override
	public void insertFboardReply(FBoardVO freeboardInfo) throws SQLException {
		try {
			client.startTransaction();
			
			String bo_seq;
			if("0".intern()==freeboardInfo.getBo_seq().intern()){
				bo_seq = (String) client.queryForObject("fboard.incrementSEQ", freeboardInfo);
			}else{
			
				bo_seq = String.valueOf(Integer.parseInt(freeboardInfo.getBo_seq()) + 1);
			}
			freeboardInfo.setBo_seq(bo_seq);
			
			String bo_depth = String.valueOf(Integer.parseInt(freeboardInfo.getBo_depth()) + 1);
			freeboardInfo.setBo_depth(bo_depth);
			
			client.insert("fboard.insertFboardReply", freeboardInfo);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
	}
}
