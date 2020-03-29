package kr.or.ddit.base.uri.mapper;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;

public class URIHandlerMapper {
	private static Map<String, String> servletPathMap = new HashMap<>();
	
	static{
		ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.uri.info.servletPath");
		Iterator<String> it = bundle.keySet().iterator();
		
		while(it.hasNext()) {
			String key = it.next();
			String value = bundle.getString(key);
			
			servletPathMap.put(key, value);
		}
	}
	
	public static Map<String, String> getServletPathMap(){
		return servletPathMap;
	}
}
