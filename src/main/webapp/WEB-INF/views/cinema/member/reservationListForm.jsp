<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class=" sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp" />

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>

    <style>
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
            <h2 class="title">예매 목록</h2>
            <ul class="breadcrumb">
                <li>
                    <a href="/csmovie">
                        홈
                    </a>
                </li>
                <li>
                    <a>내정보</a>
                </li>
                <li>
                    예매 목록
                </li>
            </ul>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->


<!-- ==========Event-Section========== -->
<div class="event-facility padding-bottom padding-top">
    <div class="container">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-lg-10">
                <div class="checkout-widget checkout-card mb-0" style="border-radius: 10px;">
                    <div class="filter-tab tab">
                        <div class="filter-area" style="border: none;border-bottom: 3px solid rgba(163,177,198,0.151);border-radius: 0px;">
                            <div class="filter-main">
                                <h5 class="title" style="margin-bottom: 15px;"><i class="fas fa-ticket-alt"></i> 예매 목록 </h5>
                                <div class="left">
                                    <div class="item">
                                        <span class="show">Show :</span>
                                        <ul class="tab-menu">
                                        <select class="select-bar tab-menu ">
                                            <option type="button" class="tab-menu" value="12">예매 영화</option>
                                            <option type="button" class="tab-menu" value="15">시청한 영화</option>
                                        </select>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-area">
                            <div class="tab-item active">
                                <div class="movie-area mb-10" id="reserveList">
                                </div>
                                <div class="pagination-area text-center" id="reservePage">
                                </div>
                            </div>
                            <div class="tab-item">
                                <div class="movie-area mb-10" id="seenList">
                                </div>
                                <div class="pagination-area text-center" id="seenPage">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- ==========Event-Section========== -->

