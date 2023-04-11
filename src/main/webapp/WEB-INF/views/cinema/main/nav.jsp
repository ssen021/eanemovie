<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-06-30
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<style>
    .pop-layer .pop-container {
        padding: 20px 25px;
    }

    .pop-layer p.ctxt {
        color: #666;
        line-height: 25px;
    }

    .pop-layer .btn-r {
        width: 100%;
        margin: 10px 0 20px;
        padding-top: 10px;
        border-top: 1px solid #DDD;
        text-align: right;
    }

    .pop-layer {
        display: none;
        position: absolute;
        top: 50%;
        left: 50%;
        max-width: 700px;
        width: 80%;
        height: auto;
        background-color: #032055;
        border: 5px solid #3571B5;
        border-radius: 20px;
        z-index: 10;
    }

    .dim-layer {
        display: none;
        position: fixed;
        _position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 100;
    }

    .dim-layer .dimBg {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: #000;
        opacity: .5;
        filter: alpha(opacity=50);
    }

    .dim-layer .pop-layer {
        display: block;
    }

    a.btn-layerClose {
        display: inline-block;
        height: 25px;
        padding: 0 14px 0;
        border: 1px solid #304a8a;
        background-color: #3f5a9d;
        font-size: 13px;
        color: #fff;
        line-height: 25px;
    }

    a.btn-layerClose:hover {
        border: 1px solid #091940;
        background-color: #1f326a;
        color: #fff;
    }
</style>

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
<!-- ==========Overlay========== -->
<div class="overlay"></div>
<a href="#0" class="scrollToTop">
    <i class="fas fa-angle-up"></i>
</a>
<!-- ==========Overlay========== -->

<!-- ==========Header-Section========== -->
<header class="header-section">
    <div class="container">
        <div class="header-wrapper">
            <div class="logo">
                <a href="/csmovie">
                    <img src="/cinema/assets/images/logo/logo.png" alt="logo">
                </a>
            </div>
            <ul class="menu">
                <li>
                    <a href="/csmovie/movies" class="<%= (request.getRequestURL().toString().contains("/cinema/movie"))?"active":"" %>">영화</a>
                </li>
                <li>
                    <a href="/csmovie/cinemas" class="<%= (request.getRequestURL().toString().contains("/cinema/cinema"))?"active":"" %>">극장</a>
                </li>
                <li>
                    <a href="#0" class="<%= (request.getRequestURL().toString().contains("/cinema/schedule") ||
                    request.getRequestURL().toString().contains("/cinema/reservation"))?"active":"" %>">예매</a>
                    <ul class="submenu">
                        <li>
                            <a href="/csmovie/schedules?title=&cityId=&cinemaId=&date=">시간표</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/csmovie/events" class="<%= (request.getRequestURL().toString().contains("/cinema/event"))?"active":"" %>">이벤트</a>
                </li>
                <li>
                    <a href="/csmovie/reviews" class="<%= (request.getRequestURL().toString().contains("/cinema/review"))?"active":"" %>">리뷰</a>
                </li>
                <c:if test="${not empty sessionScope.member}">
                    <li>
                        <a href="#0" class="<%= (request.getRequestURL().toString().contains("/cinema/member"))?"active":"" %>">내정보</a>
                        <ul class="submenu">
                            <li>
                                <a href="/csmovie/members/edit">내정보수정</a>
                            </li>
                            <li>
                                <a href="/csmovie/members/reservationList">예매목록</a>
                            </li>
                            <li>
                                <a href="#layer2" class="btn-example" id="couponListBtn">내 쿠폰함</a>
                            </li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.member.admin == 1}">
                        <li>
                            <a href="/csmovie/admin">관리자</a>
                        </li>
                    </c:if>
                </c:if>
                <c:choose>
                    <c:when test="${empty sessionScope.member}">
                        <li class="header-button pr-0">
                            <a href="/csmovie/members/login">로그인</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="header-button pr-0">
                            <a href="/csmovie/members/logout">로그아웃</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
            <div class="header-bar d-lg-none">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
</header>



<!-- ==========Header-Section========== -->
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <span>내 쿠폰함</span>
                <hr>

                <table style="width: 100%;text-align: center">
                    <thead>
                        <tr>
                            <td width="35%">이벤트명</td>
                            <td width="25%">쿠폰번호</td>
                            <td width="25%">사용기간</td>
                            <td width="15%">사용여부</td>
                        </tr>
                    </thead>
                    <tbody id="couponList">
                    </tbody>
                </table>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">확인</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>