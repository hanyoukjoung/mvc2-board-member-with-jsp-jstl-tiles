package kr.or.ddit.file.freeboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardFileVO;

public class IFreeBoardFileDaoImpl implements IFreeBoardFileDao {
	private static IFreeBoardFileDao dao = new IFreeBoardFileDaoImpl();
	private SqlMapClient client;
	
	private IFreeBoardFileDaoImpl(){
		client= SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeBoardFileDao getInstance(){
		return (dao==null)? dao= new IFreeBoardFileDaoImpl():dao;
		
	}

	@Override
	public void insertFboardFile(List<BoardFileVO> fboardItemList)
			throws SQLException {
		try {
			client.startTransaction();
			
			for(BoardFileVO fileItemInfo:fboardItemList ){
				client.insert("fboardfile.insertFboardItem", fileItemInfo);
			}
			client.commitTransaction();
			
		} finally {
			client.endTransaction();
		}

	}

	@Override
	public BoardFileVO fboardfileitemInfo(Map<String, String> params)
			throws SQLException {
		
		return (BoardFileVO) client.queryForObject("fboardfile.fboardItemInfo", params);
	}

}
