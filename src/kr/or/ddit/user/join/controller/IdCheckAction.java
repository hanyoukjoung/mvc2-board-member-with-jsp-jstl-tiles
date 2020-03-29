package kr.or.ddit.user.join.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;

public class IdCheckAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("mem_id", request.getParameter("mem_id"));
		
		if(service.idCheck(params) == 0){
			params.put("flag", "ok");
		} else {
			params.put("flag", "no");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonData = "";
		
		try {
			
			jsonData = mapper.writeValueAsString(params);

			response.getWriter().println(jsonData);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
