package kr.or.ddit.file.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface IFreeBoardFileDao {

	public void insertFboardFile(List<BoardFileVO> fboardItemList) throws SQLException;
	public BoardFileVO fboardfileitemInfo(Map<String, String> params) throws SQLException;
	

}
