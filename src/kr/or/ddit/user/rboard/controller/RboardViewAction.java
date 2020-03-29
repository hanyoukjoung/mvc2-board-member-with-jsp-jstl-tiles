package kr.or.ddit.user.rboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.ref.board.service.REFBoardService;
import kr.or.ddit.ref.board.service.REFBoardServiceImpl;
import kr.or.ddit.vo.RBoardVO;


public class RboardViewAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		String bo_no = request.getParameter("bo_no");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		REFBoardService service = REFBoardServiceImpl.getInstance(); 
		RBoardVO rboardInfo = service.rboardInfo(params);
		
		request.setAttribute("rboardInfo", rboardInfo);
		
		return "/user/rboard/rboardView.tiles";
	}

}
