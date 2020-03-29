package kr.or.ddit.file.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;


public class BoardFileDaoImpl implements BoardFileDao {
	private static BoardFileDao dao = new BoardFileDaoImpl();
	private SqlMapClient client;
	
	public static BoardFileDao getInstance(){
		return (dao == null) ? dao = new BoardFileDaoImpl() : dao ;
	}
	
	private BoardFileDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public void rInsertBoardFile(List<BoardFileVO> rFileList) throws SQLException {
		try{
			client.startTransaction();
			
			for(BoardFileVO rFileInfo : rFileList){
				client.insert("rboardfile.insertRFile", rFileInfo);
			}
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

	@Override
	public BoardFileVO rFileBoardInfo(Map<String, String> params) throws SQLException {
		return (BoardFileVO) client.queryForObject("rboardfile.fileRInfo", params);
	}		
	
}
