package kr.or.ddit.base.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.ddit.base.action.IAction;
import kr.or.ddit.base.uri.adapter.URIHandlerAdapter;

public class WebController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String servletPath = request.getServletPath();
		
   		IAction action = URIHandlerAdapter.getAction(servletPath);
		
		if(action != null) {
			String viewName = action.process(request, response);
			if(viewName != null) {
				if(action.isRedirect()){
					response.sendRedirect(request.getContextPath() + viewName);
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
					dispatcher.forward(request, response);
				}
			}
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
	}
}























