package kr.or.ddit.ntc.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FBoardVO;
import kr.or.ddit.vo.NBoardVO;

public interface NtcBoardService {
	public List<NBoardVO> nboardList(Map<String, String> params);
	public NBoardVO nfreeboardInfo(Map<String, String> params);
	public String totalCount(Map<String, String> params);
	public void updatenboard(NBoardVO freeboardInfo) ;
	public void deletenboard(Map<String, String> params);
	public void insertnboard(NBoardVO freeboardInfo,FileItem[] itemes);
}
