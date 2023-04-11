<%@ page import="com.induk.cinema.domain.Review" %>
<%@ page import="com.induk.cinema.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class=" sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp" />

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>

    <style>
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
        .comment-menu{
            width: 100%;
            text-align: right;
            margin-top: 0.7em;
            height: 1.8em
        }
        .comment-menu-item:hover{
            color: #ada9ea!important;
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
                <h2 class="title">리뷰 상세</h2>
                <ul class="breadcrumb">
                    <li>
                        <a href="/csmovie">
                            홈
                        </a>
                    </li>
                    <li>
                        <a href="/csmovie/reviews">리뷰</a>
                    </li>
                    <li>
                        리뷰 상세
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <!-- ==========Banner-Section========== -->

    <!-- ==========Blog-Section========== -->
    <section class="blog-section padding-top padding-bottom">
        <div class="container">
            <div class="row justify-content-center mb-30-none">
                <div class="col-lg-8 mb-50 mb-lg-0">
                    <article>
                        <form name="deleteForm" action="/csmovie/reviews/${review.id}/del" method="POST">
                            <input type="hidden" name="_method" value="delete" />
                        </form>
                        <div style="margin-bottom: 20px">
                            <div class="row">
                                <h5 class="title col" style="margin-block-start: 0px;padding-top: 8px;">리뷰 상세</h5>
                                <c:if test="${sessionScope.member.id == review.memberId}">
                                    <div class="col" style="text-align: right">
                                        <a href="/csmovie/reviews/${review.id}/edit" class="review-write" ><i class="fas fa-pencil-alt"></i> 수정</a>&nbsp;
                                        <a href="#" class="review-write" onclick="if(confirm('삭제할까요 ?'))document.deleteForm.submit()"><i class="fas fa-trash-alt"></i> 삭제</a>
                                    </div>
                                </c:if>
                            </div>
                            <hr style="border:1px solid #11326F">
                        </div>
                        <%
                            Review review = (Review)request.getAttribute("review");
                            String content = review.getContent().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;");
                            String reportingDate = review.getReportingDate().substring(0,10);
                        %>
                        <div class="post-item post-details">
                            <div class="post-thumb" style="text-align: center">
                                <img src="/csmovie/reviews/images/${review.image}" style="width: inherit;max-width: 100%">
                            </div>
                            <div class="post-content">
                                <div class="post-meta text-center">
                                    <div class="item">
                                        <a>
                                            <i class="flaticon-view"></i>
                                            <span><%=review.getView()%></span>
                                        </a>
                                    </div>
                                    <div class="item">
                                        <a>
                                            <i class="flaticon-conversation"></i>
                                            <span id="commentCount0"><%=(review.getCommentCount() ==null)?0:review.getCommentCount()%></span>
                                        </a>
                                    </div>

                                </div>
                                <div class="content">
                                    <div class="entry-content p-0">
                                        <div class="left">
                                            <span class="date"><%=reportingDate%> BY </span>
                                        </div>
                                    </div>
                                    <div class="post-header">
                                        <h4 class="m-title">
                                            ${review.title}
                                        </h4>
                                        <p>
                                            <%=content%>
                                        </p>
                                    </div>
                                    <div class="tags-area">
                                        <div class="tags">
                                            <span>영화: </span>
                                            <div class="tags-item">
                                                <a href="/csmovie/movies/${review.movieId}">&nbsp;${review.movie.title}</a>
                                                
                                                
                                            </div>
                                        </div>
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
                                </div>
                            </div>
                        </div>
                        
                        <div class="blog-comment">
                            <h5 class="title" id="commentCount1">댓글 <%=(review.getCommentCount() ==null)?0:review.getCommentCount()%></h5>
                            <ul class="comment-area" id="commentListForm">
                                <c:forEach items="${comments}" var="comment">
                                    <li id="commentNum${comment.id}" style="padding: 0px;">
                                        <div class="comment-menu" id="commentMenu${comment.id}">
                                            <c:if test="${not empty sessionScope.member && sessionScope.member.id == comment.member.id}">
                                            <a type="button" class="comment-menu-item" onclick="updateCommentForm(${comment.id}, '${comment.contentRepl}', ${comment.reviewId}, ${comment.currentPageNo}, ${comment.member.id}, ${sessionScope.member.id})">
                                                <i class="fas fa-pencil-alt"></i> 수정
                                            </a> &ensp;
                                            <a type="button" class="comment-menu-item" onclick="delComment(${comment.id}, ${comment.reviewId}, ${comment.currentPageNo}, ${sessionScope.member.id})">
                                                <i class="fas fa-trash-alt" ></i> 삭제
                                            </a>
                                            </c:if>
                                        </div>
                                        <div class="blog-thumb">
                                            <a style="height: -webkit-fill-available">
                                                <img src="/csmovie/members/images/${comment.member.image}" style="height: 100%">
                                            </a>
                                        </div>
                                        <div class="blog-thumb-info">
                                            <span>${comment.calDateDays}</span>
                                            <h6 class="title"><a>${comment.member.name}</a></h6>
                                        </div>
                                        <div class="blog-content" id="blogContent${comment.id}">
                                            <p>
                                                ${comment.contentRepl}
                                            </p>
                                        </div>
                                        <div class="comment-menu">
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div id="pagination" class="pagination-area text-center">
                                <c:if test="${commentParams.paginationInfo.hasPreviousPage}">
                                    <a type="button" onclick="listComment(${review.id}, ${commentParams.paginationInfo.firstPage-1}, ${sessionScope.member.id})">
                                        <div class="page-color">
                                            <i class="fas fa-angle-double-left"></i><span>Prev</span>
                                        </div>
                                    </a>
                                </c:if>
                                <c:if test="${commentParams.paginationInfo.lastRecordIndex != 0}">
                                    <c:forEach begin="${commentParams.paginationInfo.firstPage}" end="${commentParams.paginationInfo.lastPage}" varStatus="i">
                                        <a type="button" class="${(commentParams.currentPageNo == i.current)? "active":""}" onclick="listComment(${review.id}, ${i.current}, ${sessionScope.member.id})">
                                            <div class="page-color ${(commentParams.currentPageNo == i.current)? "page-active":""}">${i.current}</div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${commentParams.paginationInfo.hasNextPage}">
                                    <a type="button" onclick="listComment(${review.id}, ${commentParams.paginationInfo.lastPage+1}, ${sessionScope.member.id})">
                                        <div class="page-color">
                                            <span>Next</span><i class="fas fa-angle-double-right"></i>
                                        </div>
                                    </a>
                                </c:if>
                            </div>
                            <div class="leave-comment">
                                <h5 class="title">댓글 작성</h5>
                                <form class="blog-form">
                                    <input type="hidden" name="reviewId" value="${review.id}">
                                    <div class="form-group">
                                        <textarea name="content" id="content" placeholder="댓글을 작성해주세요" required=""></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="button" class="custom-button" onclick="addComment(${review.id}, ${sessionScope.member.id})" style="width:auto;min-width:150px">작성하기</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-lg-4 col-sm-10 col-md-8">
                    <aside>
                        <div class="widget widget-search">
                            <h5 class="title">검색</h5>
                            <form class="search-form" action="/csmovie/reviews">
                                <input type="text" name="searchText" id="searchText" value="" placeholder="검색어를 입력해주세요">
                                <button type="button" class="custom-button" id="searchButton"><i class="flaticon-loupe"></i>Search</button>
                            </form>
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
                                        <div class="thumb" style="height: 330px;background: white;overflow: hidden">
                                            <a href="/csmovie/reviews/${popularReview.id}">
                                                <img src="/csmovie/reviews/images/${popularReview.image}" style="min-height: 330px;">
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
                                        <a class="myBtn" href="/csmovie/reviews?searchMovieId=${rcbm.movieId}" type="button" id="movieId${rcbm.movieId}">
                                            <span>${rcbm.movieTitle}</span><span>${rcbm.reviewCount}</span>
                                        </a>
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
        function listComment(reviewId, currentPageNo, sessionMemberId){
            var data = {
                reviewId:reviewId,
                currentPageNo:currentPageNo,
            }
            $.ajax({
                url: "/csmovie/comments/listAjax",
                data: JSON.stringify(data),
                type:"POST",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                error: function(){
                    alert("오류 발생");
                },
                success: function(comments){
                    //댓글 카운트
                    $('#commentCount0').text(comments[0].countByReviewId);
                    $('#commentCount1').text("댓글 " + comments[0].countByReviewId);
                    //페이지 내이션
                    $('#pagination').children().remove();
                    var page =
                        (comments[0].paginationInfo.hasPreviousPage ?
                            "<a type=\"button\" onclick=\"listComment(" + reviewId +"," + (comments[0].paginationInfo.firstPage-1) + "," +sessionMemberId+ ")\">" +
                                "<div class=\"page-color\">" +
                                    "<i class=\"fas fa-angle-double-left\"></i><span>Prev</span>" +
                                "</div>" +
                            "</a>" : "");
                    if(comments[0].paginationInfo.lastRecordIndex != 0)
                        for(var i=comments[0].paginationInfo.firstPage; i<= comments[0].paginationInfo.lastPage;i++){
                            page +=
                                "<a type=\"button\" class=\"" + (comments[0].currentPageNo == i ? "active" : "") +"\" onclick=\"listComment(" +reviewId+ ", " +i+ "," +sessionMemberId+ ")\">" +
                                    "<div class=\"page-color " + (comments[0].currentPageNo == i ? "page-active" : "") +"\">" + i + "</div>" +
                                "</a>";
                        }
                    page +=
                        (comments[0].paginationInfo.hasNextPage ?
                            "<a type=\"button\" onclick=\"listComment(" + reviewId +"," + (comments[0].paginationInfo.lastPage+1) + "," +sessionMemberId+")\">" +
                                "<div class=\"page-color\">" +
                                    "<span>Next</span><i class=\"fas fa-angle-double-right\"></i>" +
                                "</div>" +
                            "</a>" : "");
                    $('#pagination').html(page);
                    //리스트폼 
                    $('#commentListForm').children().remove();
                    var comment = "";
                    for(var i=1; i<comments.length; i++){
                        comment += 
                            "<li id=\"commentNum" +comments[i].id+ "\" style=\"padding: 0px;\">" +
                                "<div class=\"comment-menu\" id=\"commentMenu" +comments[i].id+ "\">" +
                                    (sessionMemberId == comments[i].memberId ?
                                    "<a type=\"button\" class=\"comment-menu-item\" onclick=\"updateCommentForm(" +comments[i].id+ ",'" +comments[i].contentRepl+ "'," +comments[i].reviewId+ "," +comments[0].currentPageNo+ "," +comments[i].memberId+ "," +sessionMemberId+")\">" +
                                        "<i class=\"fas fa-pencil-alt\"></i> 수정" +
                                    "</a> &ensp;" +
                                    "<a type=\"button\" class=\"comment-menu-item\" onclick=\"delComment(" + comments[i].id + "," + comments[i].reviewId+ "," + comments[0].currentPageNo + "," +sessionMemberId+")\">" +
                                        "<i class=\"fas fa-trash-alt\" ></i> 삭제" +
                                    "</a>" : "") +
                                "</div>" +
                                "<div class=\"blog-thumb\">" +
                                    "<a style=\"height: -webkit-fill-available\">" +
                                        "<img src=\"/csmovie/members/images/" +comments[i].member.image+ "\" style=\"height: 100%\">" +
                                    "</a>" +
                                "</div>" +
                                "<div class=\"blog-thumb-info\">" +
                                    "<span>" +comments[i].calDateDays+ "</span>" +
                                    "<h6 class=\"title\"><a>" +comments[i].member.name+ "</a></h6>" +
                                "</div>" +
                                "<div class=\"blog-content\" id=\"blogContent" +comments[i].id+ "\">" +
                                    "<p>" +
                                        comments[i].contentRepl +
                                    "</p>" +
                                "</div>" +
                                "<div class=\"comment-menu\">" +
                                "</div>" +
                            "</li>"
                    }
                    $('#commentListForm').html(comment);
                }
            });
        }

        function addComment(reviewId, memberId){
            if(!memberId) {
                alert('로그인이 필요한 서비스입니다.');
                if(confirm('로그인 하러 가시겠습니까?'))
                    location.href = "/csmovie/members/login?historyUrl=" + window.location.pathname ;
                return;
            }
            if($('#content').val() == "") {
                alert("댓글을 작성해 주세요.");
                $('#content').focus();
                return;
            }
            var data = {
                reviewId:reviewId,
                memberId:memberId,
                content:$('#content').val(),
            }
            $.ajax({
                url: "/csmovie/comments/addAjax",
                data: JSON.stringify(data),
                type:"POST",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                error: function(){
                    alert("연결 실패");
                },
                success: function(id){
                    listComment(reviewId, 1, memberId);
                    alert('작성되었습니다.');
                    $('#content').val("");
                    $('#commentNum' + id).focus();
                }
            });
        }
        function delComment(commentId, reviewId, currentPageNo, sessionMemberId){
            if(!sessionMemberId) {
                alert('로그인이 필요한 서비스입니다.');
                if(confirm('로그인 하러 가시겠습니까?'))
                    location.href = "/csmovie/members/login?historyUrl=" + window.location.pathname ;
                return;
            }
            if(!confirm('삭제하시겠습니까?')) return;
            var data = {
                id:commentId,
            }
            $.ajax({
                url: "/csmovie/comments/delAjax",
                data: JSON.stringify(data),
                type:"POST",
                contentType: "application/json; charset=UTF-8",
                dataType: "html",
                error: function(){
                    alert("실패");
                },
                success: function(result){
                    if(result)alert("삭제되었습니다.");
                    else {
                        alert('삭제 실패');
                        return;
                    }
                    listComment(reviewId, currentPageNo, sessionMemberId);
                }
            });
        }
        function updateCommentForm(commentId, content, reviewId, currentPageNo, memberId, sessionMemberId){
            if(!memberId) {
                alert('로그인이 필요한 서비스입니다.');
                if(confirm('로그인 하러 가시겠습니까?'))
                    location.href = "/csmovie/members/login?historyUrl=" + window.location.pathname ;
                return;
            }
            content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');

            $('#commentMenu' + commentId).children().remove();
            var commentMenu =
                "<a type=\"button\" class=\"comment-menu-item\" onclick=\"listComment(" + reviewId +"," + currentPageNo +  "," + sessionMemberId +")\">" +
                    "<i class=\"fas fa-times-circle\"></i> 취소" +
                "</a> &ensp;" +
                "<a type=\"button\" class=\"comment-menu-item\" onclick=\"updateComment(" +commentId+ "," +reviewId+"," +currentPageNo+ "," +memberId+ "," + sessionMemberId +")\">" +
                    "<i class=\"fas fa-check\"></i> 확인" +
                "</a>";
            $('#commentMenu' + commentId).html(commentMenu);
            $('#blogContent' + commentId).children().remove();
            var blogContent =
                "<textarea id=\"editContent\" style=\"height: 100px;\">" +
                    content +
                "</textarea>";
            $('#blogContent' + commentId).html(blogContent);
        }
        function updateComment(commentId, reviewId, currentPageNo, memberId, sessionMemberId){
            if(!confirm('수정하시겠습니까?'))return;
            if(!memberId) {
                alert('로그인이 필요한 서비스입니다.');
                return;
            }

            var data = {
                id:commentId,
                reviewId:reviewId,
                memberId:memberId,
                content:$('#editContent').val(),
            }
            $.ajax({
                url: "/csmovie/comments/editAjax",
                data: JSON.stringify(data),
                type:"POST",
                dataType: "html",
                contentType: "application/json; charset=UTF-8",
                error: function(){
                    alert("실패");
                },
                success: function(result){
                    if(result) alert('수정되었습니다.');
                    else {
                        alert('수정 실패');
                    }
                    listComment(reviewId, currentPageNo, sessionMemberId);
                }
            });
        }
    </script>

</body></html>