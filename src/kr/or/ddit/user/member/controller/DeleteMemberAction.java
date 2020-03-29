package kr.or.ddit.user.member.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class DeleteMemberAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		IMemberService service = IMemberServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", ((MemberVO)request.getSession().getAttribute("LOGIN_MEMBERINFO")).getMem_id());
		
		if(service.deleteMember(params) > 0){
			request.getSession().removeAttribute("LOGIN_MEMBERINFO");
			return "/user/freeboard/freeboardList.do?message=" + URLEncoder.encode("회원 탈퇴처리 되었습니다.");
		} else {
			return "/user/freeboard/freeboardList.do?message=" + URLEncoder.encode("회원 탈퇴에 실패하였습니다. 증상이 계속되면 고객센터에 문의 해 주세요.");
		}
	}
}
