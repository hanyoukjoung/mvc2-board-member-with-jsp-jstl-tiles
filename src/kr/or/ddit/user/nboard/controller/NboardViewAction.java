package kr.or.ddit.user.nboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.ntc.board.dao.NTCBoardDaoImpl;
import kr.or.ddit.ntc.board.service.NtcBoardService;
import kr.or.ddit.ntc.board.service.NtcBoardServiceImpl;
import kr.or.ddit.vo.NBoardVO;

public class NboardViewAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		String bo_no = request.getParameter("bo_no");

		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		NtcBoardService service = NtcBoardServiceImpl.getInstance();
		NBoardVO nboardInfo = service.nfreeboardInfo(params);
		
		request.setAttribute("nboardInfo", nboardInfo);
		
		return "/user/nboard/nboardView.tiles";
	}

}
