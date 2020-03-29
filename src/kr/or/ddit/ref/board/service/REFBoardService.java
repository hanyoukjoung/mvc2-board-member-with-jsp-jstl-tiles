package kr.or.ddit.ref.board.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.RBoardVO;

public interface REFBoardService {
	public List<RBoardVO> rboardList(Map<String, String> params);
	public RBoardVO rboardInfo(Map<String, String> params);
	public String totalCount(Map<String, String> params);
	public void insertBoardInfo(RBoardVO boardInfo, FileItem[] items);
	public void insertRBoardInfoReply(RBoardVO rboardInfoReply);
	public void updateRBoardInfo(RBoardVO rboardInfo);
	public void deleteRBoardInfo(Map<String, String> params);
}
