<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-06-30
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/csmovie/admin">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="/csmovie/admin">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Addons
    </div>

    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseChart"
           aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>통계</span>
        </a>
        <div id="collapseChart" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">영화:</h6>
                <a class="collapse-item" href="/csmovie/admin/chart/movie">월간 매출</a>
                <a class="collapse-item" href="/csmovie/admin/chart/movies">영화별 매출</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">극장:</h6>
                <a class="collapse-item" href="/csmovie/admin/chart/cinema">월간 매출</a>
                <a class="collapse-item" href="/csmovie/admin/chart/cinemas">영화관별 매출</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTheater"
           aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>영화관</span>
        </a>
        <div id="collapseTheater" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">영화관:</h6>
                <a class="collapse-item" href="/csmovie/admin/cinemas">영화관</a>
                <a class="collapse-item" href="/csmovie/admin/theaters">상영관</a>
                <a class="collapse-item" href="/csmovie/admin/seats">좌석</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">기타:</h6>
                <a class="collapse-item" href="/csmovie/admin/citys">시/도</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMovie"
           aria-expanded="true" aria-controls="collapseMovie">
            <i class="fas fa-fw fa-folder"></i>
            <span>영화</span>
        </a>
        <div id="collapseMovie" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">배우 및 감독:</h6>
                <a class="collapse-item" href="/csmovie/admin/actors">배우</a>
                <a class="collapse-item" href="/csmovie/admin/directors">감독</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">영화:</h6>
                <a class="collapse-item" href="/csmovie/admin/movies">영화</a>
                <a class="collapse-item" href="/csmovie/admin/genres">장르</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEvent"
           aria-expanded="true" aria-controls="collapseEvent">
            <i class="fas fa-fw fa-folder"></i>
            <span>이벤트</span>
        </a>
        <div id="collapseEvent" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">이벤트:</h6>
                <a class="collapse-item" href="/csmovie/admin/events">이벤트</a>
                <a class="collapse-item" href="/csmovie/admin/eventCodes">이벤트 코드</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSchedule"
           aria-expanded="true" aria-controls="collapseEvent">
            <i class="fas fa-fw fa-folder"></i>
            <span>상영시간표</span>
        </a>
        <div id="collapseSchedule" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">상영시간표:</h6>
                <a class="collapse-item" href="/csmovie/admin/schedules">시간표</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReview"
           aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>리뷰</span>
        </a>
        <div id="collapseReview" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="/csmovie/admin/reviews">리뷰</a>
                <a class="collapse-item" href="/csmovie/admin/comments">댓글</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/csmovie/admin/reservations">
            <i class="fas fa-fw fa-folder"></i>
            <span>예매</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="/csmovie/admin/members">
            <i class="fas fa-user-friends"></i>
            <span>사용자</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    <!-- Sidebar Message -->
    <div class="sidebar-card d-none d-lg-flex">
        <img class="sidebar-card-illustration mb-2" src="/admin/img/undraw_rocket.svg" alt="...">
        <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
        <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
    </div>

</ul>
<!-- End of Sidebar -->

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Search -->
            <form
                    class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                           aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
            </form>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">

                <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.member.name}</span>
                        <c:choose>
                            <c:when test="${not empty sessionScope.member.image}">
                                <img class="img-profile rounded-circle"
                                     src="/csmovie/admin/members/images/${sessionScope.member.image} ">
                            </c:when>
                            <c:otherwise>
                                <img class="img-profile rounded-circle"
                                     src="/admin/img/undraw_profile.svg">
                            </c:otherwise>
                        </c:choose>
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                            Profile
                        </a>
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            Settings
                        </a>
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                            Activity Log
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Logout
                        </a>
                    </div>
                </li>

            </ul>

        </nav>
        <!-- End of Topbar -->