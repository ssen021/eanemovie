<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.induk.cinema.dto.HistoryUrl" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp" />

    <style>
        .goHome:hover{
            color: #84c7a9!important;
        }
    </style>

    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
    <title>Boleto  - Online Ticket Booking Website HTML Template</title>


</head>

<body>
    <!-- ==========Preloader========== -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- ==========Preloader========== -->
    
    <!-- ==========Sign-In-Section========== -->
    <section class="account-section bg_img" data-background="./assets/images/account/account-bg.jpg">
        <div class="container">
            <div class="padding-top padding-bottom">
                <div class="account-area">
                    <div class="section-header-3">
                        <span class="cate"><a class="goHome" href="/csmovie" style="color: #888cbb">induk cinema</a></span>
                        <h2 class="title">로그인</h2>
                    </div>
                    <% HistoryUrl historyUrl = (HistoryUrl)request.getAttribute("historyUrl");%>
                    <form class="account-form" action="/csmovie/members/login?<%=historyUrl.getParam()%>" method="post">
                        <div class="form-group">
                            <spring:bind path="member.email">
                                <label for="${status.expression}">이메일<span> *</span></label>
                                <input type="text" name="${status.expression}" value="${cookie.email.value}" id="${status.expression}" placeholder="이메일을 입력해주세요" required>
                                <span style="color: red">${status.errorMessage }</span>
                            </spring:bind>
                        </div>
                        <div class="form-group">
                            <spring:bind path="member.password">
                            <label for="${status.expression}">비밀번호<span> *</span></label>
                            <input type="password" name="${status.expression}" value="${status.value}" id="${status.expression}" placeholder="비밀번호를 입력해주세요"  required>
                                <span style="color: red">${status.errorMessage }</span>
                            </spring:bind>
                        </div>
                        <c:choose>
                            <c:when test="${not empty cookie.email.value}">
                                <div class="form-group checkgroup">
                                    <input type="checkbox" name="remember" id="bal2" checked>
                                    <label for="bal2">remember email</label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="form-group checkgroup">
                                    <input type="checkbox" name="remember" id="bal2">
                                    <label for="bal2">remember email</label>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="form-group text-center">
                            <input type="submit" value="로그인">
                        </div>
                    </form>
                    <div class="option">
                        계정이 없으시다면? <a href="/csmovie/members/signup">회원 가입</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ==========Sign-In-Section========== -->

    <c:import url="../main/login_footer.jsp" />
</body>

</html>