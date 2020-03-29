package kr.or.ddit.admin.qboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import kr.or.ddit.base.action.IAction;



public class QboardReplyFormAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		return "/admin/qboard/qboardReplyForm.tiles";
	}
}
