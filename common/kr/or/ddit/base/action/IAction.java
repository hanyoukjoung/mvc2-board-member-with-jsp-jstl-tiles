package kr.or.ddit.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IAction {

	public boolean isRedirect();

	public String process(HttpServletRequest request,
			HttpServletResponse response);

}
