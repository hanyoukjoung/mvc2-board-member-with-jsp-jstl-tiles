package kr.or.ddit.file.iboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface IIMGBoardFileService {

	public void insertBoardFile(List<BoardFileVO> boardFileList);

	public BoardFileVO iboardFileInfo(Map<String, String> params);
	public BoardFileVO iboardFileInfoForThumb(Map<String, String> params);


}