<c:import url="../main/footer.jsp" />
<script>
    $(function(){
        getRList(${reserveMovies.memberId}, ${reserveMovies.sort}, 1 );
        getRList(${seenMovies.memberId}, ${seenMovies.sort}, 1 );
    });
    $('#reservePage').on('click', 'a', function () {
        getRList(${reserveMovies.memberId}, ${reserveMovies.sort}, $(this).attr('id') );
    });
    $('#seenPage').on('click', 'a', function () {
        getRList(${seenMovies.memberId}, ${seenMovies.sort}, $(this).attr('id') );
    });
    function cancelReservation(id,state){
        if(state == 1 && confirm('예매 취소하시겠습니까?') == 0) return;
        else if(state == 0 && confirm('취소신청을 철회하시겠습니까?') == 0) return;


        if(cancelReservationAjax(id) != 0){
            if(state == 1) {
                alert('예약 취소 되었습니다.');
            }
            else if(state ==0) alert('철회 되었습니다.');

            location.reload();
        }
        else {
            alert('오류가 발생하였습니다. 다시 취소해주세요.');
            return ;
        }
    };


    function getRList(memberId, sort, currentPageNo) {
        var data = {
            memberId:memberId,
            sort:sort,
            currentPageNo:currentPageNo,
        }
        $.ajax({
            url: "/csmovie/members/reservationListAjax",
            data: JSON.stringify(data),
            type:"POST",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            error: function(){
                alert("오류 발생");
            },
            success: function (rlp){
                let rList = rlp.reservationListForms;


                //페이지 부분
                var pageId;
                if(rlp.sort == 1) pageId = $('#reservePage');
                else pageId = $('#seenPage');
                pageId.children().remove();
                var pHtml = "";

                    if(rlp.paginationInfo.hasPreviousPage){
                        pHtml +=
                            "<a type=\"button\" id=\"" +(rlp.paginationInfo.firstPage-1)+ "\">" +
                                "<div class=\"page-color\">" +
                                    "<i class=\"fas fa-angle-double-left\"></i><span>Prev</span>" +
                                "</div>" +
                            "</a>";
                    }
                    if(rlp.paginationInfo.lastRecordIndex != 0){
                        for(var i=rlp.paginationInfo.firstPage; i<= rlp.paginationInfo.lastPage;i++){
                            pHtml +=
                                "<a type=\"button\" class=\"" +((rlp.currentPageNo == i)? "active" : "")+  "\" id=\"" +i+ "\">" +
                                    "<div class=\"page-color" +((rlp.currentPageNo == i)? "page-active" : "")+ "\">" +i+ "</div>" +
                                "</a>";
                        }
                    }
                    if(rlp.paginationInfo.hasNextPage) {
                        pHtml +=
                            "<a type=\"button\" id=\"" +(rlp.paginationInfo.lastPage+1)+ "\">" +
                                "<div class=\"page-color\">" +
                                    "<span>Next</span><i class=\"fas fa-angle-double-right\"></i>" +
                                "</div>" +
                            "</a>";
                    }
                pageId.html(pHtml);


                //리스트 부분
                var reservationId;
                if(rlp.sort == 1) reservationId = $('#reserveList');
                else reservationId = $('#seenList');
                reservationId.children().remove();
                var rHtml = "";
                //데이터가 하나도 없으면
                if(rlp.paginationInfo.totalRecordCount == 0){
                    if(rlp.sort == 1) rHtml += "<span>예매하신 영화가 없습니다.</span>";
                    else rHtml += "<span>시청하신 영화가 없습니다.</span>";
                }

                for(var i=0; i<rList.length;i++){
                    rHtml+=
                        "<div class=\"movie-list\">" +
                            "<div class=\"movie-thumb c-thumb\">" +
                                "<a href=\"/csmovie/movies/" +rList[i].movie.id+ "\" class=\"w-100 h-100\" style=\"background: url(\'/csmovie/movies/images/" +rList[i].movie.poster+ "\');background-size:cover;background-position: center center;background-repeat: no-repeat;\">" +
                                "</a>" +
                            "</div>" +
                            "<div class=\"movie-content bg-one\">" +
                                "<div style=\"margin-top: 10px;\">" +
                                    "<h6>예매번호 : <span style=\"color: #31d7a9\">" +rList[i].id+ "</span></h6>" +
                                    "<hr>" +
                                "</div>" +
                                "<div>" +
                                    "<h5 class=\"title\" style=\"margin-bottom: 8px;\">" +
                                        "<a href=\"/csmovie/movies/" + rList[i].movie.id+ "\">" +rList[i].movie.title+ "(" +rList[i].schedule.screening_format+ ")</a>" +
                                    "</h5>" +
                                "</div>" +
                                "<p class=\"duration\">" +Math.floor(rList[i].movie.showTimes/60)+ "시간" +" " +rList[i].movie.showTimes%60+ "분 </p>" +
                                "<div class=\"movie-tags\">" +
                                    "<a>액션</a>" +
                                "</div>" +
                                "<div class=\"release\" style=\"margin-bottom: 5px;\">" +
                                    "<span>상영일시 : </span> <a >" +rList[i].schedule.screening_date+ " " +(rList[i].schedule.start_time).substr(0,5)+ " ~ " +(rList[i].schedule.end_time).substr(0,5)+ "</a>" +
                                "</div>" +
                                "<div class=\"release\" style=\"margin-bottom: 5px;\">" +
                                    "<span>극장 : </span> <a >" +rList[i].cinema.name+ ", " +rList[i].theater.name+ "</a>" +
                                "</div>" +
                                "<div class=\"release\" style=\"margin-bottom: 5px;\">" +
                                    "<span>인원 : </span>" +
                                    "<a>";
                                        if(rList[i].adult>0 && rList[i].youth>0) rHtml+= "성인" +rList[i].adult+ ", 어린이" +rList[i].youth;
                                        else{
                                            if(rList[i].adult>0) rHtml+= "성인" +rList[i].adult;
                                            if(rList[i].youth>0) rHtml+= "어린이" +rList[i].youth;
                                        }
                    rHtml+=
                                    "</a>" +
                                "</div>" +
                                "<div class=\"release\" style=\"margin-bottom: 5px;\">" +
                                    "<span>좌석 : </span> <a >" +rList[i].seatNumbers+ "</a>" +
                                "</div>" +
                                "<div class=\"release\" style=\"margin-bottom: 5px;\">" +
                                    "<span>예매일시 : </span> <a >" + rList[i].date.substr(0,16)+ "</a>" +
                                "</div>" +
                                "<div class=\"release\" >" +
                                    "<span>결제 : </span> <a>" +rList[i].payment.method+ " " +(rList[i].payment.price).toLocaleString()+ "</a>" +
                                "</div>" +
                                "<div class=\"book-area\">" +
                                    "<div class=\"book-ticket\" style=\"text-align: center\">";
                                        if(rlp.sort == 1){
                                            if(rList[i].status == 0) rHtml += "<a type=\"button\" class=\"custom-button\" style=\"width: 100%;background: #5e6890\" onclick=\"cancelReservation(" +rList[i].id+ ", 0"+  ")\">취소 처리중</a>";
                                            else rHtml += "<a type=\"button\" class=\"custom-button cancelReservation\" style=\"width: 100%\" onclick=\"cancelReservation(" + rList[i].id + ", 1"+ ")\">예매 취소</a>";
                                        }
                                        else{
                                            rHtml += "<a class=\"custom-button\" style=\"width: 100%\">시청 완료</a>";
                                        }
                    rHtml+=
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                }
                reservationId.html(rHtml);
            }
        });
    }

    function cancelReservationAjax(id) {
        var data = {
            id:id,
        }
        $.ajax({
            url: "/csmovie/members/reservationCancelAjax",
            data: JSON.stringify(data),
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            error: function () {
                alert("오류 발생");
            },
            success: function (result) {
                if(result >0) {
                    del();
                    return 1;
                }
                else return 0;
            }
        });
    }
</script>

</body></html>