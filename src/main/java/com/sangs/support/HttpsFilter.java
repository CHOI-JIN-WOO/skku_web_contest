package com.sangs.support;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class HttpsFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse serRes = ((HttpServletResponse) res);
        serRes.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
        serRes.addHeader("X-Content-Type-Options", "nosniff");
        chain.doFilter(request, res);
    }

    public void init(FilterConfig arg0) throws ServletException {
    }
}