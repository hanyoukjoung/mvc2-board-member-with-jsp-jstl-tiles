package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {
	public MemberVO memberInfo(Map<String, String> params) throws SQLException;
	public int updateMember(MemberVO memberInfo) throws SQLException;
	public int deleteMember(Map<String, String> params) throws SQLException;
	public void insertMember(MemberVO memberInfo) throws SQLException;
	public int idCheck(Map<String, String> params) throws SQLException;
	public List<MemberVO> memberListForAdmin(Map<String, String> params) throws SQLException;
	public int updateMemberForAdmin(MemberVO memberInfo) throws SQLException;
}
