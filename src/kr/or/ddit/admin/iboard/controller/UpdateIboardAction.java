package kr.or.ddit.admin.iboard.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.image.board.service.IIMGBoardService;
import kr.or.ddit.image.board.service.IIMGBoardServiceImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.BoardFileVO;
import kr.or.ddit.vo.IBoardVO;

public class UpdateIboardAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;
		
		IBoardVO boardInfo = new IBoardVO();
		
		try {
			
			BeanUtils.populate(boardInfo, request.getParameterMap());
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		FileItem[] fileItems = wrapper.getFileItemValues("file");
		
		List<BoardFileVO> items = AttachFileMapper.mapper(fileItems, boardInfo.getBo_no());
		
		boardInfo.setItems(items);
		
		IIMGBoardService service = IIMGBoardServiceImpl.getInstance(); 
		
		String message = URLEncoder.encode("게시판 수정에 실패하였습니다.");
		
		if(service.updateBoardForAdmin(boardInfo) == 0){
			message = URLEncoder.encode("게시판 수정에 성공하였습니다.");
		}
		
		return "/admin/iboard/iboardView.do?bo_no=" + boardInfo.getBo_no() + "&message=" + message;
	}

}
