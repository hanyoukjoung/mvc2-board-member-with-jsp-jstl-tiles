package kr.or.ddit.user.rboard.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.file.service.BoardFileService;
import kr.or.ddit.file.service.BoardFileServiceImpl;
import kr.or.ddit.ref.board.service.REFBoardService;
import kr.or.ddit.ref.board.service.REFBoardServiceImpl;
import kr.or.ddit.utiles.FileDownloadView;
import kr.or.ddit.utiles.RolePageingUtile;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.RBoardVO;

public class rboardFileDownloadAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		this.isRedirect = true;
		String fileSEQ = request.getParameter("fileSEQ");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("file_no", fileSEQ);
		
		BoardFileService service = BoardFileServiceImpl.getInstance();
		BoardFileVO fileInfo = service.rFileBoardInfo(params);
		
		FileDownloadView.fileDownload(fileInfo, response);
		
		return "/user/rboard/rboardList.do";
		
	}
}
