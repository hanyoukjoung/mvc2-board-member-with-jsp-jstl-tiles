package kr.or.ddit.user.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberViewAction implements IAction {

	private boolean isRedirect = false;
	
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", ((MemberVO)session.getAttribute("LOGIN_MEMBERINFO")).getMem_id());
		
		IMemberService service = IMemberServiceImpl.getInstance();

		MemberVO memberInfo = service.memberInfo(params);
		
		request.setAttribute("memberInfo", memberInfo);
		
		return "/user/member/memberView.tiles";
	}
}
