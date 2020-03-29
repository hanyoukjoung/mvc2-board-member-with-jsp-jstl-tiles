package kr.or.ddit.file.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface BoardFileDao {
	public void rInsertBoardFile(List<BoardFileVO> rFileList) throws SQLException;
	public BoardFileVO rFileBoardInfo(Map<String, String> params) throws SQLException;
}
