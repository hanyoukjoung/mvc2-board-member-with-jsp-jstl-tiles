/**
 * 
 */
package kr.or.ddit.user.iboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.file.iboard.service.IIMGBoardFileService;
import kr.or.ddit.file.iboard.service.IIMGBoardFileServiceImpl;
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
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", request.getParameter("bo_no"));
		
		service.deleteBoard(params);
		
		return "/user/iboard/iboardList.do?message=" + URLEncoder.encode("게시글을 삭제하였습니다.");
	}

}
