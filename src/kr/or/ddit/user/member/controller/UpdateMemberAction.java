package kr.or.ddit.user.member.controller;

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

public class UpdateMemberAction implements IAction{

	private boolean isRedirect = true; 
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String returnURL = "/user/member/memberView.do?message=" + URLEncoder.encode("회원정보 수정에 실패하였습니다. 증상이 지속되면 고객센터에 문의해 주세요.");
		
		FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper)request;
		
		FileItem[] fileItems = wrapper.getFileItemValues("file");
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			IMemberService service = IMemberServiceImpl.getInstance();
			
			MemberVO memberInfo = new MemberVO();
			
			BeanUtils.populate(memberInfo, request.getParameterMap());
			
			memberInfo.setItems(AttachFileMapper.mapper(fileItems, memberInfo.getMem_id()));
			
			if(service.updateMember(memberInfo) > 0) {
				returnURL = "/user/member/memberView.do?message=" + URLEncoder.encode("회원정보 수정에 성공하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnURL;
	}
}
