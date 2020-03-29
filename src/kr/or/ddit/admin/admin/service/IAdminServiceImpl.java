package kr.or.ddit.admin.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.admin.admin.dao.IAdminDao;
import kr.or.ddit.admin.admin.dao.IAdminDaoImpl;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.IMemberDaoImpl;
import kr.or.ddit.vo.AdminVO;

public class IAdminServiceImpl implements IAdminService{
	
	private static IAdminService service = new IAdminServiceImpl();
	private static IAdminDao dao = IAdminDaoImpl.getInstance();
	private IAdminServiceImpl(){}
	
	public static IAdminService getInstance(){
		return (service == null) ? service = new IAdminServiceImpl() : service;
	}

	@Override
	public AdminVO adminInfo(Map<String, String> params) {
		AdminVO adminInfo = null;
		try {
			adminInfo = dao.adminInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adminInfo;
	}
}
