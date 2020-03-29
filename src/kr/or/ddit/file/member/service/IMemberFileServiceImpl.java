package kr.or.ddit.file.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDao;
import kr.or.ddit.file.freeboard.dao.IFreeBoardFileDaoImpl;
import kr.or.ddit.file.member.dao.IMemberFileDao;
import kr.or.ddit.file.member.dao.IMemberFileDaoImpl;
import kr.or.ddit.vo.BoardFileVO;

public class IMemberFileServiceImpl implements IMemberFileService {
	private static IMemberFileService service = new IMemberFileServiceImpl();
	private IMemberFileDao dao;
	
	private IMemberFileServiceImpl(){
		dao = IMemberFileDaoImpl.getInstance();
	}
	
	public static IMemberFileService getInstance(){
		return (service == null) ? service = new IMemberFileServiceImpl() : service;
	}

	@Override
	public void insertMemberFile(List<BoardFileVO> fileItems) {
		try {
			for(BoardFileVO fileItem : fileItems) {
					dao.insertMemberFile(fileItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public BoardFileVO memberFileInfo(Map<String, String> params) {
		try {
			return dao.memberFileInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
