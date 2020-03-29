package kr.or.ddit.file.iboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardFileVO;

public class IIMGBoardFileDaoImpl implements IIMGBoardFileDao {
	private static IIMGBoardFileDao dao = new IIMGBoardFileDaoImpl();
	private SqlMapClient client;
	
	private IIMGBoardFileDaoImpl(){
		client= SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IIMGBoardFileDao getInstance(){
		return (dao==null)? dao= new IIMGBoardFileDaoImpl():dao;
		
	}

	@Override
	public void insertBoardFile(List<BoardFileVO> boardFileList)
			throws SQLException {
		try {
			client.startTransaction();
			
			for(BoardFileVO fileItemInfo : boardFileList ){
				client.insert("iboardfile.insertIboardItem", fileItemInfo);
			}
			client.commitTransaction();
			
		} finally {
			client.endTransaction();
		}

	}

	@Override
	public BoardFileVO iboardFileInfo(Map<String, String> params)
			throws SQLException {
		
		return (BoardFileVO) client.queryForObject("iboardfile.iboardItemInfo", params);
	}

	@Override
	public BoardFileVO iboardFileInfoForThumb(Map<String, String> params)
			throws SQLException {
		return (BoardFileVO) client.queryForObject("iboardfile.iboardItemInfoForThumb", params);
	}
}
