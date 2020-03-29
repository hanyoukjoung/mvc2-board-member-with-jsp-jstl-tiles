package kr.or.ddit.file.iboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface IIMGBoardFileDao {
	public void insertBoardFile(List<BoardFileVO> boardFileList) throws SQLException;
	public BoardFileVO iboardFileInfo(Map<String, String> params) throws SQLException;
	public BoardFileVO iboardFileInfoForThumb(Map<String, String> params) throws SQLException;

}
