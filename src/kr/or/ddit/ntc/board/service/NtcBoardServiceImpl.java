package kr.or.ddit.ntc.board.service;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.file.nboard.dao.nBoardFileDao;
import kr.or.ddit.file.nboard.dao.nBoardFileDaoImpl;
import kr.or.ddit.ntc.board.dao.NTCBoardDao;
import kr.or.ddit.ntc.board.dao.NTCBoardDaoImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.FBoardVO;
import kr.or.ddit.vo.NBoardVO;


public class NtcBoardServiceImpl implements NtcBoardService {
	private static NtcBoardService service = new NtcBoardServiceImpl();
	private static NTCBoardDao dao;
	private static nBoardFileDao filedao;
	private NtcBoardServiceImpl(){
		dao = NTCBoardDaoImpl.getInstance();
		filedao = nBoardFileDaoImpl.getInstance();
		
	}
	
	public static NtcBoardService getInstance(){
		return (service == null) ? service = new NtcBoardServiceImpl() : service;
	}

	@Override
	public List<NBoardVO> nboardList(Map<String, String> params) {
		List<NBoardVO> nboardList = null;
		try {
			nboardList=dao.nboardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nboardList;
	}

	@Override
	public NBoardVO nfreeboardInfo(Map<String, String> params) {
		NBoardVO nboardInfo = null;
		try {
			nboardInfo= dao.nfreeboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nboardInfo;
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
	public void updatenboard(NBoardVO freeboardInfo) {
		try {
			dao.updatenboard(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deletenboard(Map<String, String> params) {
		try {
			dao.deletenboard(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertnboard(NBoardVO freeboardInfo,FileItem[] items) {
		try {
			String bo_no=dao.insertnboard(freeboardInfo);
			
			List<BoardFileVO> fileItemList = AttachFileMapper.mapper(items, bo_no);
			filedao.insertNboardFile(fileItemList);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
