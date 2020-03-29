package kr.or.ddit.admin.iboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.image.board.service.IIMGBoardService;
import kr.or.ddit.image.board.service.IIMGBoardServiceImpl;
import kr.or.ddit.utiles.RolePageingUtile;
import kr.or.ddit.vo.IBoardVO;

public class IboardListAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		IIMGBoardService service = IIMGBoardServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keycode", request.getParameter("search_keycode"));
		params.put("search_keyword", request.getParameter("search_keyword"));
		
		
		String totalCount = service.totalCount(params);
		String currentPage = request.getParameter("currentPage");
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		RolePageingUtile rpu = new RolePageingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage), 5);
		
		String pagination = rpu.getPagingHtmls();
		
		int startCount = rpu.getStartCount();
		int endCount = rpu.getEndCount();
		
		request.setAttribute("pagination", pagination);
		
		params.put("startCount", String.valueOf(startCount));
		params.put("endCount", String.valueOf(endCount));
		
		List<IBoardVO> boardList = service.boardList(params);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("search_keycode", request.getParameter("search_keycode"));
		request.setAttribute("search_keyword", request.getParameter("search_keyword"));
		
		return "/admin/iboard/iboardList.tiles";
	}

}
