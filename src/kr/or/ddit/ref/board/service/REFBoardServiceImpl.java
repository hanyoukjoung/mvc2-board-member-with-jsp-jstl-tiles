package kr.or.ddit.ref.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.file.dao.BoardFileDao;
import kr.or.ddit.file.dao.BoardFileDaoImpl;
import kr.or.ddit.ref.board.dao.REFBoardDao;
import kr.or.ddit.ref.board.dao.REFBoardDaoImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.RBoardVO;



public class REFBoardServiceImpl implements REFBoardService {
	private static REFBoardService service = new REFBoardServiceImpl();
	private static REFBoardDao dao = REFBoardDaoImpl.getInstance();
	private static BoardFileDao fileDao;
	
	private REFBoardServiceImpl(){
		
		dao= REFBoardDaoImpl.getInstance();
		fileDao= BoardFileDaoImpl.getInstance();
	}
	
	public static REFBoardService getInstance(){
		return (service == null) ? service = new REFBoardServiceImpl() : service;
	}

	@Override
	public List<RBoardVO> rboardList(Map<String, String> params) {
		List<RBoardVO> boardList=null;
		try {
			boardList = dao.rboardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = "0";
		try {
			totalCount = dao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public void insertBoardInfo(RBoardVO boardInfo, FileItem[] items) {
		try {
			String bo_no = dao.insertBoardInfo(boardInfo);
			List<BoardFileVO> FileList = AttachFileMapper.mapper(items, bo_no);
			fileDao.rInsertBoardFile(FileList);
		} catch (SQLException e) {
			e.printStackTrace();
		} 		
	}

	@Override
	public RBoardVO rboardInfo(Map<String, String> params) {
		RBoardVO rboardInfo = null;
		try {
			rboardInfo = dao.rboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rboardInfo;
	}

	@Override
	public void insertRBoardInfoReply(RBoardVO rboardInfoReply) {
		try {
			dao.insertRBoardInfoReply(rboardInfoReply);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRBoardInfo(RBoardVO rboardInfo) {
		try {
			dao.updateRBoardInfo(rboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRBoardInfo(Map<String, String> params) {
		try {
			dao.deleteRBoardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
