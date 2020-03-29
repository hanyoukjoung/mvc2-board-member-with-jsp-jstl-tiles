package kr.or.ddit.file.nboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface nBoardFileDao {

	public void insertNboardFile(List<BoardFileVO> nboardItemList) throws SQLException;
	public BoardFileVO nboardfileitemInfo(Map<String, String> params) throws SQLException;
	

}
