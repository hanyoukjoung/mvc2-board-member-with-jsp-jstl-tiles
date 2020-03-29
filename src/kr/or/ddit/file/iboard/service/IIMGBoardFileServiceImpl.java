package kr.or.ddit.file.iboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDao;
import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDaoImpl;
import kr.or.ddit.file.iboard.dao.IIMGBoardFileDao;
import kr.or.ddit.file.iboard.dao.IIMGBoardFileDaoImpl;
import kr.or.ddit.vo.BoardFileVO;

public class IIMGBoardFileServiceImpl implements IIMGBoardFileService {
	private static IIMGBoardFileService service = new IIMGBoardFileServiceImpl();
	private IIMGBoardFileDao dao;
	
	private IIMGBoardFileServiceImpl(){
		dao = IIMGBoardFileDaoImpl.getInstance();
	}
	
	public static IIMGBoardFileService getInstance(){
		return (service == null) ? service = new IIMGBoardFileServiceImpl() : service;
	}

	@Override
	public void insertBoardFile(List<BoardFileVO> boardFileList) {
		try {
			dao.insertBoardFile(boardFileList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public BoardFileVO iboardFileInfo(Map<String, String> params) {
		BoardFileVO fileInfo = null;
		try {
			fileInfo = dao.iboardFileInfo(params);
		} catch (SQLException e) {
		}
		return fileInfo;
	}

	@Override
	public BoardFileVO iboardFileInfoForThumb(Map<String, String> params) {
		BoardFileVO fileInfo = null;
		try {
			fileInfo = dao.iboardFileInfoForThumb(params);
		} catch (SQLException e) {
		}
		return fileInfo;
	}

}
