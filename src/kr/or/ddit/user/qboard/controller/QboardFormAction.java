package kr.or.ddit.user.qboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;

public class QboardFormAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		return "/user/qboard/qboardForm.tiles";
	
	}

}
