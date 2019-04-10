package hl.sztampa.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "EncodingFilter", urlPatterns = {"/*"})
public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        servletRequest.setCharacterEncoding("UTF-8");
        System.out.println("Character encoding set on request: " + servletRequest.getCharacterEncoding());

        // przekazujemy dalej: do nast. filtra lub Servletu
        filterChain.doFilter(servletRequest, servletResponse);

        servletResponse.setCharacterEncoding("UTF-8");
        servletResponse.setContentType("text/html");
        System.out.println("Character encoding and content type set on response to: " +
                servletResponse.getCharacterEncoding() + " and " + servletResponse.getContentType());
    }

    @Override
    public void destroy() {

    }
}
