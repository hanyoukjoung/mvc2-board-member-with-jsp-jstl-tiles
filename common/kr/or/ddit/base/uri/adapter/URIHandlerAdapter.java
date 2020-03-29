package kr.or.ddit.base.uri.adapter;

import java.util.Map;
import kr.or.ddit.base.action.IAction;
import kr.or.ddit.base.uri.mapper.URIHandlerMapper;

public class URIHandlerAdapter {
	
	public static IAction getAction(String servletPath){
		
		Map<String, String> servletPathMap = URIHandlerMapper.getServletPathMap();
		
		IAction action = null;
				
		if(servletPathMap.containsKey(servletPath)){
			try{
				Class targetCls = Class.forName(servletPathMap.get(servletPath));
				action = (IAction) targetCls.newInstance();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return action;
	}
	
}
