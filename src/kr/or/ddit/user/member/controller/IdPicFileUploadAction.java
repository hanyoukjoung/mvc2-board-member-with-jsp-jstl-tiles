package kr.or.ddit.user.member.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.IAction;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.utiles.FileUploadRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;
import org.codehaus.jackson.map.ObjectMapper;

public class IdPicFileUploadAction implements IAction {

	@Override
	public boolean isRedirect() {
		
		return false;
		
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request;
			
			PrintWriter out = response.getWriter();
			
			FileItem item = wrapper.getFileItem("file");
			
			String fileName = item.getName();
			String extension = FilenameUtils.getExtension(fileName);
			
			String fileSaveName = UUID.randomUUID().toString().replace("-", "") + "." + extension;
			File saveFile = new File(GlobalConstant.FILE_PATH, fileSaveName);
			
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put("file_name", fileName);
			jsonMap.put("file_save_name", fileSaveName);
			
			item.write(saveFile);
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(jsonMap);
			
			out.println(jsonData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
