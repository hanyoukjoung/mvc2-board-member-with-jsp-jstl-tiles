package kr.or.ddit.free.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDao;
import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDaoImpl;
import kr.or.ddit.free.board.dao.IFreeBoardDao;
import kr.or.ddit.free.board.dao.IFreeBoardDaoImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.FBoardVO;

public class IFreeBoardServiceImpl implements IFreeBoardService{
	
	private static IFreeBoardService service = new IFreeBoardServiceImpl();
	private static IFreeBoardDao dao;
	private static IFreeBoardFileDao filedao;
	private IFreeBoardServiceImpl(){
		dao= IFreeBoardDaoImpl.getInstance();
		filedao = IFreeBoardFileDaoImpl.getInstance();
		
	}
	
	public static IFreeBoardService getInstance(){
		return (service == null) ? service = new IFreeBoardServiceImpl() : service;
	}

	@Override
	public List<FBoardVO> freeboardList(Map<String, String> params) {
		List<FBoardVO> freeboardList =null;
		try {
			freeboardList =dao.freeboardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public FBoardVO freeboardInfo(Map<String, String> params) {
		FBoardVO freeboardInfo=null;
		try {
			freeboardInfo = dao.freeboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeboardInfo;
	}

	@Override
	public void updatefreeboard(FBoardVO freeboardInfo) {
		try {
			dao.updatefreeboard(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deletefreeboard(Map<String, String> params) {
		try {
			dao.deletefreeboard(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertFreeboard(FBoardVO freeboardInfo,FileItem[] items) {
		try {
			String bo_no = dao.insertFreeboard(freeboardInfo);
			
			List<BoardFileVO> fileItemList = AttachFileMapper.mapper(items, bo_no);
			filedao.insertFboardFile(fileItemList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
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
	public void insertFboardReply(FBoardVO freeboardInfo) {
		try {
			dao.insertFboardReply(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
