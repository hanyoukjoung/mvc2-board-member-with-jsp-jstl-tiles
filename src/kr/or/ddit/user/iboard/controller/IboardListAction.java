package kr.or.ddit.user.iboard.controller;

import java.io.UnsupportedEncodingException;
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
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		IIMGBoardService service = IIMGBoardServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keycode", request.getParameter("search_keycode"));
		params.put("search_keyword", request.getParameter("search_keyword"));
		
		String totalCount = service.totalCount(params);
		String currentPage = request.getParameter("currentPage");
		
		currentPage = currentPage == null ? "1" : currentPage;
		
		RolePageingUtile pageingUtile = new RolePageingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage), 3);
		
		String startCount = pageingUtile.getStartCount() + "";
		String endCount = pageingUtile.getEndCount() + "";
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<IBoardVO> boardList = service.boardList(params);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("pagination", pageingUtile.getPagingHtmls());
		
		return "/user/iboard/iboardList.tiles";
	}
}
