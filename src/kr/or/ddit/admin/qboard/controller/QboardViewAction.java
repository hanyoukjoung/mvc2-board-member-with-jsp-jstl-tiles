package kr.or.ddit.admin.qboard.controller;

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
		String bo_group = request.getParameter("bo_group");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		params.put("bo_group", bo_group);
		
		QNABoardService service = QNABoardServiceImpl.getInstance(); 
		QBoardVO qboardInfo = service.qboardInfo(params);
		String groupCount = service.qboardgroupInfo(qboardInfo);
		
		request.setAttribute("groupCount", groupCount);
		request.setAttribute("qboardInfo", qboardInfo);
		
		return "/admin/qboard/qboardView.tiles";
	}

}
