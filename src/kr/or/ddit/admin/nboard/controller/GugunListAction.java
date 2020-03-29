package kr.or.ddit.admin.nboard.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.zipcode.service.IZipcodeService;
import kr.or.ddit.zipcode.service.IZipcodeServiceImpl;

public class GugunListAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8"); 

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		IZipcodeService service = IZipcodeServiceImpl.getInstance();
		
		List<String> gugunList = service.gugunList(request.getParameter("sido"));		
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonData;
		try {
			jsonData = mapper.writeValueAsString(gugunList);
			response.getWriter().println(jsonData);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
