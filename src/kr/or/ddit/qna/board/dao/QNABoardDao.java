package kr.or.ddit.qna.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QBoardVO;

public interface QNABoardDao {
	public String totalCount(Map<String, String> params) throws SQLException;
	public String insertBoardInfo(QBoardVO boardInfo) throws SQLException;
	public void updateQBoardInfo(QBoardVO qboardInfo) throws SQLException;
	public void deleteQBoardInfo(Map<String, String> params) throws SQLException;
	public List<QBoardVO> qboardList(Map<String, String> params) throws SQLException;
	public QBoardVO qboardInfo(Map<String, String> params) throws SQLException;
	public void insertQBoardReply(QBoardVO qboardInfo) throws SQLException;
    public String qboardgroupInfo(QBoardVO qboardInfo) throws SQLException;
}
