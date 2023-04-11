<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: 201712029@office.induk.ac.kr
  Date: 2021-07-11
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp"/>

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>
</head>

<body onload="appraisalsList(${movieDetail.id}, 3)">

<c:import url="../main/nav.jsp"/>

<!-- ==========Banner-Section========== -->
<section class="details-banner bg_img" data-background="/cinema/assets/images/banner/banner03.jpg">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-thumb">
                <img src="/csmovie/movies/images/${movieDetail.poster}" alt="movie">
                <c:forEach var="movieAd" items="${movieDetail.movieAdList}">
                    <c:if test="${movieAd.kind == 'video'}">
                        <a href="${movieAd.file}" class="video-popup">
                            <img src="/cinema/assets/images/movie/video-button.png" alt="movie">
                        </a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="details-banner-content offset-lg-3">
                <h3 class="title">${movieDetail.title}</h3>
                <div class="tags">
                    <a>${movieDetail.language}</a>
                </div>
                <a class="button">${movieDetail.genreName}</a>
                <div class="social-and-duration">
                    <div class="duration-area">
                        <div class="item">
                            <i class="fas fa-calendar-alt"></i><span>${movieDetail.releaseDate}</span>
                        </div>
                        <div class="item">
                            <i class="far fa-clock"></i><span>${movieDetail.showTimes}분</span>
                        </div>
                    </div>
                    <ul class="social-share">
                        <li><a href="https://ko-kr.facebook.com/enespanol/"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://twitter.com/?lang=ko"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="https://www.pinterest.co.kr/"><i class="fab fa-pinterest-p"></i></a></li>
                        <li><a href="https://www.instagram.com/"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a href="https://www.google.co.kr/"><i class="fab fa-google-plus-g"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Book-Section========== -->
<section class="book-section bg-one">
    <div class="container">
        <div class="book-wrapper offset-lg-3">
            <div class="left-side">
                <div class="item">
                    <div class="item-header">
                        <div class="thumb">
                            <i class="fas fa-ticket-alt"></i>
                        </div>
                        <div class="counter-area">
                            <span class="counter-item odometer" data-odometer-final="${movieDetailRank.ratio}">0</span>
                        </div>
                    </div>
                    <p>예매율</p>
                </div>
                <div class="item">
                    <div class="item-header">
                        <div class="thumb">
                            <i class="fas fa-user-friends"></i>
                        </div>
                        <div class="counter-area">
                            <span class="counter-item odometer people" data-odometer-final="${movieDetailRank.audience}">0</span>
                        </div>
                    </div>
                    <p>누적관객수</p>
                </div>
                <div class="item">
                    <div class="item-header">
                        <h5 class="title" id="movieRating">4.5</h5>&nbsp;&nbsp;
                        <div class="rating" id="ratingValue">
                            <i class="fas fa-heart"></i>
                            <i class="fas fa-heart"></i>
                            <i class="fas fa-heart"></i>
                            <i class="fas fa-heart"></i>
                            <i class="fas fa-heart"></i>
                        </div>
                    </div>
                    <p>관람객 평점</p>
                </div>
            </div>
            <a href="/csmovie/schedules?title=${movieDetail.title}&cityId=&cinemaId=&date=" class="custom-button">예매</a>
        </div>
    </div>
</section>
<!-- ==========Book-Section========== -->

