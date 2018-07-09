package com.city.car.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.city.car.model.UserModel;

/**
 * 登录拦截
 * @author SORRY
 *
 */
public class LoginInterception extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserModel user = (UserModel)session.getAttribute("dbUser");
		if ( user == null ) {
			response.sendRedirect("login.do");
			return false;
		} else {
			return true;
		}
	}

}
