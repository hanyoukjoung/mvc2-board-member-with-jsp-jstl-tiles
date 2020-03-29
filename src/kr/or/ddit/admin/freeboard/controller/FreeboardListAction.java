package kr.or.ddit.admin.freeboard.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.free.board.service.IFreeBoardService;
import kr.or.ddit.free.board.service.IFreeBoardServiceImpl;
import kr.or.ddit.utiles.RolePageingUtile;
import kr.or.ddit.vo.FBoardVO;

public class FreeboardListAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		String currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage ="1";
		}
		
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		
		String search_keycode = request.getParameter("search_keycode");
		String search_keyword = request.getParameter("search_keyword");
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
		String totalCount = service.totalCount(params);
		
		RolePageingUtile pagingUtil = new RolePageingUtile(request,
												Integer.parseInt(totalCount),
												Integer.parseInt(currentPage));
		
		String startCount = String.valueOf(pagingUtil.getStartCount());
		String endCount = String.valueOf(pagingUtil.getEndCount());
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
//		

		List<FBoardVO> freeboardList = service.freeboardList(params);
		request.setAttribute("freeboardList", freeboardList);
		request.setAttribute("paginationHtmls", pagingUtil.getPagingHtmls());
	
		return "/admin/freeboard/freeBoardList.tiles";
	}

}
