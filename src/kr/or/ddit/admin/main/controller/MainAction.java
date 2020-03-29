package kr.or.ddit.admin.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;

public class MainAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		this.isRedirect =true;
		return "";
	}

}
