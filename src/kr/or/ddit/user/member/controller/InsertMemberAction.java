package kr.or.ddit.user.member.controller;

import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.MemberVO;

public class InsertMemberAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;
		
		MemberVO memberInfo = new MemberVO();
		
		try {
			BeanUtils.populate(memberInfo, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		FileItem[] fileItems = wrapper.getFileItemValues("file");
		
		List<BoardFileVO> items = AttachFileMapper.mapper(fileItems, memberInfo.getMem_id());
		
		memberInfo.setItems(items);
		
		IMemberService service = IMemberServiceImpl.getInstance();

		String message = URLEncoder.encode("회원가입에 실패하였습니다. 고객센터에 문의 해 주세요.");
		
		if( service.insertMember(memberInfo) == 0 ){
			message = URLEncoder.encode("축하합니다 ! 회원가입에 성공하였습니다. 앞으로 " + memberInfo.getMem_id() + "으로 로그인 가능합니다.");
		}
		
		
		
		return "/user/freeboard/freeboardList.tiles?message=" + message;
	}

}
