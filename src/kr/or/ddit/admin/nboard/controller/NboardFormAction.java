package kr.or.ddit.admin.nboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;

public class NboardFormAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "/admin/nboard/nboardForm.tiles";
	}

}
