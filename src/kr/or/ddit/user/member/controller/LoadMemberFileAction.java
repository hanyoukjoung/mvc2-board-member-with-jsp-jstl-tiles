package kr.or.ddit.user.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.file.member.service.IMemberFileService;
import kr.or.ddit.file.member.service.IMemberFileServiceImpl;
import kr.or.ddit.vo.BoardFileVO;

public class LoadMemberFileAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		PrintWriter out = null;
		try {
			request.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		IMemberFileService service = IMemberFileServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<>();
		params.put("mem_id", request.getParameter("mem_id"));
		
		BoardFileVO fileInfo = service.memberFileInfo(params);		
		
		params.put("file_save_name", fileInfo.getFile_save_name());
		params.put("flag", "false");
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonData = "{}";
		
		if(fileInfo != null) {
			try {
				params.put("flag", "true");
				jsonData = mapper.writeValueAsString(params);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		out.println(jsonData);
		
		return null;
	}

}
