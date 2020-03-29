package kr.or.ddit.admin.nboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class UpdateMemberAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		MemberVO memberInfo = new MemberVO();
		
		try {
			BeanUtils.populate(memberInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		String message = URLEncoder.encode("회원정보 수정에 실패하였습니다.");
		if(service.updateMemberForAdmin(memberInfo) > 0){
			message = URLEncoder.encode("회원정보 수정을 성공하였습니다.");
		}
		
		return "/admin/member/memberMgr.do?message=" + message;
	}

}
