package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.file.member.dao.IMemberFileDao;
import kr.or.ddit.file.member.dao.IMemberFileDaoImpl;
import kr.or.ddit.file.member.service.IMemberFileService;
import kr.or.ddit.file.member.service.IMemberFileServiceImpl;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.IMemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class IMemberServiceImpl implements IMemberService{
	
	private static IMemberService service = new IMemberServiceImpl();
	private static IMemberDao dao = IMemberDaoImpl.getInstance();
	private static IMemberFileService fileService = IMemberFileServiceImpl.getInstance();
	private IMemberServiceImpl(){}
	
	public static IMemberService getInstance(){
		return (service == null) ? service = new IMemberServiceImpl() : service;
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.memberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public int updateMember(MemberVO memberInfo) {
		int result = -1;
		try {
			result = dao.updateMember(memberInfo);
			if(memberInfo.getItems() != null){
				fileService.insertMemberFile(memberInfo.getItems());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteMember(Map<String, String> params) {
		int result = -1;
		try {
			result = dao.deleteMember(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertMember(MemberVO memberInfo) {
		try {
			dao.insertMember(memberInfo);
			fileService.insertMemberFile(memberInfo.getItems());
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int idCheck(Map<String, String> params) {
		int result = -1;
		try {
			result = dao.idCheck(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MemberVO> memberListForAdmin(Map<String, String> params) {
		List<MemberVO> memberList = null;
		try {
			memberList = dao.memberListForAdmin(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public int updateMemberForAdmin(MemberVO memberInfo) {
		int result = -1;
		try {
			result = dao.updateMemberForAdmin(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
