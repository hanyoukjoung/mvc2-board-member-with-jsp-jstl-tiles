package kr.or.ddit.admin.admin.service;

import java.util.Map;

import kr.or.ddit.vo.AdminVO;


public interface IAdminService {

	public AdminVO adminInfo(Map<String, String> params);
}
