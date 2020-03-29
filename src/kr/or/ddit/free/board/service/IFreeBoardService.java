package kr.or.ddit.free.board.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FBoardVO;


public interface IFreeBoardService {
	public List<FBoardVO> freeboardList(Map<String, String> params);
	public FBoardVO freeboardInfo(Map<String, String> params);
	public void updatefreeboard(FBoardVO freeboardInfo);
	public void deletefreeboard(Map<String, String> params);
	public void insertFreeboard(FBoardVO freeboardInfo,FileItem[] items);
	public void insertFboardReply(FBoardVO freeboardInfo);
	public String totalCount(Map<String, String> params);
}
