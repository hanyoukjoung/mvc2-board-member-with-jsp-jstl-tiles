package kr.or.ddit.admin.iboard.controller;

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

public class InsertIboardAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
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
		
		String message = URLEncoder.encode("게시글 등록을 실패하였습니다.");
		
		if( service.insertBoard(boardInfo) == 0 ){
			message = URLEncoder.encode("게시글을 등록하였습니다.");
		}
		
		return "/admin/iboard/iboardList.do?message=" + message;
	}

}
