package kr.or.ddit.ntc.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FBoardVO;
import kr.or.ddit.vo.NBoardVO;

public interface NTCBoardDao {
	public List<NBoardVO> nboardList(Map<String, String> params) throws SQLException;
	public NBoardVO nfreeboardInfo(Map<String, String> params) throws SQLException;
	public String totalCount(Map<String, String> params) throws SQLException;
	public void updatenboard(NBoardVO freeboardInfo) throws SQLException;
	public void deletenboard(Map<String, String> params) throws SQLException;
	public String insertnboard(NBoardVO freeboardInfo) throws SQLException;

}
