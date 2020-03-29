package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.MemberVO;


public interface IMemberService {
	public MemberVO memberInfo(Map<String, String> params);
	public int updateMember(MemberVO memberInfo);
	public int deleteMember(Map<String, String> params);
	public int insertMember(MemberVO memberInfo);
	public int idCheck(Map<String, String> params);
	public List<MemberVO> memberListForAdmin(Map<String, String> params);
	public int updateMemberForAdmin(MemberVO memberInfo);
}
