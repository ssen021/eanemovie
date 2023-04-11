<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-07-06
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp"/>

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>


</head>

<c:import url="../main/nav.jsp"/>

<style>
    .seat-plan-wrapper li .movie-schedule {
        width: calc(100% - 45%);
        padding: 30px;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: start;
        margin: -5px;
    }

    .seat-plan-wrapper li .movie-schedule .item {
        color: #ffffff;
        padding: 5px;
        width: 70px;
        background: #162f5f;
        position: relative;
        mask-position: center center;
        -webkit-mask-position: center center;
        text-align: center;
        mask-image: url(/cinema/assets/css/img/movie-seat.png);
        -webkit-mask-image: url(/cinema/assets/css/img/movie-seat.png);
        -webkit-mask-repeat: no-repeat;
        mask-repeat: no-repeat;
        -webkit-mask-size: 100% 100%;
        mask-size: 100% 100%;
        cursor: pointer;
        -webkit-transition: all ease 0.3s;
        transition: all ease 0.3s;
        margin: 5px;

        display: flex;
        align-items: center;
        justify-content: center;
    }

</style>

<!-- ==========Banner-Section========== -->
<section class="details-banner bg_img" data-background="/cinema/assets/images/banner/banner03.jpg">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-content offset-lg-2">
                <h3 class="title">${cinema.name}</h3>
                <div class="tags">
                    <!--
                    <a href="#0">English</a>
                    <a href="#0">Hindi</a>
                    <a href="#0">Telegu</a>
                    <a href="#0">Tamil</a>
                    -->
                </div>
                <div class="social-and-duration">
                    <div class="duration-area">
                        <div class="item">
                            <span><c:if test="${cinema.subtitle != null}">${cinema.subtitle}</c:if></span>
                        </div>
                        <!--
                        <div class="item">
                            <i class="far fa-clock"></i><span>2 hrs 50 mins</span>
                        </div>
                        -->
                    </div>
                    <ul class="social-share">
                        <li><a href="https://www.facebook.com/megaboxon"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://twitter.com/megaboxon"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="http://instagram.com/megaboxon"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a href="https://play.google.com/store/apps/details?id=com.megabox.mop"><i class="fab fa-google-play"></i></a></li>
                        <li><a href="https://itunes.apple.com/kr/app/megabox/id894443858?l=ko&ls=1&mt=8"><i class="fab fa-apple"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Movie-Section========== -->
