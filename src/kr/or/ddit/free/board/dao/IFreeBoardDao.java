package kr.or.ddit.free.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FBoardVO;

public interface IFreeBoardDao {
	public List<FBoardVO> freeboardList(Map<String, String> params) throws SQLException;
	public FBoardVO freeboardInfo(Map<String, String> params) throws SQLException;
	public void updatefreeboard(FBoardVO freeboardInfo) throws SQLException;
	public void deletefreeboard(Map<String, String> params) throws SQLException;
	public String insertFreeboard(FBoardVO freeboardInfo) throws SQLException;
	public String totalCount(Map<String, String> params) throws SQLException;
	public void insertFboardReply(FBoardVO freeboardInfo) throws SQLException;
}
