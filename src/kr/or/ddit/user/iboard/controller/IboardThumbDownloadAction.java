package kr.or.ddit.user.iboard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.file.freeboard.service.IFreeBoardFileService;
import kr.or.ddit.file.freeboard.service.IFreeBoardFileServiceImpl;
import kr.or.ddit.file.iboard.service.IIMGBoardFileService;
import kr.or.ddit.file.iboard.service.IIMGBoardFileServiceImpl;
import kr.or.ddit.utiles.FileDownloadView;
import kr.or.ddit.vo.BoardFileVO;

public class IboardThumbDownloadAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		String bo_no = request.getParameter("bo_no");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		IIMGBoardFileService service = IIMGBoardFileServiceImpl.getInstance();
		BoardFileVO fileItemInfo = service.iboardFileInfoForThumb(params);

		FileDownloadView.fileDownload(fileItemInfo, response);
		
		return "/user/iboard/iboardView.do?bo_no=bo_no";
	}
}
