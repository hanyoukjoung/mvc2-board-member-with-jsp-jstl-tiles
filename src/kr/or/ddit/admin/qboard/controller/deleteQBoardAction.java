package kr.or.ddit.admin.qboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.qna.board.service.QNABoardService;
import kr.or.ddit.qna.board.service.QNABoardServiceImpl;
import kr.or.ddit.ref.board.service.REFBoardService;
import kr.or.ddit.ref.board.service.REFBoardServiceImpl;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.RBoardVO;

public class deleteQBoardAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {

		this.isRedirect = true;
		String bo_no = request.getParameter("bo_no");
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		QNABoardService service = QNABoardServiceImpl.getInstance();
		service.deleteQBoardInfo(params);
		
		return "/admin/qboard/qboardList.do";
	}

}
