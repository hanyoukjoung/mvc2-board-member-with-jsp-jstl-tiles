package kr.or.ddit.user.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;

public class LoginCheckAction implements IAction {

	private boolean isRedirect;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		return "/WEB-INF/views/user/join/loginCheck.jsp";
	}
}
