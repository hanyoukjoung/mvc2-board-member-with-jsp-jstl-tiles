package kr.or.ddit.user.join.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.base.action.IAction;

public class LogoutActionAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("LOGIN_MEMBERINFO");
		
		return "/user/freeboard/freeboardList.do?message=" + URLEncoder.encode("정상적으로 로그아웃 되었습니다.");
	}

}
