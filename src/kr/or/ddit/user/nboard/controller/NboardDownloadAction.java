package kr.or.ddit.user.nboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.file.freeboard.service.IFreeBoardFileService;
import kr.or.ddit.file.freeboard.service.IFreeBoardFileServiceImpl;
import kr.or.ddit.file.nboard.service.nBoardFileService;
import kr.or.ddit.file.nboard.service.nBoardFileServiceImpl;
import kr.or.ddit.utiles.FileDownloadView;
import kr.or.ddit.vo.BoardFileVO;

public class NboardDownloadAction implements IAction {
private boolean isRedirect = false;

	
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		this.isRedirect =true;
		String fileSEQ = request.getParameter("fileSEQ");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("fileSEQ", fileSEQ);
		
		nBoardFileService service = nBoardFileServiceImpl.getInstance();
		BoardFileVO fileItemInfo = service.nboardfileitemInfo(params);

		
		FileDownloadView.fileDownload(fileItemInfo, response);
		
		
		
		return "/user/nboard/nboardList.do";
	}

}