<!-- ==========Movie-Section========== -->
<section class="movie-details-section padding-top padding-bottom">
    <div class="container">
        <div class="row justify-content-center flex-wrap-reverse mb--50">
            <div class="col-lg-3 col-sm-10 col-md-6 mb-50">
                <div class="widget-1 widget-tags">
                    <ul>
                        <c:forEach var="format" items="${movieDetail.formatList}">
                            <li><a>${format}</a></li>
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
                    <h3 class="title">photos</h3>
                    <div class="details-photos owl-carousel">
                        <c:forEach var="movieAd" items="${movieDetail.movieAdList}">
                            <c:if test="${movieAd.kind == 'image'}">
                                <div class="thumb">
                                    <a href="/csmovie/movies/images/${movieAd.file}/movieAd" class="img-pop">
                                        <img src="/csmovie/movies/images/${movieAd.file}/movieAd" alt="movie">
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="tab summery-review">
                        <ul class="tab-menu">
                            <li class="active">
                                정보
                            </li>
                            <li>
                                평점 <span id="appraisalCount">147</span>
                            </li>
                        </ul>
                        <div class="tab-area">
                            <div class="tab-item active">
                                <div class="item">
                                    <h5 class="sub-title">내용</h5>
                                    <p>${movieDetail.summary}</p>
                                </div>
                                <div class="item">
                                    <div class="header">
                                        <h5 class="sub-title">감독 및 배우</h5>
                                        <div class="navigation">
                                            <div class="cast-prev"><i class="flaticon-double-right-arrows-angles"></i></div>
                                            <div class="cast-next"><i class="flaticon-double-right-arrows-angles"></i></div>
                                        </div>
                                    </div>
                                    <div class="casting-slider owl-carousel">
                                        <div class="cast-item">
                                            <div class="cast-thumb">
                                                <a>
                                                    <img src="/csmovie/movies/images/${movieDetail.directorImage}/director" alt="cast" style="height: 110px; width: 110px">
                                                </a>
                                            </div>
                                            <div class="cast-content">
                                                <h6 class="cast-title"><a>${movieDetail.directorName}</a></h6>
                                                <span class="cate">감독</span>
                                            </div>
                                        </div>

                                        <c:forEach var="actor" items="${movieDetail.actorList}">
                                            <div class="cast-item">
                                                <div class="cast-thumb">
                                                    <a>
                                                        <img src="/csmovie/movies/images/${actor.image}/actor" alt="cast" style="height: 110px; width: 110px">
                                                    </a>
                                                </div>
                                                <div class="cast-content">
                                                    <h6 class="cast-title"><a href="#0">${actor.name}</a></h6>
                                                    <span class="cate">배우</span>
                                                    <p>${actor.role}</p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-item">
                                <div id="movie-review-itmes">

                                </div>

                                <!-- 평점 입력 화면 -->
                                <div class="movie-review-item" id="appraisalToggle" style="display: none;">
                                    <div class="author">
                                        <div class="thumb">
                                            <a>
                                                <img src="/csmovie/appraisals/images/${sessionScope.member.image}" alt="cast" style="height: 54px;width: 54px">
                                            </a>
                                        </div>
                                        <div class="movie-review-info">
                                            <%
                                                LocalDate now = LocalDate.now();
                                            %>
                                            <span class="reply-date"><%=now%></span>
                                            <h6 class="subtitle"><a href="#0">${sessionScope.member.name}</a></h6>
                                        </div>
                                    </div>
                                    <div class="movie-review-content">
                                        <form action="#0" method="post" id="form1">
                                            <table class="table table-borderless">
                                                <tbody>
                                                    <tr>
                                                        <td width="100%">
                                                            <div class="make_heart">
                                                                <i class="fas fa-heart fa-3x" style="color: #f1481f"></i>
                                                                <i class="fas fa-heart fa-3x"></i>
                                                                <i class="fas fa-heart fa-3x"></i>
                                                                <i class="fas fa-heart fa-3x"></i>
                                                                <i class="fas fa-heart fa-3x"></i>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="100%">
                                                            <input type="text" name="title" id="title" class="form-control" placeholder="제목" required>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="100%">
                                                            <textarea name="content" id="content" rows="3" class="form-control" placeholder="내용" required></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="100%">
                                                            <input type="hidden" id="movieId" name="movieId" value="${movieDetail.id}">
                                                            <input type="hidden" id="memberId" name="memberId" value="${sessionScope.member.id}">
                                                            <input type="hidden" id="grade" name="grade" value="1">
                                                            <input type="button" id="submit" class="btn btn-sm btn-primary"  value="저장" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>

                                <!-- 평점 수정 화면 -->
                                <div class="movie-review-item" id="appraisalUpdateToggle" style="display: none;">
                                    <div class="author">
                                        <div class="thumb">
                                            <a>
                                                <img src="/csmovie/appraisals/images/${sessionScope.member.image}" alt="cast" style="height: 54px;width: 54px">
                                            </a>
                                        </div>
                                        <div class="movie-review-info">
                                            <%
                                                LocalDate now2 = LocalDate.now();
                                            %>
                                            <span class="reply-date"><%=now2%></span>
                                            <h6 class="subtitle"><a href="#0">${sessionScope.member.name}</a></h6>
                                        </div>
                                    </div>
                                    <div class="movie-review-content">
                                        <form action="#0" method="post" id="form2">
                                            <table class="table table-borderless">
                                                <tbody>
                                                <tr>
                                                    <td width="100%">
                                                        <div class="make_heart">
                                                            <i class="fas fa-heart fa-3x" style="color: #f1481f"></i>
                                                            <i class="fas fa-heart fa-3x"></i>
                                                            <i class="fas fa-heart fa-3x"></i>
                                                            <i class="fas fa-heart fa-3x"></i>
                                                            <i class="fas fa-heart fa-3x"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%">
                                                        <input type="text" name="titleUpdate" id="titleUpdate" class="form-control" placeholder="제목" required>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%">
                                                        <textarea name="contentUpdate" id="contentUpdate" rows="3" class="form-control" placeholder="내용" required></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%">
                                                        <input type="hidden" id="id2" name="id">
                                                        <input type="hidden" id="movieId2" name="movieId" value="${movieDetail.id}">
                                                        <input type="hidden" id="grade2" name="grade" value="1">
                                                        <input type="button" id="update" class="btn btn-sm btn-primary"  value="수정" />
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${empty sessionScope.member}">
                                        <div class="load-more text-center">
                                            <a href="#0" onclick="loginCheck();" class="custom-button transparent">내 평가 작성</a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="load-more text-center">
                                            <a href="#0" class="custom-button transparent" id="appraisal">내 평가 작성</a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="load-more text-center">
                                    <a href="#0" onclick="paging(${movieDetail.id});" id="loadMore" data-rate="3" class="custom-button transparent">load more</a>
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

