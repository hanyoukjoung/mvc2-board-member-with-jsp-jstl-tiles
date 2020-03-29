package kr.or.ddit.user.freeboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.free.board.service.IFreeBoardService;
import kr.or.ddit.free.board.service.IFreeBoardServiceImpl;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.FBoardVO;

public class InsertFreeboardAction implements IAction {
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
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper)request;
		
		FBoardVO freeboardInfo = new FBoardVO();
		
		try {
			BeanUtils.populate(freeboardInfo, wrapper.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
		service.insertFreeboard(freeboardInfo,wrapper.getFileItemValues("files"));
		System.out.println("freeboardInfo"+freeboardInfo);
		try {
			String message = URLEncoder.encode("게시글 등록이 완료되었습니다.", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("freeboardInfo", freeboardInfo);
		
		
		return "/user/freeboard/freeboardList.do";
	}

}
