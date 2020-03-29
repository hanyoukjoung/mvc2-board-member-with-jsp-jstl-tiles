package kr.or.ddit.admin.rboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.ref.board.service.REFBoardService;
import kr.or.ddit.ref.board.service.REFBoardServiceImpl;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.RBoardVO;

public class updataRBoardAction implements IAction {
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
		
		this.isRedirect = true;
		
		RBoardVO rboardInfo = new RBoardVO();
		
		try {
			BeanUtils.populate(rboardInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		REFBoardService service = REFBoardServiceImpl.getInstance();
		service.updateRBoardInfo(rboardInfo);
		
		request.setAttribute("rboardInfo", rboardInfo);
		
		return "/admin/rboard/rboardList.do";
	}

}
