<%@ page import="com.induk.cinema.domain.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="com.induk.cinema.dto.SortType" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.induk.cinema.dto.SortType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class=" sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp" />

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>

    <style>
        .movie-selected-active{
            color: #31d7a9!important;
        }
        .review-write{
            color: #ffffffc2;
            padding: 5px 10px;
            border: 1px solid #ffffffc2;
            border-radius: 20px;
        }
        .review-write:hover{
            color: #ada9ea;
            border-color: #ada9ea;
            -webkit-transition: all 0.3s ease;
        }
        .myBtn:hover{
            color: #31d7a9!important;
            -webkit-transition: all 0.3s ease;
        }
        .page-color{
            color: #7a89bb;
        }
        .page-color:hover{
            color: white;
            -webkit-transition: all 0.3s ease;
        }
        .page-active{
            color: white;
        }
    </style>

</head>

<body>
    <c:import url="../main/nav.jsp" />

    <!-- ==========Banner-Section========== -->
    <section class="main-page-header speaker-banner bg_img" data-background="./assets/images/banner/banner07.jpg" style="background-image: url(&quot;./assets/images/banner/banner07.jpg&quot;);">
        <div class="container">
            <div class="speaker-banner-content">
                <h2 class="title">리뷰</h2>
                <ul class="breadcrumb">
                    <li>
                        <a href="/csmovie">
                            홈
                        </a>
                    </li>
                    <li>리뷰</li>
                </ul>
            </div>
        </div>
    </section>
    <!-- ==========Banner-Section========== -->

    <!-- ==========Blog-Section========== -->
    <section class="blog-section padding-top padding-bottom">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-9 mb-50 mb-lg-0">
                    <div class="filter-tab">
                        <div class="filter-area">
                            <div class="filter-main">
                                <div class="left w-100 justify-content-between">
                                    <div class="item">
                                        <span class="show">정렬 :</span>
                                        <select id="sortType" class="select-bar" onchange="dataSend(${params.searchMovieId},'${params.searchText}', ${params.currentPageNo})">
                                            <c:forEach items="${SortType.values()}" var="type">
                                                <c:choose>
                                                    <c:when test="${type.label == params.sortType}">
                                                        <option value="${type.label}" selected>${type.label}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${type.label}">${type.label}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="item mr-0">
                                        <a href="/csmovie/reviews/add" class="review-write"><i class="fas fa-feather-alt"></i> 리뷰 작성하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="reviewListForm" class="row mb-10 justify-content-center">
                            <c:forEach var="review" items="${reviews}">
                                <div class="col-sm-6 col-lg-4">
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
                        <div id="pagination" class="pagination-area text-center">
                            <c:if test="${params.paginationInfo.hasPreviousPage}">
                                <a type="button" onclick="dataSend(${params.searchMovieId},'${params.searchText}', ${params.paginationInfo.firstPage-1})">
                                    <div class="page-color">
                                        <i class="fas fa-angle-double-left"></i><span>Prev</span>
                                    </div>
                                </a>
                            </c:if>
                            <c:if test="${params.paginationInfo.lastRecordIndex != 0}">
                                <c:forEach begin="${params.paginationInfo.firstPage}" end="${params.paginationInfo.lastPage}" varStatus="i">
                                    <a type="button" class="${(params.currentPageNo == i.current)? "active":""}" onclick="dataSend(${params.searchMovieId},'${params.searchText}',${i.current})">
                                        <div class="page-color ${(params.currentPageNo == i.current)? "page-active":""}">${i.current}</div>
                                    </a>
                                </c:forEach>
                            </c:if>
                            <c:if test="${params.paginationInfo.hasNextPage}">
                                <a type="button" onclick="dataSend(${params.searchMovieId},'${params.searchText}',${params.paginationInfo.lastPage+1})">
                                    <div class="page-color">
                                        <span>Next</span><i class="fas fa-angle-double-right"></i>
                                    </div>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-10 col-md-8">
                    <aside>
                        <div class="widget widget-search">
                            <h5 class="title">검색</h5>
                            <div class="search-form">
                                <input type="text" name="searchText" id="searchText" value="${params.searchText}" placeholder="검색어를 입력해주세요" onkeydown="if(event.keyCode==13)dataSend(${params.searchMovieId},$('#searchText').val(),1)">
                                <button type="button" class="custom-button" id="searchButton" onclick="dataSend(${params.searchMovieId},$('#searchText').val(),1)"><i class="flaticon-loupe"></i>Search</button>
                            </div>
                        </div>
                        <div class="widget widget-post">
                            <h5 class="title">인기 리뷰</h5>
                            <div class="slider-nav">
                                <span class="flaticon-angle-pointing-to-left widget-prev"></span>
                                <span class="flaticon-right-arrow-angle widget-next active"></span>
                            </div>
                            <div class="widget-slider owl-carousel owl-theme">
                                <c:forEach var="popularReview" items="${popularReviews}">
                                    <div class="item">
                                        <div class="thumb" style="height: 250px;background: white;overflow: hidden">
                                            <a href="/csmovie/reviews/${popularReview.id}">
                                                <img src="/csmovie/reviews/images/${popularReview.image}" style="min-height: 250px;">
                                            </a>
                                        </div>
                                        <div class="content">
                                            <h6 class="p-title">
                                                <a href="/csmovie/reviews/${popularReview.id}" style="height: 2.3em">${popularReview.title}</a>
                                            </h6>
                                            <div class="meta-post">
                                                <a style="margin-right: 1.0em"><i class="flaticon-view"></i>${popularReview.view} View</a>
                                                <a ><i class="flaticon-conversation"></i>${popularReview.commentCount} Comments</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="widget widget-categories">
                            <h5 class="title">영화별 리뷰</h5>
                            <ul>
                                <c:forEach items="${reviewCountsByMovie}" var="rcbm">
                                    <li>
                                        <c:choose>
                                            <c:when test="${params.searchMovieId == rcbm.movieId}">
                                                <a class="myBtn movie-selected-active" type="button" id="movieId${rcbm.movieId}" onclick="dataSend(0, '${params.searchText}', ${params.currentPageNo})">
                                                    <span>${rcbm.movieTitle}</span><span>${rcbm.reviewCount}</span>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="myBtn" type="button" id="movieId${rcbm.movieId}" onclick="dataSend(${rcbm.movieId}, '${params.searchText}', ${params.currentPageNo})">
                                                    <span>${rcbm.movieTitle}</span><span>${rcbm.reviewCount}</span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="widget widget-follow">
                            <h5 class="title">Follow Us</h5>
                            <ul class="social-icons">
                                <li>
                                    <a href="https://www.facebook.com/" class="active" target="_blank">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://twitter.com/" class="" target="_blank">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.pinterest.co.kr/" class="" target="_blank">
                                        <i class="fab fa-pinterest-p"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.google.com/" class="" target="_blank">
                                        <i class="fab fa-google"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.instagram.com/" class="" target="_blank">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </section>
    <!-- ==========Blog-Section========== -->

    <c:import url="../main/footer.jsp" />

    <script>
        function dataSend(searchMovieId, searchText, currentPageNo) {
            var data = {
                searchMovieId:searchMovieId,
                searchText:searchText,
                currentPageNo:currentPageNo,
                sortType:$('#sortType').val(),
            }
            $.ajax({
                url: "/csmovie/reviews/listAjax",
                data: JSON.stringify(data),
                type:"POST",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                error: function(){
                    alert("오류 발생");
                },
                success: function (reviews){
                    uri = "?searchText=" +searchText+ "&searchMovieId=" +searchMovieId+ "&currentPageNo=" +currentPageNo+ "&sortType=" + $('#sortType').val();
                    //검색 부분 변경
                    $('#searchText').attr("value", searchText);
                    $('#searchText').attr("onkeydown", "if(event.keyCode==13)dataSend(" +searchMovieId+ ", $('#searchText').val(), 1)");
                    $('#searchButton').attr("onclick", "dataSend(" +searchMovieId+ "," +"$('#searchText').val()"+ ",1)");
                    //영화 정렬의 함수 매개변수 변경
                    $("#sortType").attr("onchange", "dataSend(" +searchMovieId+ ", '"+ searchText +"'," + currentPageNo+")");
                    //영화별 리뷰 색깔 변경
                    $("[id^='movieId']").each(function(i){
                        var id = $(this).attr('id').split("movieId");
                        if(id[1] == searchMovieId){
                            $(this).attr("class", "myBtn movie-selected-active");
                            $(this).attr("onclick", "dataSend(0, '"+ searchText +"'," + currentPageNo+")");
                        }
                        else{
                            $(this).attr("class", "myBtn");
                            $(this).attr("onclick", "dataSend(" + id[1] + ", '"+ searchText +"'," + currentPageNo+")");
                        }
                    })
                    //페이지 내이션
                    $('#pagination').children().remove();
                    var page =
                        (reviews[0].paginationInfo.hasPreviousPage ?
                            "<a type=\"button\"" + "onclick=\"dataSend("+searchMovieId+", '"+searchText +"',"+(reviews[0].paginationInfo.firstPage-1)+")\""  + ">" +
                                "<div class=\"page-color\">" +
                                    "<i class=\"fas fa-angle-double-left\"></i><span>Prev</span>" +
                                "</div>" +
                            "</a>" : "");
                    if(reviews[0].paginationInfo.lastRecordIndex != 0) {
                        for (var i = reviews[0].paginationInfo.firstPage; i <= reviews[0].paginationInfo.lastPage; i++) {
                            page +=
                                "<a type=\"button\"" + "onclick=\"dataSend(" + searchMovieId + ", '" + searchText + "'," + i + ")\"" + "class=\"" + (reviews[0].currentPageNo == i ? "active" : "") + "\">" +
                                    "<div class=\"page-color " + (reviews[0].currentPageNo == i ? "page-active" : "") +"\">" + i + "</div>" +
                                "</a>";
                        }
                    }
                    page +=
                        (reviews[0].paginationInfo.hasNextPage ?
                            "<a type=\"button\"" + "onclick=\"dataSend("+searchMovieId+", '"+searchText +"',"+(reviews[0].paginationInfo.lastPage+1)+")\""  + ">" +
                                "<div class=\"page-color\">" +
                                    "<span>Next</span><i class=\"fas fa-angle-double-right\"></i>" +
                                "</div>" +
                            "</a>" : "");
                    $("#pagination").html(page);
                    //리스트폼 변경
                    $("#reviewListForm").children().remove();
                    var review = "";
                    for(var i=1;i<reviews.length;i++){
                        review +=
                            "<div class=\"col-sm-6 col-lg-4\">" +
                                "<div class=\"event-grid\">" +
                                    "<div class=\"movie-thumb c-thumb\" style=\"height: 250px;background: white;overflow: hidden\">" +
                                        "<a href=\"/csmovie/reviews/" + reviews[i].id + "\">" +
                                            "<img src=\"/csmovie/reviews/images/" + reviews[i].image +"\" style=\"min-height: 250px;\">" +
                                        "</a>" +
                                    "</div>" +
                                    "<div class=\"post-item\">" +
                                        "<div class=\"post-content\">" +
                                            "<div class=\"post-header\" style=\"padding-bottom: 10px;\">" +
                                                "<div class=\"meta-post\">" +
                                                    "<a style=\"margin-right: 1.0em\"><i class=\"flaticon-view\"></i>" + reviews[i].view + " View</a>" +
                                                    "<a ><i class=\"flaticon-conversation\"></i>" + reviews[i].commentCount + " Comments</a>" +
                                                "</div>" +
                                                "<h4 class=\"title\">" +
                                                    "<a href=\"/csmovie/reviews/" + reviews[i].id + "\" style=\"height: 2.3em;line-height: 1.2\">" +
                                                        reviews[i].title +
                                                    "</a>" +
                                                "</h4>" +
                                                "<div style=\"color: #ffffff\">영화:" +
                                                    "<a href=\"/csmovie/movies/" +reviews[i].movieId+ "\" style=\"color: #dbe2fb\">" +
                                                                reviews[i].movie.title +
                                                        "</a>" +
                                                "</div>" +
                                            "</div>" +
                                            "<div class=\"entry-content\" style=\"padding-top: 10px;\">" +
                                                "<div class=\"left\">" +
                                                    "<span class=\"date\"  >" + reviews[i].reportingDate + " BY</span>" +
                                                    "<div class=\"authors\">" +
                                                      "<div class=\"thumb\">" +
                                                        "<a><img src=\"/csmovie/members/images/" +reviews[i].member.image + "\" alt=\"#0\" style=\"height: 30px;\"></a>" +
                                                        "</div>" +
                                                        "<h6 class=\"title\"><a >" + reviews[i].member.name + "</a></h6>" +
                                                    "</div>" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                              "</div>" +
                        "</div>"
                    }
                    $("#reviewListForm").html(review);
                }
            });
        }
    </script>
</body></html>