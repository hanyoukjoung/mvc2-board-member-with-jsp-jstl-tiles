package kr.or.ddit.admin.iboard.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.image.board.service.IIMGBoardService;
import kr.or.ddit.image.board.service.IIMGBoardServiceImpl;
import kr.or.ddit.vo.IBoardVO;

public class IboardViewAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String bo_no = request.getParameter("bo_no");
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("bo_no", bo_no);
		
		IIMGBoardService service = IIMGBoardServiceImpl.getInstance();
		
		IBoardVO boardInfo = service.boardInfo(params);
		
		request.setAttribute("boardInfo", boardInfo);
		
		return "/admin/iboard/iboardView.tiles";
	}

}
