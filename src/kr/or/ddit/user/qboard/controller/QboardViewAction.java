package kr.or.ddit.user.qboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.qna.board.service.QNABoardService;
import kr.or.ddit.qna.board.service.QNABoardServiceImpl;
import kr.or.ddit.vo.QBoardVO;


public class QboardViewAction implements IAction {
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
		
		QNABoardService service = QNABoardServiceImpl.getInstance(); 
		QBoardVO qboardInfo = service.qboardInfo(params);
		
		request.setAttribute("qboardInfo", qboardInfo);
		
		return "/user/qboard/qboardView.tiles";
	}

}
