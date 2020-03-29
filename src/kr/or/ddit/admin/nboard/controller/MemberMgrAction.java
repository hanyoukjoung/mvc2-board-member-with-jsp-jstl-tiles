package kr.or.ddit.admin.nboard.controller;

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

public class MemberMgrAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		IZipcodeService zipcodeService = IZipcodeServiceImpl.getInstance();
		IMemberService memberService = IMemberServiceImpl.getInstance();
		
		List<String> sidoList = zipcodeService.sidoList();
		
		request.setAttribute("sidoList", sidoList);
		
		
		Map<String, String> params = new HashMap<>();
		
		params.put("search_base_keycode", request.getParameter("search_base_keycode"));
		params.put("search_base_keyword", request.getParameter("search_base_keyword"));
		params.put("search_sido", request.getParameter("search_sido"));
		params.put("search_gugun", request.getParameter("search_gugun"));
		params.put("mem_hp1", request.getParameter("mem_hp1"));
		params.put("mem_hp2", request.getParameter("mem_hp2"));
		params.put("mem_hp3", request.getParameter("mem_hp3"));
		params.put("mem_bir", request.getParameter("mem_bir"));
		
		List<MemberVO> memberList = memberService.memberListForAdmin(params);
		
		request.setAttribute("memberList", memberList);
		
		return "/admin/member/memberMgr.tiles";
	}

}
