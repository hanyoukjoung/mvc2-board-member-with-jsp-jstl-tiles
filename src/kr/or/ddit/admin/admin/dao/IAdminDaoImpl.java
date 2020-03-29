package kr.or.ddit.admin.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.AdminVO;

import com.ibatis.sqlmap.client.SqlMapClient;


public class IAdminDaoImpl implements IAdminDao {
	private static IAdminDao dao = new IAdminDaoImpl();
	private SqlMapClient client;
	
	public static IAdminDao getInstance(){
		return (dao == null) ? dao = new IAdminDaoImpl() : dao ;
	}
	
	private IAdminDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public AdminVO adminInfo(Map<String, String> params) throws SQLException {
		return (AdminVO)client.queryForObject("admin.adminInfo", params);
	}
}
