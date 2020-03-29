package kr.or.ddit.file.nboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardFileVO;

public class nBoardFileDaoImpl implements nBoardFileDao {
	private static nBoardFileDao dao = new nBoardFileDaoImpl();
	private SqlMapClient client;
	
	private nBoardFileDaoImpl(){
		client= SqlMapClientFactory.getSqlMapClient();
	}
	
	public static nBoardFileDao getInstance(){
		return (dao==null)? dao= new nBoardFileDaoImpl():dao;
		
	}

	@Override
	public void insertNboardFile(List<BoardFileVO> nboardItemList)
			throws SQLException {
		try {
			client.startTransaction();
			
			for(BoardFileVO fileItemInfo:nboardItemList ){
				client.insert("nboardfile.insertNboardItem", fileItemInfo);
			}
			client.commitTransaction();
			
		} finally {
			client.endTransaction();
		}

	}

	@Override
	public BoardFileVO nboardfileitemInfo(Map<String, String> params)
			throws SQLException {
		
		return (BoardFileVO) client.queryForObject("nboardfile.nboardItemInfo", params);
	}

}
