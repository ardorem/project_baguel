package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/LoginCheckFilter")
public class LoginCheckFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false;
		if(session != null) {
			if(session.getAttribute("loginMember") != null) {
				login = true;
			}
		}
		if(login) {
			chain.doFilter(httpRequest, response);
		} else {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert(\"로그인이 필요한 메뉴입니다.\");");
			out.println("document.location.href=\"login\";");
			out.println("</script>");
		}
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}



}
