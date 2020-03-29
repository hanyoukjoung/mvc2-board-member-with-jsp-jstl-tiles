package kr.or.ddit.file.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.file.dao.BoardFileDao;
import kr.or.ddit.file.dao.BoardFileDaoImpl;
import kr.or.ddit.vo.BoardFileVO;

public class BoardFileServiceImpl implements BoardFileService{
	
	private static BoardFileService service = new BoardFileServiceImpl();
	private static BoardFileDao dao = BoardFileDaoImpl.getInstance();
	private BoardFileServiceImpl(){}
	
	public static BoardFileService getInstance(){
		return (service == null) ? service = new BoardFileServiceImpl() : service;
	}

	@Override
	public BoardFileVO rFileBoardInfo(Map<String, String> params) {
		BoardFileVO fileBoardInfo = null;
		try {
			fileBoardInfo = dao.rFileBoardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fileBoardInfo;
	}


}
