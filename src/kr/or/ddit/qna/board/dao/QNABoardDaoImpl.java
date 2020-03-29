package kr.or.ddit.qna.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.QBoardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class QNABoardDaoImpl implements QNABoardDao {
	private static QNABoardDao dao = new QNABoardDaoImpl();
	private SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
	
	private QNABoardDaoImpl(){}

	public static QNABoardDao getInstance(){
		return (dao == null) ? dao = new QNABoardDaoImpl() : dao ;
	}

	@Override
	public QBoardVO qboardInfo(Map<String, String> params) throws SQLException {
		QBoardVO qboardInfo = null;
		try {
			client.startTransaction();
			
			client.update("qboard.updateHIT",params);
			
			qboardInfo = (QBoardVO) client.queryForObject("qboard.qboardInfo", params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return qboardInfo;
	}

	@Override
	public String totalCount(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("qboard.totalCount",params);
	}

	@Override
	public String insertBoardInfo(QBoardVO boardInfo) throws SQLException {
		return (String) client.insert("qboard.insertQBoard", boardInfo);
	}

	
	@Override
	public void updateQBoardInfo(QBoardVO qboardInfo) throws SQLException {
		client.update("qboard.updateQBoardInfo", qboardInfo);
	}

	@Override
	public void deleteQBoardInfo(Map<String, String> params)
			throws SQLException {
		client.update("qboard.deleteQBoardInfo", params);
		
	}

	@Override
	public List<QBoardVO> qboardList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("qboard.qboardList",params);
	}

	@Override
	public void insertQBoardReply(QBoardVO qboardInfo) throws SQLException {
		try {
			client.startTransaction();
			
			String bo_seq;
			if("0".intern()==qboardInfo.getBo_seq().intern()){
				bo_seq = (String) client.queryForObject("qboard.incrementSEQ", qboardInfo);
			}else{
			
				bo_seq = String.valueOf(Integer.parseInt(qboardInfo.getBo_seq()) + 1);
			}
			qboardInfo.setBo_seq(bo_seq);
			
			String bo_depth = String.valueOf(Integer.parseInt(qboardInfo.getBo_depth()) + 1);
			qboardInfo.setBo_depth(bo_depth);
			
			client.insert("qboard.insertQBoardReply", qboardInfo);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
	}
	
	   @Override
	   public String qboardgroupInfo(QBoardVO qboardInfo)
	         throws SQLException {
	      return  (String) client.queryForObject("qboard.selectgroup", qboardInfo);
	   }
	

}
