package kr.or.ddit.admin.join.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.admin.admin.service.IAdminService;
import kr.or.ddit.admin.admin.service.IAdminServiceImpl;
import kr.or.ddit.base.action.IAction;
import kr.or.ddit.vo.AdminVO;

public class LoginCheckAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		IAdminService service = IAdminServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("admin_id", request.getParameter("admin_id"));
		params.put("admin_pass", request.getParameter("admin_pass"));
		
		AdminVO adminInfo = service.adminInfo(params);
		
		ObjectMapper mapper = new ObjectMapper();
		try{
			if(adminInfo != null) {
				params.put("flag", "ok");
				params.put("message", URLEncoder.encode(adminInfo.getAdmin_name() + "관리자님 환영합니다!"));
				request.getSession().setAttribute("LOGIN_ADMININFO", adminInfo);
				response.getWriter().print(mapper.writeValueAsString(params));
			} else {
				params.put("flag", "no");
				params.put("message", URLEncoder.encode("아이디 또는 패스워드가 일치하지 않습니다."));
				response.getWriter().print(mapper.writeValueAsString(params));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
