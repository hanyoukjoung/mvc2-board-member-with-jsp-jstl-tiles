package kr.or.ddit.file.nboard.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDao;
import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDaoImpl;
import kr.or.ddit.file.nboard.dao.nBoardFileDao;
import kr.or.ddit.file.nboard.dao.nBoardFileDaoImpl;
import kr.or.ddit.vo.BoardFileVO;

public class nBoardFileServiceImpl implements nBoardFileService {
	private static nBoardFileService service = new nBoardFileServiceImpl();
	private nBoardFileDao dao;
	
	private nBoardFileServiceImpl(){
		dao = nBoardFileDaoImpl.getInstance();
	}
	
	public static nBoardFileService getInstance(){
		return (service == null) ? service = new nBoardFileServiceImpl() : service;
	}
	
	@Override
	public BoardFileVO nboardfileitemInfo(Map<String, String> params) {
		BoardFileVO nboardfileitemInfo = null;
		try {
			nboardfileitemInfo = dao.nboardfileitemInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nboardfileitemInfo;
	}

}
