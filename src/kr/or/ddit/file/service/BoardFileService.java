package kr.or.ddit.file.service;

import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;


public interface BoardFileService {
	public BoardFileVO rFileBoardInfo (Map<String, String> params);
}
