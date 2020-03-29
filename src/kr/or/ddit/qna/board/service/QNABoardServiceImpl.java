package kr.or.ddit.qna.board.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.qna.board.dao.QNABoardDao;
import kr.or.ddit.qna.board.dao.QNABoardDaoImpl;
import kr.or.ddit.vo.QBoardVO;

public class QNABoardServiceImpl implements QNABoardService {
	private static QNABoardService service = new QNABoardServiceImpl();
	private static QNABoardDao dao = QNABoardDaoImpl.getInstance();
	private QNABoardServiceImpl(){}
	
	public static QNABoardService getInstance(){
		return (service == null) ? service = new QNABoardServiceImpl() : service;
	}

	@Override
	public QBoardVO qboardInfo(Map<String, String> params) {
		QBoardVO boardInfo=null;
		try {
			boardInfo = dao.qboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardInfo;
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
	public void insertBoardInfo(QBoardVO boardInfo) {
		try {
			dao.insertBoardInfo(boardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateQBoardInfo(QBoardVO qboardInfo) {
		try {
			dao.updateQBoardInfo(qboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteQBoardInfo(Map<String, String> params) {
		try {
			dao.deleteQBoardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<QBoardVO> qboardList(Map<String, String> params) {
		List<QBoardVO> boardList = null;
		try {
			boardList = dao.qboardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}

	@Override
	public void insertQBoardReply(QBoardVO qboardInfo) {
		try {
			dao.insertQBoardReply(qboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	   @Override
	   public String qboardgroupInfo(QBoardVO qboardInfo) {
	      String bboardCount="0";
	      try {
	         bboardCount=dao.qboardgroupInfo(qboardInfo);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return bboardCount;
	   }
	
}
