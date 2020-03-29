package kr.or.ddit.admin.freeboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.free.board.service.IFreeBoardService;
import kr.or.ddit.free.board.service.IFreeBoardServiceImpl;

public class DeleteFreeboardAction implements IAction {
	private boolean isRedirect = false;

	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		this.isRedirect =true;
		String bo_no = request.getParameter("bo_no");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
		service.deletefreeboard(params);
		
		return "/admin/freeboard/freeBoardList.do";
	}

}
