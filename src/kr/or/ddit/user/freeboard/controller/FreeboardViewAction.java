package kr.or.ddit.user.freeboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.free.board.dao.IFreeBoardDaoImpl;
import kr.or.ddit.free.board.service.IFreeBoardService;
import kr.or.ddit.free.board.service.IFreeBoardServiceImpl;
import kr.or.ddit.vo.FBoardVO;

public class FreeboardViewAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		String bo_no = request.getParameter("bo_no");
		
		Map<String, String> params = new HashMap<String,String>();
		params.put("bo_no", bo_no);
		
		IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
		FBoardVO freeboardInfo = service.freeboardInfo(params);
		
		request.setAttribute("freeboardInfo", freeboardInfo);
		
		return "/user/freeboard/freeboardView.tiles";
	}

}
