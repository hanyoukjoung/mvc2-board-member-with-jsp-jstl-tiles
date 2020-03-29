package kr.or.ddit.file.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardFileVO;

public interface IMemberFileService {
	public void insertMemberFile(List<BoardFileVO> fileItems);
	public BoardFileVO memberFileInfo(Map<String, String> params);
}
