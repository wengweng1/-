package web;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/LostAndFound-1/*")
public class LoginFilter1 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        if(ignore(request) || request.getSession().getAttribute("admin")!=null||request.getSession().getAttribute("user")!=null){
            System.out.println("过滤器放行");
            filterChain.doFilter(request,response);
        }else{
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
    private boolean ignore(HttpServletRequest request){
        String[] uris={"login.jsp","LoginServlet",".css",".js","js","register.jsp","personage.jsp",".jpg",".png"};
        for(String u:uris){
            if(request.getRequestURI().endsWith(u)){
                return true;
            }
        }
        return false;
    }
}
