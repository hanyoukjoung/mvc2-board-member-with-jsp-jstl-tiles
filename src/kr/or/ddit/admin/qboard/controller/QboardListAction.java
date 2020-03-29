package kr.or.ddit.admin.qboard.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.base.action.IAction;
import kr.or.ddit.qna.board.service.QNABoardService;
import kr.or.ddit.qna.board.service.QNABoardServiceImpl;
import kr.or.ddit.utiles.RolePageingUtile;
import kr.or.ddit.vo.QBoardVO;

public class QboardListAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String currentPage = request.getParameter("currentPage");
		if (currentPage == null) {
			currentPage = "1";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		
		String search_keyword = request.getParameter("search_keyword");
		String search_keycode = request.getParameter("search_keycode");

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		QNABoardService service = QNABoardServiceImpl.getInstance();
		String totalCount = service.totalCount(params);

		RolePageingUtile pagingUtil = new RolePageingUtile(request,Integer.parseInt(totalCount), Integer.parseInt(currentPage));

		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());

		params.put("startCount", startCount);
		params.put("endCount", endCount);

		List<QBoardVO> qboardList = service.qboardList(params);
		
			
		request.setAttribute("qboardList",qboardList);
		request.setAttribute("paginationHtmls", pagingUtil.getPagingHtmls());
		
		return "/admin/qboard/qboardList.tiles";
	}
}
