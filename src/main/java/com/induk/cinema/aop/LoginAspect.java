package com.induk.cinema.aop;

import com.induk.cinema.domain.Member;
import com.induk.cinema.dto.HistoryUrl;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Enumeration;

@Aspect
@Component
public class LoginAspect {
    /*
    //어드민페이지 로그인 여부 확인
    @Pointcut("execution(* com.induk.cinema.controller.Admin*.*(..))")
    public void loginInspectPointcut() {
    }

    @Before("loginInspectPointcut()")
    public void loginInspect() throws IOException, ServletException {    //로그인 했는지 여부

        HttpSession session = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest().getSession();

            Member m = (Member) session.getAttribute("member");
        if (!(m != null && m.getAdmin() == 1)) {
            HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
            HttpServletResponse response = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getResponse();

            if (request.getRequestURL().toString().contains("/admin/members/login")) return ;    //현재페이지가 login페이지면 괜찮음

            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer;
            writer = response.getWriter();
            writer.print("<script>");
            writer.print("alert('관리자만 사용 가능합니다');");
            writer.print("location.href='/csmovie/admin/members/login';");    //로그인 페이지로 이동
            writer.print("</script>");
            writer.close();
        }
    }*/
    //사용자페이지 로그인 여부
    @Pointcut("execution(* com.induk.cinema.controller.ReviewController.addForm(..)) || execution(* com.induk.cinema.controller.ReviewController.updateForm(..)) || " +
            "execution(* com.induk.cinema.controller.ReviewController.delReview(..)) || execution(* com.induk.cinema.controller.MemberController.updateForm(..)) ||" +
            "execution(* com.induk.cinema.controller.MemberController.reservationListForm(..)) || execution(* com.induk.cinema.controller.ReservationController.home(..)))")
    public void userLoginInspectPointcut() {
    }

    @Before("userLoginInspectPointcut()")
    public void userLoginInspect() throws IOException, ServletException {    //로그인 했는지 여부

        HttpSession session = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest().getSession();

        Member m = (Member) session.getAttribute("member");
        if (!(m != null && m.getId() != null)) {
            HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
            HttpServletResponse response = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getResponse();
            if (request.getRequestURL().toString().contains("/members/login")) return ;    //현재페이지가 login페이지면 괜찮음
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer;

            String paramsUrl ="";
            Enumeration params = request.getParameterNames();
            while(params.hasMoreElements()) {
                String param = (String) params.nextElement();
                paramsUrl += (param +"=" +request.getParameter(param));
                if(params.hasMoreElements()) paramsUrl += "&";
            }
            HistoryUrl historyUrl = new HistoryUrl();
            historyUrl.setHistoryUrl(request.getRequestURI().toString());
            historyUrl.setHistoryParam(paramsUrl);
            //historyUrl.setHistoryUrl(URLEncoder.encode(request.getRequestURI().toString(), "UTF-8"));
            //historyUrl.setHistoryParam(URLEncoder.encode(paramsUrl, "UTF-8"));

            writer = response.getWriter();
            writer.print("<script>");
            writer.print("alert('로그인이 필요한 서비스입니다');");
            writer.print("location.href='/csmovie/members/login?" + historyUrl.getParam() +"'");
            writer.print("</script>");
            writer.close();
        }
    }
}
