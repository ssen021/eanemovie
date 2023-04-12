<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="com.induk.cinema.domain.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-06-30
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="header.jsp"/>

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>


</head>

<body>

<c:import url="nav.jsp"/>

<!-- ==========Banner-Section========== -->
<section class="banner-section">
    <div class="banner-bg bg_img bg-fixed" data-background="/csmovie/assets/images/banner/banner01.jpg"></div>
    <div class="container">
        <div class="banner-content">
            <h1 class="title  cd-headline clip"><span class="d-block">induk cinema</span> 영화 그 이상의
                <span class="color-theme cd-words-wrapper p-0 m-0">
                        <b class="is-visible">감동</b>
                        <b>설렘</b>
                        <b>재미</b>
                    </span>
            </h1>
            <p>24시간 꺼지지 않는 나만의 영화관</p>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Ticket-Search========== -->
<section class="book-section bg-one">
    <div class="container">
        <div class="search-tab bg_img" data-background="/cinema/assets/images/ticket/ticket-bg01.jpg">
            <div class="row align-items-center mb--20">
                <div class="col-lg-6 mb-20">
                    <div class="search-ticket-header">
                        <h6 class="category">LeeAnLee Cinema에 오신걸 환영합니다. </h6>
                        <h3 class="title">보고 싶은 영화를 찾아보세요!</h3>
                    </div>
                </div>
                <div class="col-lg-6 mb-20">
                    <ul class="tab-menu ticket-tab-menu">
                        <li style="background: none;pointer-events: none;"></li>
                        <li style="background: none;pointer-events: none;"></li>
                        <li class="active" style="pointer-events: none;">
                            <div class="tab-thumb">
                                <img src="/cinema/assets/images/ticket/ticket-tab01.png" alt="ticket">
                            </div>
                            <span>영화</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-area">
                <div class="tab-item active">
                    <form class="ticket-search-form" onsubmit="return false">
                        <div class="form-group large col-lg-3">
                            <input type="text" placeholder="Search fo Movies" id="movieTitle" value="${title}" onkeydown="if(event.keyCode==13)
                                location.href='/csmovie/schedules?title=' + $('#movieTitle').val() + '&cityId=' + $('#cityId').val()
                                 + '&cinemaId=' + $('#cinemaId').val() + '&date=' + $('#dateCombo').val();">
                            <button type="button" onclick="location.href='/csmovie/schedules?title=' + $('#movieTitle').val() + '&cityId=' + $('#cityId').val()
                             + '&cinemaId=' + $('#cinemaId').val() + '&date=' + $('#dateCombo').val();" ><i class="fas fa-search"></i></button>
                        </div>
                        <div class="form-group col-lg-3">
                            <div class="thumb">
                                <img src="/cinema/assets/images/ticket/date.png" alt="ticket">
                            </div>
                            <span class="type">날짜</span>
                            <select class="select-bar form-control-sm" onchange="findSchedule()" style="background: none; border-width: 0px;" id="dateCombo">
                                <%--
                                <%LocalDate date = LocalDate.now();%>
                                <option value="<%=date%>" style="color:#000000"><%=date%></option>
                                <option value="<%=date.plusDays(1)%>" style="color:#000000"><%=date.plusDays(1)%></option>
                                <option value="<%=date.plusDays(2)%>" style="color:#000000"><%=date.plusDays(2)%></option>
                                <option value="<%=date.plusDays(3)%>" style="color:#000000"><%=date.plusDays(3)%></option>
                                <option value="<%=date.plusDays(4)%>" style="color:#000000"><%=date.plusDays(4)%></option>
                                <option value="<%=date.plusDays(5)%>" style="color:#000000"><%=date.plusDays(5)%></option>
                                --%>
                                <option value="2023-05-29" style="color:#000000">2023-05-29</option>
                                <option value="2023-05-30" style="color:#000000">2023-05-30</option>
                                <option value="2023-05-31" style="color:#000000">2023-05-31</option>
                                <option value="2023-06-01" style="color:#000000">2023-06-01</option>
                                <option value="2023-06-02" style="color:#000000">2023-06-02</option>
                                <option value="2023-06-03" style="color:#000000">2023-06-03</option>
                            </select>
                        </div>
                        <div class="form-group col-lg-3">
                            <div class="thumb">
                                <img src="/cinema/assets/images/ticket/city.png" alt="ticket">
                            </div>
                            <span class="type">지역</span>
                            <select class="select-bar form-control-sm" id="cityId" onchange="callCinema()" style="background: none; border-width: 0px;">
                                <option value="" style="color:#000000">지역 선택</option>
                                <c:forEach var="city" items="${citys}">
                                    <option value="${city.id}" style="color:#000000">${city.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-lg-3">
                            <div class="thumb">
                                <img src="/cinema/assets/images/ticket/cinema.png" alt="ticket">
                            </div>
                            <span class="type">영화관</span>
                            <select class="select-bar form-control-sm" id="cinemaId" onchange="findSchedule()" style="background: none; border-width: 0px;">
                                <option value="">영화관 선택</option>
                            </select>
                        </div>
                    </form>

                    <form class="ticket-search-form">
                        <div class="form-group col-lg-3"></div>
                        <div class="form-group col-lg-3"></div>
                        <div class="form-group col-lg-3">
                            <div class="col-md-2"></div>
                            <div class="col-md-10" id="cityErr">
                            </div>
                        </div>
                        <div class="form-group col-lg-3">
                            <div class="col-md-2"></div>
                            <div class="col-md-10" id="cinemaErr">

                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Ticket-Search========== -->

<!-- ==========Movie-Section========== -->
<section class="movie-section padding-top padding-bottom">
    <div class="container">

        <div class="col-lg-12">
            <div class="article-section padding-bottom">
                <div class="section-header-1">
                    <h2 class="title">무비차트</h2>
                    <a class="view-all" href="/csmovie/movies">전체 보기</a>
                </div>
                <div class="row mb-30-none justify-content-center">
                    <c:forEach var="movie" items="${top4}" varStatus="status">
                        <div class="col-sm-6 col-lg-3">
                            <div class="movie-grid">
                                <div class="movie-thumb c-thumb">
                                    <a href="/csmovie/movies/${movie.id}">
                                        <img src="/csmovie/images/${movie.poster}" alt="movie">
                                    </a>
                                </div>
                                <div class="movie-content bg-one">
                                    <h5 class="title m-0">
                                        <a href="/csmovie/movies/${movie.id}"><span class="color-theme">${status.count}</span>&nbsp; ${movie.title}</a>
                                    </h5><br><br>
                                    <div class="widget-1 widget-tags">
                                        <ul>
                                           <li><a>예매율: &nbsp;${ratio.get(status.index)}%</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="tab">
            <div class="section-header-2">
                <div class="left">
                    <h2 class="title">영화</h2>
                </div>
                <ul class="tab-menu">
                    <li class="active">
                        현재 상영작
                    </li>
                    <li>
                        개봉 예정작
                    </li>
                </ul>
            </div>
        <!--    <div class="tab-area mb-30-none">
                <div class="tab-item active">
                    <div class="owl-carousel owl-theme tab-slider">
                        <c:set var="now" value="<%=LocalDate.now()%>"/>
                        <c:forEach var="movie" items="${movies}" varStatus="status">
                            <c:if test="${movie.releaseDate <= '2023-02-28'}">
                                <div class="item">
                                    <div class="movie-grid">
                                        <div class="movie-thumb c-thumb">
                                            <a href="/csmovie/movies/${movie.id}">
                                                <img src="/csmovie/images/${movie.poster}" alt="movie">
                                            </a>
                                        </div>
                                        <div class="movie-content bg-one">
                                            <h5 class="title m-0">
                                                <a href="/csmovie/movies/${movie.id}">${movie.title}</a>
                                            </h5><br><br>
                                            <div class="widget-1 widget-tags">
                                                <ul>
                                                    <c:forEach var="format" items="${formats.get(status.index)}">
                                                        <li><a>${format}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-item">
                    <div class="owl-carousel owl-theme tab-slider">
                        <c:set var="now" value="<%=LocalDate.now()%>"/>
                        <c:forEach var="movie" items="${movies}" varStatus="status">
                            <c:if test="${movie.releaseDate > '2021-07-13'}">
                                <div class="item">
                                    <div class="movie-grid">
                                        <div class="movie-thumb c-thumb">
                                            <a href="/csmovie/movies/${movie.id}">
                                                <img src="/csmovie/images/${movie.poster}" alt="movie">
                                            </a>
                                        </div>
                                        <div class="movie-content bg-one">
                                            <h5 class="title m-0">
                                                <a href="/csmovie/movies/${movie.id}">${movie.title}</a>
                                            </h5><br><br>
                                            <div class="widget-1 widget-tags">
                                                <ul>
                                                    <c:forEach var="format" items="${formats.get(status.index)}">
                                                        <li><a>${format}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>--!>
        </div>
    </div>
</section>
<!-- ==========Movie-Section========== -->

<!-- ==========Event-Section========== -->
<section class="event-section padding-top padding-bottom bg-four">
    <div class="container">
        <div class="tab">
            <div class="section-header-2">
                <div class="left">
                    <h2 class="title">리뷰</h2>
                </div>
                <ul class="tab-menu">
                    <li class="active">
                        인기순
                    </li>
                    <li>
                        최신순
                    </li>
                </ul>
            </div>
            <div class="tab-area mb-30-none">
                <div class="tab-item active">
                    <div class="owl-carousel owl-theme tab-slider">
                        <c:forEach items="${popularReviews}" var="review">
                        <div class="item">
                                <div class="event-grid">
                                    <div class="movie-thumb c-thumb" style="height: 250px;background: white;overflow: hidden">
                                        <a href="/csmovie/reviews/${review.id}">
                                            <img src="/csmovie/reviews/images/${review.image}" style="min-height: 250px;">
                                        </a>
                                    </div>
                                    <div class="post-item">
                                        <div class="post-content">
                                            <div class="post-header" style="padding-bottom: 10px;">
                                                <div class="meta-post">
                                                    <a style="margin-right: 1.0em"><i class="flaticon-view"></i>${review.view} View</a>
                                                    <a><i class="flaticon-conversation"></i>${review.commentCount} Comments</a>
                                                </div>
                                                <h4 class="title">
                                                    <a href="/csmovie/reviews/${review.id}" style="height: 2.3em;line-height: 1.2">
                                                        ${review.title}
                                                    </a>
                                                </h4>
                                                <div style="color: #ffffff">영화:
                                                    <a href="/csmovie/movies/${review.movieId}" style="color: #dbe2fb">
                                                            ${review.movie.title}
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="entry-content" style="padding-top: 10px;">
                                                <div class="left">
                                                    <span class="date"  >${review.reportingDate}  BY</span>
                                                    <div class="authors">
                                                        <div class="thumb">
                                                            <a><img src="/csmovie/members/images/${review.member.image}" alt="#0" style="height: 30px;"></a>
                                                        </div>
                                                        <h6 class="title"><a >${review.member.name}</a></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-item">
                    <div class="owl-carousel owl-theme tab-slider">
                        <c:forEach items="${recentReviews}" var="review">
                            <div class="item">
                                <div class="event-grid">
                                    <div class="movie-thumb c-thumb" style="height: 250px;background: white;overflow: hidden">
                                        <a href="/csmovie/reviews/${review.id}">
                                            <img src="/csmovie/reviews/images/${review.image}" style="min-height: 250px;">
                                        </a>
                                    </div>
                                    <div class="post-item">
                                        <div class="post-content">
                                            <div class="post-header" style="padding-bottom: 10px;">
                                                <div class="meta-post">
                                                    <a style="margin-right: 1.0em"><i class="flaticon-view"></i>${review.view} View</a>
                                                    <a><i class="flaticon-conversation"></i>${review.commentCount} Comments</a>
                                                </div>
                                                <h4 class="title">
                                                    <a href="/csmovie/reviews/${review.id}" style="height: 2.3em;line-height: 1.2">
                                                            ${review.title}
                                                    </a>
                                                </h4>
                                                <div style="color: #ffffff">영화:
                                                    <a href="/csmovie/movies/${review.movieId}" style="color: #dbe2fb">
                                                            ${review.movie.title}
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="entry-content" style="padding-top: 10px;">
                                                <div class="left">
                                                    <span class="date"  >${review.reportingDate}  BY</span>
                                                    <div class="authors">
                                                        <div class="thumb">
                                                            <a><img src="/csmovie/members/images/${review.member.image}" alt="#0" style="height: 30px;"></a>
                                                        </div>
                                                        <h6 class="title"><a >${review.member.name}</a></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Event-Section========== -->

<c:import url="footer.jsp"/>

</body>

<script>
    function move(movieTitle) {

    }
    function callCinema() {
        var cityId = $("#cityId").val();

        if(cityId != "" && cinemaId != "") {
            $("#cityErr").children().remove();
            $("#cinemaErr").children().remove();
        }

        $.ajax({
            url: "/csmovie/schedules/cinemaAjax",
            data: cityId,
            type:"POST",
            contentType: "application/json; charset=UTF-8",
            error: function(){
                $("#cinemaId").children().remove();
                var item = "";
                item +=
                    "<option value=\"\" style=\"color:#000000\">영화관 선택</option>";
                $("#cinemaId").html(item);
            },
            success: function (cinemas){
                $("#cinemaId").children().remove();
                var item = "";
                item +=
                    "<option value=\"\" style=\"color:#000000\">영화관 선택</option>";
                for(var i=0;i<cinemas.length;i++) {
                    item +=
                        "<option value=\"" + cinemas[i].id + "\" style=\"color:#000000\">" + cinemas[i].name + "</option>"
                }
                $("#cinemaId").html(item);
            }
        });
    }
</script>

</html>