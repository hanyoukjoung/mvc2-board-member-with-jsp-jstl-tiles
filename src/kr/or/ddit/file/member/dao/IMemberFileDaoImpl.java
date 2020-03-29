package kr.or.ddit.file.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardFileVO;

public class IMemberFileDaoImpl implements IMemberFileDao {
	private static IMemberFileDao dao = new IMemberFileDaoImpl();
	private SqlMapClient client;
	
	private IMemberFileDaoImpl(){
		client= SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberFileDao getInstance(){
		return (dao==null)? dao= new IMemberFileDaoImpl():dao;
		
	}

	@Override
	public void insertMemberFile(BoardFileVO fileItem) throws SQLException {
		client.insert("memberFile.insertMemberFile", fileItem);
	}

	@Override
	public BoardFileVO memberFileInfo(Map<String, String> params) throws SQLException{
		return (BoardFileVO)client.queryForObject("memberFile.memberFileInfo", params);
	}

}
