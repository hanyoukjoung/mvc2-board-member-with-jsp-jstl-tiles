package kr.or.ddit.qna.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QBoardVO;


public interface QNABoardService {
	public List<QBoardVO> qboardList(Map<String, String> params);
	public QBoardVO qboardInfo(Map<String, String> params);
	public String totalCount(Map<String, String> params);
	public void insertBoardInfo(QBoardVO boardInfo);
	public void updateQBoardInfo(QBoardVO qboardInfo);
	public void deleteQBoardInfo(Map<String, String> params);
	public void insertQBoardReply(QBoardVO qboardInfo);
	public String qboardgroupInfo(QBoardVO qboardInfo);
	
	
}
