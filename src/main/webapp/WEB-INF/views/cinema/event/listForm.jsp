<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <c:import url="../main/header.jsp"/>
    <title>Boleto  - Online Ticket Booking Website HTML Template</title>

    <style>
        #page-color{
            color: #7a89bb;
        }
        #page-color:hover{
            color: white;
            -webkit-transition: all 0.3s ease;
        }
        #viewEye{
            color: #31d7a9;
        }
    </style>
</head>

<body>
<c:import url="../main/nav.jsp"/>
<!-- ==========Banner-Section========== -->
<section class="banner-section" style="padding-bottom: 150px">
    <div class="banner-bg bg_img" data-background="/cinema/assets/images/banner/banner02.jpg"></div>
    <div class="container">
        <div class="banner-content event-content">
            <h1 class="title bold"><span class="color-theme">이벤트</span></h1>
            <h5 id="homeBanner" style="padding-top: 20px; "><a href="/csmovie">홈</a>&nbsp;&nbsp;>&nbsp;&nbsp;이벤트</h5>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Event-Section========== -->
<section class="event-section padding-bottom" >
    <div class="container">
        <div class="row flex-wrap-reverse justify-content-center">
            <div class="col-sm-10 col-md-8 col-lg-3">
                    <div class="widget widget-search">
                        <h5 class="title">검색</h5>
                        <div class="search-form">
                            <input type="text" name="searchWord" id="searchWord" value="" placeholder="검색어를 입력해주세요" onkeydown="if(window.event.keyCode===13){createEventList(1, 1)}">
                            <button class="custom-button" id="searchButton" onclick="createEventList(1, 1)"><i class="flaticon-loupe"></i>Search</button>
                        </div>
                    </div>
                <br>
                <div class="widget-1 widget-check">
                    <div class="widget-header">
                        <h5 class="m-title">Filter</h5>
                    </div>
                    <div class="widget-1-body" >
                        <div class="check-area">
                            <div class="form-group">
                                <input type="radio" onchange="createEventList(1, 1);" class="event_status" name="event_status" id="check1" value="1" checked><label for="check1">진행중인 이벤트</label>
                            </div>
                            <div class="form-group">
                                <input type="radio" onchange="createEventList(1 ,1);" class="event_status" name="event_status" id="check2" value="2"><label for="check2">지난 이벤트</label>
                            </div>
                            <div class="form-group">
                                <input type="radio" onchange="createEventList(1, 1);" class="event_status" name="event_status" id="check3" value="3"><label for="check3">예정 이벤트</label>
                            </div>
                        </div>
                        <div class="add-check-area" style="border-top: 0px;" >
                            <div id="slide" style="display: none;" id="checkArea">
                                <h6 class="subtitle" style="padding-top: 10px; border-bottom: 0px;">이벤트 코드</h6>
                                <div class="check-area" style="padding-bottom: 35px">
                                    <div class="form-group">
                                        <input type="radio" onchange="createEventList(1, 1);" name="event_code_status" id="check6" value="1" checked><label for="check6">모두</label>
                                    </div>
                                    <div class="form-group">
                                        <input type="radio" onchange="createEventList(1, 1);" name="event_code_status" id="check7" value="2"><label for="check7">있음</label>
                                    </div>
                                    <div class="form-group">
                                        <input type="radio" onchange="createEventList(1, 1);" name="event_code_status" id="check8" value="3"><label for="check8">없음</label>
                                    </div>
                                </div>
                            </div>
                            <a type="button" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display !== '')
                                            {$('#slide').slideToggle();
                                            this.parentNode.getElementsByTagName('div')[0].style.display = '';
                                            document.getElementById('word1').style.display = 'none';
                                            document.getElementById('word2').style.display = '';}
                                        else
                                            {$('#slide').slideUp();
                                            document.getElementById('word1').style.display = '';
                                            document.getElementById('word2').style.display = 'none';} ">
                                <div id="word1">더보기<i class="plus"></i></div><div id="word2" style="display: none;">숨기기</div></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 mb-50 mb-lg-0">
                <div class="filter-tab">
                    <div class="filter-area">
                        <div class="filter-main">
                            <div class="left w-100 justify-content-between">
                                <div class="item mr-0">
                                    <span class="show">정렬 : </span>
                                    <select class="select-bar" id="sort" onchange="createEventList(1, 1);">
                                        <option value="1" selected >인기순</option>
                                        <option value="2" >최신순</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-10 justify-content-center" id="listEvent">
                        <%--이벤트 리스트--%>
                    </div>
                    <div class="pagination-area text-center" id="pageArea">
                        <%--페이지--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Event-Section========== -->


<c:import url="../main/footer.jsp"/>

