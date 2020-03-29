package kr.or.ddit.file.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface IMemberFileDao {
	public void insertMemberFile(BoardFileVO fileItem) throws SQLException;
	public BoardFileVO memberFileInfo(Map<String, String> params) throws SQLException;
}
