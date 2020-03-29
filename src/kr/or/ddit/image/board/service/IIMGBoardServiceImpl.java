package kr.or.ddit.image.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.file.dao.BoardFileDao;
import kr.or.ddit.file.dao.BoardFileDaoImpl;
import kr.or.ddit.file.iboard.service.IIMGBoardFileService;
import kr.or.ddit.file.iboard.service.IIMGBoardFileServiceImpl;
import kr.or.ddit.image.board.dao.IIMGBoardDao;
import kr.or.ddit.image.board.dao.IIMGBoardDaoImpl;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.IBoardVO;

public class IIMGBoardServiceImpl implements IIMGBoardService{
	
	private static IIMGBoardService service = new IIMGBoardServiceImpl();
	private static IIMGBoardDao dao = IIMGBoardDaoImpl.getInstance();
	private static IIMGBoardFileService fileService = IIMGBoardFileServiceImpl.getInstance();
	
	private IIMGBoardServiceImpl(){}
	
	public static IIMGBoardService getInstance(){
		return (service == null) ? service = new IIMGBoardServiceImpl() : service;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public List<IBoardVO> boardList(Map<String, String> params) {
		List<IBoardVO> boardList = null;
		try {
			boardList = dao.boardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public IBoardVO boardInfo(Map<String, String> params) {
		IBoardVO boardInfo = null;
		
		try {
			boardInfo = dao.boardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardInfo;
	}

	@Override
	public int insertBoard(IBoardVO boardInfo) {
		try {
			String bo_no = dao.insertBoard(boardInfo);
			boardInfo.setBo_no(bo_no);
			for(BoardFileVO fileInfo : boardInfo.getItems()) {
				fileInfo.setBo_no(bo_no);
			}
			fileService.insertBoardFile(boardInfo.getItems());
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int updateBoard(IBoardVO boardInfo) {
		try {
			dao.updateBoard(boardInfo);
			if(boardInfo.getItems().size() > 0) {
				fileService.insertBoardFile(boardInfo.getItems());
			}
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public void deleteBoard(Map<String, String> params) {
		try {
			dao.deleteBoard(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int updateBoardForAdmin(IBoardVO boardInfo) {
		try {
			dao.updateBoardForAdmin(boardInfo);
			if(boardInfo.getItems().size() > 0) {
				fileService.insertBoardFile(boardInfo.getItems());
			}
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
}