<script>

    $(document).ready(function() {
        createEventList(1, 1);
    })

    function createEventList(nowPage, nowBlock) {

        $.ajax({
            url: "/csmovie/events/Ajax",
            data: {
                searchWord: $('#searchWord').val(),
                status: $("input[name='event_status']:checked").val(),
                sort: $("#sort option:selected").val(),
                nowPage: nowPage,
                nowBlock: nowBlock,
                code_status: $("input[name='event_code_status']:checked").val()
            },
            type: "POST",
            success: function(map) { // 성공
                // 검색창
                $('#searchWord').attr("value", $('#searchWord').val());

                // list 화면 지우기
                $('#listEvent').children().remove();

                // list 화면 변경
                var search1 = "";
                for(var i = 0; i < map.eventList.length; i++){
                search1 += '<div class="col-sm-6 col-lg-4">\n' +
                                '<div class="event-grid">\n' +
                                    '<div class="movie-thumb c-thumb">\n' +
                                        '<a href="/csmovie/events/' + map.eventList[i].id + '">\n' +
                                            '<img src="/csmovie/events/images/' + map.eventList[i].thumStoreFilename + '" alt="event" style="min-height: 300px;">\n' +
                                        '</a>\n' +
                                        '<div class="event-date">\n' +
                                            '<h6 class="date-title">' + map.eventList[i].startDate.substring(8,10) + '</h6>\n' +
                                            '<span>' + map.eventList[i].startDate.substring(6, 7) + '월</span>\n' +
                                        '</div>\n' +
                                    '</div>\n' +
                                    '<div class="movie-content bg-one">\n' +
                                        '<div style="padding-top: 1.5em">\n' +
                                            '<a style="margin-right: 1.0em"><i class="flaticon-view" id="viewEye"></i> &nbsp;' + map.eventList[i].viewCount + '&nbsp;view</a>' +
                                        '</div>\n' +
                                        '<h5 class="title m-0" style="height: 4em; padding-top: 0.5em;">\n' +
                                            '<a style="overflow: hidden; display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical; " href="/csmovie/events/' + map.eventList[i].id + '">' + map.eventList[i].title + '</a>\n' +
                                        '</h5>\n' +
                                        '<div class="movie-rating-percent" >\n' +
                                            '<span>~ ' + map.eventList[i].endDate.substring(6, 7) + '월 ' + map.eventList[i].endDate.substring(8,10) + '일</span>\n' +
                                        '</div>\n' +
                                    '</div>\n' +
                                '</div>\n' +
                            '</div>'
                }
                $("#listEvent").html(search1);

                // page 지우기
                $('#pageArea').children().remove();

                // page 화면 변경
                var blockNumPerPage = 3; // 한 페이지에 보일 블럭 개수
                var recordNumPerPage = 6.0; // 한 페이지에 보일 레코드 개수
                var totalRecordCount = map.eventListBeforeSorting.length; // 검색된 총 레코드 개수
                var totalPageNum = Math.ceil(totalRecordCount / recordNumPerPage); // 총 페이지 개수
                var totalBlockNum = Math.ceil(totalPageNum / blockNumPerPage); // 총 블럭 개수

                var pageStr = "";
                // 이전 키
                if (map.nowBlock > 1){
                    pageStr += '<a id="page-color" type="button" onclick="createEventList(' + ((map.nowBlock - 1) + (blockNumPerPage - 1) * (map.nowBlock - 2)) + ',' +
                        (map.nowBlock - 1)  + ')"><i class="fas fa-angle-double-left"></i><span>Prev</span></a>\n';
                }
                else{
                    pageStr += '<a style="color: rgba(0, 18, 50, 0.4);"><i class="fas fa-angle-double-left"></i><span>Prev</span></a>\n';
                }

                // 페이지 숫자
                var endPage = map.nowBlock + (blockNumPerPage - 1) * (map.nowBlock - 1) + blockNumPerPage - 1; // 현 블럭의 마지막 페이지
                for(var j = map.nowBlock + (blockNumPerPage - 1) * (map.nowBlock - 1); j <= (Math.min(totalPageNum, endPage)); j++){
                    if(map.nowPage === j){
                        pageStr += '<a type="button" onclick="createEventList(' + j + ',' + map.nowBlock + ')" class="active">' + j + '</a>\n';
                    }
                    else{
                        pageStr += '<a id="page-color" type="button" onclick="createEventList(' + j + ',' + map.nowBlock + ')">' + j + '</a>\n';
                    }
                }

                // 다음 키
                if (totalBlockNum > map.nowBlock){
                    pageStr += '<a type="button" id="page-color" onclick="createEventList(' + ((map.nowBlock + 1) + (blockNumPerPage - 1) * map.nowBlock) + ',' +
                        (map.nowBlock + 1) + ')"><span>Next</span><i class="fas fa-angle-double-right"></i></a>';
                }
                else{
                    pageStr += '<a style="color: rgba(0, 18, 50, 0.4);"><span>Next</span><i class="fas fa-angle-double-right"></i></a>';
                }
                $("#pageArea").html(pageStr);
            },
            error: function(){ // 실패
                alert("Error in ajax");
            }
        })
    }
</script>

</body>
</html>
