package kr.or.ddit.zipcode.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZiptbVO;

public interface IZipcodeDao {
	public List<ZiptbVO> zipcodeList(Map<String, String> params) throws SQLException;

	public List<String> sidoList() throws SQLException;

	public List<String> gugunList(String sido) throws SQLException;
}
