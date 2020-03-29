package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.utiles.FileUploadRequestWrapper;

import org.apache.commons.lang3.StringUtils;

public class FileUploadFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletRequest, 
			ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		
		String contentType = servletRequest.getContentType();
		if(StringUtils.isNotEmpty(contentType) && 
				contentType.toLowerCase().contains("multipart")){
			HttpServletRequest request = (HttpServletRequest) servletRequest;
			
			
			FileUploadRequestWrapper wrapper = 
					new FileUploadRequestWrapper(request);
			
			chain.doFilter(wrapper, servletResponse);
		}else{
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
