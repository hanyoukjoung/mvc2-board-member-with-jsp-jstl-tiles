package kr.or.ddit.admin.qboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.qna.board.service.QNABoardService;
import kr.or.ddit.qna.board.service.QNABoardServiceImpl;
import kr.or.ddit.vo.QBoardVO;

public class updataQBoardAction implements IAction {
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
		
		QBoardVO qboardInfo = new QBoardVO();
		
		try {
			BeanUtils.populate(qboardInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		QNABoardService service = QNABoardServiceImpl.getInstance();
		service.updateQBoardInfo(qboardInfo);
		
		request.setAttribute("qboardInfo", qboardInfo);
		
		return "/admin/qboard/qboardList.do";
	}

}