<!-- ==========Newslater-Section========== -->
<c:import url="../main/footer.jsp"/>

<script>
    // 평가 작성 버튼 클릭시 로그인 페이지로 리다이렉트
    function loginCheck() {
        var check = confirm("로그인이 필요한 서비스입니다. \n로그인 페이지로 이동하시겠습니까?");
        if (check == true) {
            window.location.href = '/csmovie/members/login?historyUrl=' + window.location.pathname;
        } else if (check == false) {
            return 0;
        }
    }

    // validation
    var markingErrorField = function (response) {
        const errorFields = response.responseJSON.errors;

        if(!errorFields) {
            alert(response.response.message);
            return;
        }

        var $field, error;
        for (var i=0, length = errorFields.length; i < length; i++) {
            error = errorFields[i];
            $field = $('#' + error['field']);

            if($field && $field.length > 0) {
                $field.siblings('.error-message').remove();
                $field.after('<span class="error-message text-danger">' + error.defaultMessage + '</span>');
            }
        }
    };

    // 날짜 차이 계산 함수
    function dateDiff(_date1, _date2) {
        var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
        var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

        diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
        diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());

        var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
        diff = Math.ceil(diff / (1000 * 3600 * 24));

        return diff;
    }

    function like(count, movieId, id) {
        $(function() {
           $.ajax({
               type: "post",
               url: "/csmovie/appraisals/like",
               data: {
                   count: count,
                   id: id
               },
               success: function () {
                   var page = $('#loadMore').attr('data-rate');
                   appraisalsList(movieId, page);
               }
           });
        });
    }

    function hate(count, movieId, id) {
        $(function() {
            $.ajax({
                type: "post",
                url: "/csmovie/appraisals/hate",
                data: {
                    count: count,
                    id: id
                },
                success: function () {
                    var page = $('#loadMore').attr('data-rate');
                    appraisalsList(movieId, page);
                }
            });
        });
    }

    // 평점 삭제
    function appraisalsDelete(id) {
        console.log(id);

        var con_test = confirm("삭제할까요 ?");
        if (con_test == true) {
            $(function() {
                $.ajax({
                    type: "post",
                    url: "/csmovie/appraisals/delete",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        var page = $('#loadMore').attr('data-rate');
                        appraisalsList(data, page);
                    }
                });
            });
        } else if (con_test == false) {
            return 0;
        }
    }

    // 평점 수정 클릭 시
    function appraisalsUpdate(title, content, grade, id) {
        $("#titleUpdate").siblings('.error-message').remove();
        $("#contentUpdate").siblings(".error-message").remove();

        $("#appraisalToggle").hide();
        $("#appraisalUpdateToggle").toggle();

        console.log(content);

        $("#titleUpdate").val(title);
        $("#contentUpdate").val(content);
        $('input[name=grade]').attr('value', grade);
        $('input[name=id]').attr('value', id);

        $('.make_heart i').css({color:'#222529'});
        $('.make_heart i:nth-child(-n+' + grade + ')').css({color:'#f1481f'});
    }

    // 평점 수정
    $(function () {
        $("#update").on("click", function() {
            $("#titleUpdate").siblings('.error-message').remove();
            $("#contentUpdate").siblings(".error-message").remove();

            var form2 = $("#form2").serialize();

            console.log(form2);
            $.ajax({
                type: "post",
                url: "/csmovie/appraisals/update",
                data: form2,
                dataType: 'json',
                success: function (data) {
                    $("#appraisalUpdateToggle").toggle();

                    var page = $('#loadMore').attr('data-rate');
                    appraisalsList(data, page);
                },
                error: function (response) {
                    markingErrorField(response);
                }
            });
        });
    });

    // 평점 목록
    function appraisalsList(movieId, page) {
        console.log(movieId);
        $(function() {
            $.ajax({
                type: "post",
                url: "/csmovie/appraisals",
                data: {
                    movieId: movieId
                },
                success: function (data) {
                    console.log(data);
                    console.log(page);

                    let res = "";
                    var grade = 0;

                    for(let i=0; i<data.length; i++) {
                        grade += data[i].grade;

                        var diff = dateDiff(data[i].reportingDate, new Date());
                        var date = diff == 0 ? "오늘" : diff + "일 전";
                        if(i < page) {
                            res += "<div class=\"movie-review-item\">\n";
                        }
                        else {
                            res += "<div class=\"movie-review-item\" style='display: none'>\n";
                        }
                        var memberId = ${sessionScope.member.id}

                        res += "                                    <div class=\"author\">\n" +
                            "                                        <div class=\"thumb\">\n" +
                            "                                            <a href=\"#0\">\n" +
                            "                                                <img src=\"/csmovie/appraisals/images/" + data[i].memberImage + "\" alt=\"cast\" style=\"height: 54px;width: 54px\">\n" +
                            "                                            </a>\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"movie-review-info\">\n" +
                            "                                            <span class=\"reply-date\">" + date + "</span>\n" +
                            "                                            <h6 class=\"subtitle\"><a href=\"#0\">" + data[i].memberName + "</a></h6>\n" +
                            "                                            <span><i class=\"fas fa-check\"></i> verified review</span>\n" +
                            "                                        </div>\n" +
                            "                                    </div>\n" +
                            "                                    <div class=\"movie-review-content\">\n" +
                            "                                        <div class=\"rating\" data-rate=\"" + data[i].grade + "\">\n" +
                            "                                            <i class=\"flaticon-favorite-heart-button\"></i>\n" +
                            "                                            <i class=\"flaticon-favorite-heart-button\"></i>\n" +
                            "                                            <i class=\"flaticon-favorite-heart-button\"></i>\n" +
                            "                                            <i class=\"flaticon-favorite-heart-button\"></i>\n" +
                            "                                            <i class=\"flaticon-favorite-heart-button\"></i>\n" +
                            "                                        </div>\n" +
                            "                                        <h6 class=\"cont-title\">" + data[i].title + "</h6>\n" +
                            "                                        <p>" + data[i].content + "</p>\n" +
                            "                                        <div class=\"review-meta\">\n" +
                            "                                            <a href=\"#0\" onclick=\"like(" + data[i].likeCount + "," + data[i].movieId + "," + data[i].id + ")\">\n" +
                            "                                                <i class=\"flaticon-hand\"></i><span>" + data[i].likeCount + "</span>\n" +
                            "                                            </a>\n" +
                            "                                            <a href=\"#0\" class=\"dislike\" onclick=\"hate(" + data[i].hateCount + "," + data[i].movieId + "," + data[i].id + ")\">\n" +
                            "                                                <i class=\"flaticon-dont-like-symbol\"></i><span>" + data[i].hateCount + "</span>\n" +
                            "                                            </a>\n";
                            if(memberId == data[i].memberId) {
                                res += "                                         <a href=\"#0\" onclick=\"appraisalsDelete(" + data[i].id + ")\">\n"+
                                    "                                                삭제\n" +
                                    "                                            </a>\n" +
                                    "                                            <a href=\"#0\" onclick=\"appraisalsUpdate('" + data[i].title + "','" + data[i].content + "'," + data[i].grade + "," + data[i].id + ")\">\n" +
                                    "                                               수정\n" +
                                    "                                            </a>\n";
                            }
                        res += "                                        </div>\n" +
                            "                                    </div>\n" +
                            "                                </div>";
                    }
                    $("#movie-review-itmes").html(res);

                    grade = grade / data.length;
                    $("#appraisalCount").text(data.length);
                    $('#movieRating').text(isNaN(grade) ? '0' : grade.toFixed(1));
                    $('#ratingValue').attr("data-rate", Math.round(grade));

                    var rating = $('.rating');

                    rating.each(function() {
                        var targetScore = $(this).attr('data-rate');
                        console.log(targetScore);

                        $(this).find('i:nth-child(-n+' + targetScore + ')').css({color: '#f1481f'});
                    });
                }
            })
        });
    }

    // 평점 작성 버튼 클릭시 토글
    $(function () {
       $("#appraisal").click(function () {
           $("#title").siblings('.error-message').remove();
           $("#content").siblings(".error-message").remove();

           $('#title').val("");
           $('#content').val("");

           $("#appraisalUpdateToggle").hide();

           $('.make_heart i').css({color:'#222529'});
           $('.make_heart i:nth-child(1)').css({color:'#f1481f'});
           $('input[name=grade]').attr('value', 1);

           $("#appraisalToggle").toggle();
       });
    });

    // 하트 클릭시 색칠
    $(function () {
        $('.make_heart i').click(function() {
            var targetNum = $(this).index() + 1;
            $('input[name=grade]').attr('value', targetNum);

            $('.make_heart i').css({color:'#222529'});
            $('.make_heart i:nth-child(-n+' + targetNum + ')').css({color:'#f1481f'});
        });
    });

    // 평점 저장
    $(function () {
       $("#submit").on("click", function() {
           $("#title").siblings('.error-message').remove();
           $("#content").siblings(".error-message").remove();

           var form1 = $("#form1").serialize();

           console.log(form1);
           $.ajax({
               type: "post",
               url: "/csmovie/appraisals/add",
               data: form1,
               dataType: 'json',
               success: function (data) {
                   $("#appraisalToggle").toggle();
                   $('#form1').each(function() {
                       this.reset();
                   });
                   $('.make_heart i').css({color:'#222529'});
                   $('.make_heart i:nth-child(1)').css({color:'#f1481f'});

                   var page = $('#loadMore').attr('data-rate');
                   appraisalsList(data, page);
               },
               error: function (response) {
                   markingErrorField(response);
               }
           });
       });
    });

    function paging(movieId) {
        var page = $('#loadMore').attr("data-rate");
        $('#loadMore').attr("data-rate", Number(page)+3);

        appraisalsList(movieId, Number(page)+3);
    }
</script>

</body>

</html>
