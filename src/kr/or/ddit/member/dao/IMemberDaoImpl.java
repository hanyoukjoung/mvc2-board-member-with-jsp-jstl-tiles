package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

import com.ibatis.sqlmap.client.SqlMapClient;


public class IMemberDaoImpl implements IMemberDao {
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	public static IMemberDao getInstance(){
		return (dao == null) ? dao = new IMemberDaoImpl() : dao ;
	}
	
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		MemberVO memberInfo = (MemberVO) client.queryForObject("member.memberInfo", params);
		return memberInfo;
	}

	@Override
	public int updateMember(MemberVO memberInfo) throws SQLException {
		return client.update("member.updateMember", memberInfo);
	}

	@Override
	public int deleteMember(Map<String, String> params) throws SQLException {
		return client.update("member.deleteMember", params);
	}

	@Override
	public void insertMember(MemberVO memberInfo) throws SQLException {
		client.insert("member.insertMember", memberInfo);
	}

	@Override
	public int idCheck(Map<String, String> params) throws SQLException {
		return (int)client.queryForObject("member.idCheck", params);
	}

	@Override
	public List<MemberVO> memberListForAdmin(Map<String, String> params)
			throws SQLException {
		System.out.println(params.toString());
		return client.queryForList("member.memberListForAdmin", params);
	}

	@Override
	public int updateMemberForAdmin(MemberVO memberInfo) throws SQLException {
		return client.update("member.updateMemberForAdmin", memberInfo);
	}
}
