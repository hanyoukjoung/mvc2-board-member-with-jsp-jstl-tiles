package kr.or.ddit.image.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IBoardVO;

public interface IIMGBoardDao {
	public String totalCount(Map<String, String> params) throws SQLException;

	public List<IBoardVO> boardList(Map<String, String> params) throws SQLException;

	public IBoardVO boardInfo(Map<String, String> params) throws SQLException;

	public String insertBoard(IBoardVO boardInfo) throws SQLException;

	public void updateBoard(IBoardVO boardInfo) throws SQLException;

	public void deleteBoard(Map<String, String> params) throws SQLException;

	public int updateBoardForAdmin(IBoardVO boardInfo) throws SQLException;
}
