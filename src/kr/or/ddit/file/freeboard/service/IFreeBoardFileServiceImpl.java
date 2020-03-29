package kr.or.ddit.file.freeboard.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDao;
import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDaoImpl;
import kr.or.ddit.vo.BoardFileVO;

public class IFreeBoardFileServiceImpl implements IFreeBoardFileService {
	private static IFreeBoardFileService service = new IFreeBoardFileServiceImpl();
	private IFreeBoardFileDao dao;
	
	private IFreeBoardFileServiceImpl(){
		dao = IFreeBoardFileDaoImpl.getInstance();
	}
	
	public static IFreeBoardFileService getInstance(){
		return (service == null) ? service = new IFreeBoardFileServiceImpl() : service;
	}
	
	@Override
	public BoardFileVO fboardfileitemInfo(Map<String, String> params) {
		BoardFileVO fboardfileitemInfo = null;
		try {
			fboardfileitemInfo = dao.fboardfileitemInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fboardfileitemInfo;
	}

}
