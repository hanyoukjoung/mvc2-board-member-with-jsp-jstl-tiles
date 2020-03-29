package kr.or.ddit.zipcode.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZiptbVO;
import kr.or.ddit.zipcode.dao.IZipcodeDao;
import kr.or.ddit.zipcode.dao.IZipcodeDaoImpl;

public class IZipcodeServiceImpl implements IZipcodeService{

	private static IZipcodeServiceImpl service = new IZipcodeServiceImpl();
	private IZipcodeDao dao;
	
	private IZipcodeServiceImpl(){ 
		dao = IZipcodeDaoImpl.getInstance();
	}
	
	public static IZipcodeServiceImpl getInstance(){
		return (service == null)? service = new IZipcodeServiceImpl() : service;
	}
	
	@Override
	public List<ZiptbVO> zipcodeList(Map<String, String> params){
		List<ZiptbVO> result = null;
		try {
			result = dao.zipcodeList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<String> sidoList() {
		List<String> gugunList = null;
		try {
			gugunList = dao.sidoList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gugunList;
	}

	@Override
	public List<String> gugunList(String sido) {
		List<String> gugunList = null;
		try {
			gugunList = dao.gugunList(sido);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gugunList;
	}

}
