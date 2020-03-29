package kr.or.ddit.ref.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RBoardVO;

public interface REFBoardDao {

	public String totalCount(Map<String, String> params) throws SQLException;
	public List<RBoardVO> rboardList(Map<String, String> params) throws SQLException;
	public String insertBoardInfo(RBoardVO boardInfo) throws SQLException;
	public RBoardVO rboardInfo(Map<String, String> params) throws SQLException;
	public void insertRBoardInfoReply(RBoardVO rboardInfoReply) throws SQLException;
	public void updateRBoardInfo(RBoardVO rboardInfo) throws SQLException;
	public void deleteRBoardInfo(Map<String, String> params) throws SQLException;
}
