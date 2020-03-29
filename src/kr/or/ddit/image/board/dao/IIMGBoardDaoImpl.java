package kr.or.ddit.image.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.IBoardVO;

import com.ibatis.sqlmap.client.SqlMapClient;


public class IIMGBoardDaoImpl implements IIMGBoardDao {
	private static IIMGBoardDao dao = new IIMGBoardDaoImpl();
	private SqlMapClient client;
	
	public static IIMGBoardDao getInstance(){
		return (dao == null) ? dao = new IIMGBoardDaoImpl() : dao ;
	}
	
	private IIMGBoardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public String totalCount(Map<String, String> params) throws SQLException {
		return (String)client.queryForObject("iboard.totalcount", params);
	}

	@Override
	public List<IBoardVO> boardList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("iboard.boardList", params);
	}

	@Override
	public IBoardVO boardInfo(Map<String, String> params) throws SQLException {
		client.update("iboard.increaseHit", params);
		return (IBoardVO)client.queryForObject("iboard.boardInfo", params);
	}

	@Override
	public String insertBoard(IBoardVO boardInfo) throws SQLException {
		return (String)client.insert("iboard.insertBoard", boardInfo);
	}

	@Override
	public void updateBoard(IBoardVO boardInfo) throws SQLException {
		client.update("iboard.updateBoard", boardInfo);
	}

	@Override
	public void deleteBoard(Map<String, String> params) throws SQLException {
		client.update("iboard.deleteBoard", params);
	}

	@Override
	public int updateBoardForAdmin(IBoardVO boardInfo) throws SQLException {
		return client.update("iboard.updateBoardForAdmin", boardInfo);
	}
}
