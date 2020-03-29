package kr.or.ddit.admin.nboard.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.zipcode.service.IZipcodeService;
import kr.or.ddit.zipcode.service.IZipcodeServiceImpl;

public class MemberViewAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		IMemberService service = IMemberServiceImpl.getInstance();
		IZipcodeService zipcodeService = IZipcodeServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", request.getParameter("mem_id"));
		
		MemberVO memberInfo = service.memberInfo(params);
		
		request.setAttribute("memberInfo", memberInfo);
		
		return "/admin/member/memberView.tiles";
	}
}
