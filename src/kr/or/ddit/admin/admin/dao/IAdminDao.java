package kr.or.ddit.admin.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;

public interface IAdminDao {

	public AdminVO adminInfo(Map<String, String> params) throws SQLException;
}
