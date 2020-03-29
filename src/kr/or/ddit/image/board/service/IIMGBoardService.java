package kr.or.ddit.image.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IBoardVO;


public interface IIMGBoardService {
	public String totalCount(Map<String, String> params);

	public List<IBoardVO> boardList(Map<String, String> params);

	public IBoardVO boardInfo(Map<String, String> params);

	public int insertBoard(IBoardVO boardInfo);

	public int updateBoard(IBoardVO boardInfo);

	public void deleteBoard(Map<String, String> params);

	public int updateBoardForAdmin(IBoardVO boardInfo);
}
