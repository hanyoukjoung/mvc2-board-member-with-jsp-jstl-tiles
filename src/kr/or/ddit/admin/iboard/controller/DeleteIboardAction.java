package kr.or.ddit.admin.iboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.image.board.service.IIMGBoardService;
import kr.or.ddit.image.board.service.IIMGBoardServiceImpl;

public class DeleteIboardAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		IIMGBoardService service = IIMGBoardServiceImpl.getInstance();
				
		String bo_no = request.getParameter("bo_no");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		service.deleteBoard(params);
		
		return "/admin/iboard/iboardList.do?message=" + URLEncoder.encode("삭제되었습니다.");
	}
}