<section class="movie-details-section padding-top padding-bottom">
    <div class="container">
        <div class="row justify-content-center flex-wrap-reverse mb--50">
            <div class="col-lg-3 col-sm-10 col-md-6 mb-50">
                <div class="widget-1 widget-offer widget-tags">
                    <h3 class="title">보유 시설</h3>
                    <ul>
                        <c:forEach var="facility" items="${facilitys}">
                        <li>
                            <a href="" style="pointer-events: none; cursor: default;">${facility}</a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="widget-1 widget-offer">
                    <h3 class="title">Event</h3>
                    <div class="offer-body">
                        <c:forEach var="event" items="${events}">
                            <div class="offer-item">
                                <div class="thumb">
                                    <img src="/csmovie/movies/images/${event.thumStoreFilename}/event" style="width: 100%;" alt="sidebar">
                                </div>
                                <div class="content">
                                    <h6>
                                        <a href="/csmovie/events/${event.id}">${event.title}</a>
                                    </h6>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 mb-50">
                <div class="movie-details">
                    <div class="tab summery-review">
                        <ul class="tab-menu">
                            <li class="active">
                                극장정보
                            </li>
                            <li>
                                상영시간표
                            </li>
                            <li>
                                관람료
                            </li>
                        </ul>
                        <div class="tab-area">
                            <div class="tab-item active">
                                <div class="item" style="margin-bottom:15px;">
                                    <p style="font-size:20px; margin-top:60px;">${fn:replace(cinema.introduction, replaceChar, "<br>")}</p>
                                </div>
                                <div class="item" style=""><div class="header"></div></div>

                                <div class="item">
                                    <div class="header">
                                        <h5 class="sub-title">주차 안내</h5>
                                    </div>
                                    <div class="blog-author">
                                        <div style="font-size: 100px;">
                                            <i class="fas fa-parking"></i>
                                        </div>
                                        <div class="author-content">
                                            <h5 class="title">
                                            </h5>
                                            <p>
                                                ${fn:replace(cinema.parking, replaceChar, "<br>")}
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="header">
                                        <h5 class="sub-title">영화관 위치
                                            <div class="item">
                                                <span style="font-size:15px; margin-top:5px;">도로명 주소 : ${cinema.address}</span>
                                            </div>
                                        </h5>
                                    </div>
                                    <div>
                                        <iframe src="${cinema.mapAddress}" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-item">
                                <div class="container">

                                    <div class="filter-area">
                                        <div class="filter-main">
                                            <div class="left w-100 justify-content-between">
                                                <div class="item">
                                                    <span class="show">날짜 선택 :</span>
                                                    <%--
                                                        <%LocalDate date = LocalDate.now();%>
                                                    --%>
                                                    <select id="dateCombo" class="select-bar" onchange="findSchedule(${cinema.id})">
                                                        <option value="2023-05-29" selected>2023-05-29</option>
                                                        <option value="2023-05-30">2023-05-30</option>
                                                        <option value="2023-05-31">2023-05-31</option>
                                                        <option value="2023-06-01">2023-06-01</option>
                                                        <option value="2023-06-02">2023-06-02</option>
                                                        <option value="2023-06-03">2023-06-03</option>
                                                    </select>
                                                </div>
                                                <div class="item mr-0">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center">
                                        <div class="col-lg-12 mb-5 mb-lg-0" id="scheduleForm">
                                            <c:forEach var="movie" items="${movies}">
                                            <div class="details-banner-content" style="margin-bottom:30px;">
                                                <div class="social-and-duration">
                                                    <div class="duration-area" >
                                                        <div class="item">
                                                            <span>${movie.scheduleForm.movie_title}/${movie.scheduleForm.movie_rating}</span>
                                                        </div>
                                                    </div>
                                                    <ul class="social-share" style="padding-right: 10px;">
                                                        <span>상영중/상영시간${movie.scheduleForm.movie_showtimes}분</span>
                                                    </ul>
                                                </div>
                                                <ul class="seat-plan-wrapper bg-five">
                                                    <c:forEach var="theater" items="${theaters}">
                                                    <c:if test="${theater.movie_id == movie.movie_id}">
                                                    <li>
                                                        <div class="movie-name">
                                                            <div>
                                                                <h5>${theater.scheduleForm.theater_name}</h5>총${theater.scheduleForm.theater_seat}석
                                                            </div>
                                                            <div>
                                                                ${theater.screening_format}
                                                            </div>
                                                        </div>
                                                        <div class="movie-schedule">
                                                            <c:forEach var="schedule" items="${schedulestests}">
                                                                <c:if test="${schedule.theater_id == theater.theater_id and schedule.movie_id == theater.movie_id and schedule.screening_format == theater.screening_format}">
                                                                    <div class="item" onclick="move(${schedule.id})">
                                                                        <c:set var="start_time" value="${schedule.start_time}"/>
                                                                        <%
                                                                            String start_time = (String)pageContext.getAttribute("start_time");
                                                                            start_time = start_time.substring(0,5);
                                                                            pageContext.setAttribute("start_time", start_time) ;
                                                                        %>
                                                                        ${start_time}
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </li>
                                                    </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-item">
                                <div>
                                    <c:forEach var="facility" items="${facilitys}">
                                        <c:if test="${facility == '일반상영관'}">
                                            <div style="float:left; width:50%;">
                                                <p style="margin-top:20px;">  2D</p>
                                                <div class="table-wrap">
                                                    <table class="data-table a-c" summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다." style="text-align: center;">
                                                        <colgroup>
                                                            <col>
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">요일</th>
                                                                <th scope="col">상영시간</th>
                                                                <th scope="col">일반</th>
                                                                <th scope="col">청소년</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <th scope="rowgroup" rowspan="3">월~목</th>
                                                            <td>조조 (06:00~)</td>
                                                            <td>10,000</td>
                                                            <td>10,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>일반 (10:01~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>심야 (23:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="rowgroup" rowspan="3">금~일<br>공휴일</th>
                                                            <td>조조 (06:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>일반 (10:01~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>심야 (23:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div style="float:left; width:50%;">
                                                <p style="margin-top:20px;">  3D</p>
                                                <div class="table-wrap">
                                                    <table class="data-table a-c" summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다." style="text-align: center;">
                                                        <colgroup>
                                                            <col>
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                        </colgroup>
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">요일</th>
                                                                <th scope="col">상영시간</th>
                                                                <th scope="col">일반</th>
                                                                <th scope="col">청소년</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="rowgroup" rowspan="3">월~목</th>
                                                                <td>조조 (06:00~)</td>
                                                                <td>15,000</td>
                                                                <td>15,000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>일반 (10:01~)</td>
                                                                <td>15,000</td>
                                                                <td>15,000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>심야 (23:00~)</td>
                                                                <td>15,000</td>
                                                                <td>15,000</td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="rowgroup" rowspan="3">금~일<br>공휴일</th>
                                                                <td>조조 (06:00~)</td>
                                                                <td>15,000</td>
                                                                <td>15,000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>일반 (10:01~)</td>
                                                                <td>15,000</td>
                                                                <td>15,000</td>
                                                            </tr>
                                                            <tr>
                                                                <td>심야 (23:00~)</td>
                                                                <td>15,000</td>
                                                                <td>15,000</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${facility == 'MX'}">
                                            <div style="float:left; width:50%;">
                                                <p style="margin-top:20px;">  MX 2D</p>
                                                <div class="table-wrap">
                                                    <table class="data-table a-c" summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다." style="text-align: center;">
                                                        <colgroup>
                                                            <col>
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                        </colgroup>
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">요일</th>
                                                            <th scope="col">상영시간</th>
                                                            <th scope="col">일반</th>
                                                            <th scope="col">청소년</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <th scope="rowgroup" rowspan="3">월~목</th>
                                                            <td>조조 (06:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>일반 (10:01~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>심야 (23:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="rowgroup" rowspan="3">금~일<br>공휴일</th>
                                                            <td>조조 (06:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>일반 (10:01~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>심야 (23:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div style="float:left; width:50%;">
                                                <p style="margin-top:20px;">  MX 3D</p>
                                                <div class="table-wrap">
                                                    <table class="data-table a-c" summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다." style="text-align: center;">
                                                        <colgroup>
                                                            <col>
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                            <col style="width:25%;">
                                                        </colgroup>
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">요일</th>
                                                            <th scope="col">상영시간</th>
                                                            <th scope="col">일반</th>
                                                            <th scope="col">청소년</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <th scope="rowgroup" rowspan="3">월~목</th>
                                                            <td>조조 (06:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>일반 (10:01~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>심야 (23:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="rowgroup" rowspan="3">금~일<br>공휴일</th>
                                                            <td>조조 (06:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>일반 (10:01~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        <tr>
                                                            <td>심야 (23:00~)</td>
                                                            <td>15,000</td>
                                                            <td>15,000</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Movie-Section========== -->

<c:import url="../main/footer.jsp"/>

</body>

<script>
    function findSchedule(cinemaId) {
        var date = $("#dateCombo").val();

        $.ajax({
            type: "post",
            url: "/csmovie/cinemas/scheduleAjax",
            data: {
                date: date,
                cinemaId: cinemaId
            },
            success: function (schedules) {
                $("#scheduleForm").children().remove();

                var array_name = [];
                var array_time = [];
                var array_rating = [];

                for(var i=0;i<schedules.length;i++) {
                    if(array_name.indexOf(schedules[i].scheduleForm.movie_title) == -1){
                        array_name.push(schedules[i].scheduleForm.movie_title);
                        array_time.push(schedules[i].scheduleForm.movie_showtimes);
                        array_rating.push(schedules[i].scheduleForm.movie_rating);
                    }
                }

                var array_theater = [];
                var array_theater_id = [];
                var array_seat = [];
                var array_format = [];
                var array_movie = [];
                for(var i=0;i<schedules.length;i++){
                    array_theater.push(schedules[i].scheduleForm.theater_name);
                    array_theater_id.push(schedules[i].theater_id);
                    array_seat.push(schedules[i].scheduleForm.theater_seat);
                    array_format.push(schedules[i].screening_format);
                    array_movie.push(schedules[i].scheduleForm.movie_title);
                }

                var array_test1 = [];
                var array_test2 = [];
                array_test1.push(schedules[0].scheduleForm.movie_title);
                array_test2.push(schedules[0].screening_format);

                for(var i=1;i<schedules.length;i++) {
                    var x= array_test1.length;
                    var check = 0;
                    for(var j=0;j<x;j++) {
                        if (array_test1[j] == schedules[i].scheduleForm.movie_title && array_test2[j] == schedules[i].screening_format) {
                            check = 1;
                            break;
                        }
                    }

                    if(check != 1){
                        array_test1.push(schedules[i].scheduleForm.movie_title);
                        array_test2.push(schedules[i].screening_format);
                    }
                }

                var item = "";
                for(var a=0;a<array_name.length;a++){
                    item += "<div class=\"details-banner-content\" style=\"margin-bottom:30px;\">\n" +
                        "                                            <div class=\"social-and-duration\">\n" +
                        "                                                <div class=\"duration-area\" >\n" +
                        "                                                    <div class=\"item\">\n" +
                        "                                                        <span>" + array_name[a] + "/" + array_rating[a] + "</span>\n" +
                        "                                                    </div>\n" +
                        "                                                    <!--\n" +
                        "                                                    <div class=\"item\">\n" +
                        "                                                        <i class=\"far fa-clock\"></i><span>2 hrs 50 mins</span>\n" +
                        "                                                    </div>\n" +
                        "                                                    -->\n" +
                        "                                                </div>\n" +
                        "                                                <ul class=\"social-share\" style=\"padding-right: 10px;\">\n" +
                        "                                                    <span>상영중/상영시간 " + array_time[a] + "분</span>\n" +
                        "                                                </ul>\n" +
                        "                                        </div>";
                    var temp = [""];

                    for(var x=0;x<array_test1.length;x++) {
                        if(array_test1[x] == array_name[a]) {
                            for (var b = 0; b < array_theater_id.length; b++) {
                                if (array_movie[b] == array_test1[x] && array_format[b] == array_test2[x] && temp.indexOf(array_test1[x]+array_test2[x]) == -1) {
                                    item += "<ul class=\"seat-plan-wrapper bg-five\">\n" +
                                        "                        <li>\n" +
                                        "                            <div class=\"movie-name\">\n" +
                                        "                               <div>\n" +
                                        "                                   <h5>" + array_theater[b] + "</h5>총" + array_seat[b] + "석\n" +
                                        "                               </div>\n" +
                                        "                               <div>\n" +
                                        "                                  " + array_format[b] + "\n" +
                                        "                               </div>" +
                                        "                            </div>\n" +
                                        "                            <div class=\"movie-schedule\">\n";
                                    temp.push(array_test1[x]+array_test2[x]);
                                    for (var c = 0; c < schedules.length; c++) {
                                        if (array_test1[x] == schedules[c].scheduleForm.movie_title && array_theater_id[b] == schedules[c].theater_id && schedules[c].screening_format == array_test2[x]) {
                                            item +=
                                                "                                <div class=\"item\" onclick=\"move(" + schedules[c].id + ")\">\n" +
                                                "                                    " + schedules[c].start_time.substring(0,5) + "\n" +
                                                "                                </div>\n";
                                        }
                                    }
                                    item +=
                                        "                            </div>\n" +
                                        "                        </li>";
                                    "      </ul>";
                                } else {
                                    temp.push("");
                                }
                            }
                        }
                    }
                    item += "</div>";
                }
                $("#scheduleForm").html(item);

                console.log(window.sessionStorage.getItem("member"));
            }
        });
    }

    function move(scheduleId){

        location.href='/csmovie/reservations?scheduleId='+scheduleId;

    }

</script>

</html>