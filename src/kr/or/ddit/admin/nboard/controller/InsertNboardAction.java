package kr.or.ddit.admin.nboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.ntc.board.service.NtcBoardService;
import kr.or.ddit.ntc.board.service.NtcBoardServiceImpl;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.NBoardVO;


public class InsertNboardAction implements IAction {

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
		
		NBoardVO freeboardInfo = new NBoardVO();
		
		try {
			BeanUtils.populate(freeboardInfo, wrapper.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		NtcBoardService service = NtcBoardServiceImpl.getInstance();
		service.insertnboard(freeboardInfo,wrapper.getFileItemValues("files"));
		try {
			String message = URLEncoder.encode("게시글 등록이 완료되었습니다.", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("freeboardInfo", freeboardInfo);
		return "/admin/nboard/nboardList.do";
	}
}
