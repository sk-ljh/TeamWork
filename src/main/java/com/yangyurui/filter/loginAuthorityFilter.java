package com.yangyurui.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.our.pojo.User;

/**
 * Servlet Filter implementation class loginAuthorityFilter
 */
public class loginAuthorityFilter implements Filter {

    /**
     * Default constructor. 
     */
	
    public loginAuthorityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
    @Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session=((HttpServletRequest) request).getSession();
		User user=(User) session.getAttribute("loginUser");
		String authPath=request.getServletContext().getContextPath()+"";
		String url=((HttpServletRequest) request).getRequestURI();
		if(url.endsWith(".do")||url.endsWith(".jsp")) {
			if( user!= null||url.contains("login.do")||url.contains("login.jsp")||url.contains("checkuser.do"))
				chain.doFilter(request, response);
			else
				((HttpServletRequest) request).getRequestDispatcher("/OrderSystem/html/login.jsp").forward(request,response);
		}
		else chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
