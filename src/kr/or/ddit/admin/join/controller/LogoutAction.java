package kr.or.ddit.admin.join.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;

public class LogoutAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("LOGIN_ADMININFO");
		return "/admin/main.do?message=" + URLEncoder.encode("로그아웃 되었습니다.");
	}

}
