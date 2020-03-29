package kr.or.ddit.user.rboard.controller;

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

public class insertRBoardAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;

		RBoardVO rboardInfo = new RBoardVO();

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			BeanUtils.populate(rboardInfo, wrapper.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		REFBoardService service = REFBoardServiceImpl.getInstance();
		service.insertBoardInfo(rboardInfo, wrapper.getFileItemValues("files"));
		
		try {
			String message = URLEncoder.encode("자료 등록이 완료 되었습니다.", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("rboardInfo", rboardInfo);
		return "/user/rboard/rboardList.do";
	}

}
