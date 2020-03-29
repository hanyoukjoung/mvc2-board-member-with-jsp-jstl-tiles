package kr.or.ddit.user.freeboard.controller;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import kr.or.ddit.base.action.IAction;
import kr.or.ddit.free.board.service.IFreeBoardService;
import kr.or.ddit.free.board.service.IFreeBoardServiceImpl;
import kr.or.ddit.vo.FBoardVO;

public class UpdateFreeboardAction implements IAction {
	private boolean isRedirect = false;
	
	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return isRedirect;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.isRedirect =true;
		
		 FBoardVO freeboardInfo = new FBoardVO();
		 
		 System.out.println("-------->"+request.getParameterMap());
		 try {
			BeanUtils.populate(freeboardInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		 String bopass = request.getParameter("bo_pwd");
//		 freeboardInfo.setBo_pass(bopass);
//		 String bonick = request.getParameter("bo_nickname");
//		 freeboardInfo.setBo_nick(bonick);
//		 String bocont = request.getParameter("bo_content");
//		 freeboardInfo.setBo_cont(bocont);
	     
		 
		 
		 IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
		 service.updatefreeboard(freeboardInfo);
		
		return "/user/freeboard/freeboardList.do";
	}

}
