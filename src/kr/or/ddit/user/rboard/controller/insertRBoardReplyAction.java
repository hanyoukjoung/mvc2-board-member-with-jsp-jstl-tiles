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

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.ref.board.service.REFBoardService;
import kr.or.ddit.ref.board.service.REFBoardServiceImpl;
import kr.or.ddit.vo.RBoardVO;

public class insertRBoardReplyAction implements IAction {
	private boolean isRedirect = false;
	@Override
	public boolean isRedirect() {
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		this.isRedirect =true;
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		RBoardVO rboardInfo = new RBoardVO();
		
		try {
			BeanUtils.populate(rboardInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		REFBoardService service = REFBoardServiceImpl.getInstance();
		service.insertRBoardInfoReply(rboardInfo);
		
		return "/user/rboard/rboardList.do";
	}
}
