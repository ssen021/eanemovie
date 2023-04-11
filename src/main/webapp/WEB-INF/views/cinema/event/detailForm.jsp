<%@ page import="java.util.ArrayList" %>
<%@ page import="com.induk.cinema.domain.EventCode" %>
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
        /*쿠폰 버튼*/
        #cuponButton, .closeButton, #cuponButtonNotLogin {
            background: -webkit-linear-gradient(
                    169deg, #5560ff 0%, #ff4343 100%);
            font-size: 25px;
            text-align: center;
            color: white;
            text-transform: uppercase;
            line-height: 50px;
            border: 1px solid #11326f;
            padding: 9px 27px;
            border-radius: 30px;
            margin: 0 5px 10px;
            -webkit-transition: all ease 0.3s;
            transition: all ease 0.3s;
        }

        #copyButton, #copyButton1{
            padding: 2px 15px;
            border-radius: 16px;
            background-color:#00102D;
            color: #FFFFFF;
        }

        /*레이어 팝업창*/
        .layer{
            position: fixed;
            width: 30%;
            left: 55%;
            margin-left: -20%;
            height: 300px;
            top: 50%;
            margin-top: -150px;
            overflow: auto;
            z-index: 20;

            /* decoration */
            background-color: #032055;
            padding: 1em;
            border-radius: 15px;
        }

        #mask {
            position:absolute;
            z-index:10;
            background-color:#000;
            display:none;
            left:0;
            top:0;
        }
    </style>
</head>

<body>
<c:import url="../main/nav.jsp"/>

<!-- ==========Event-Section========== -->
<section class="event-details padding-bottom padding-top" >
    <div class="container">
        <div class="section-header-3" style="border-bottom: 0.5mm solid; border-color: #2d4186; margin-bottom: 0px" >
            <br>
            <br>
            <br>
            <h2 class="title" align="left">${event.title}</h2>
            <c:set var="startDate" value="${event.startDate}"/>
            <c:set var="endDate" value="${event.endDate}"/>
            <span class="cate" align="left"><font color="#FFFFFF">기간 : </font>${fn:substring(startDate,0, 4)}년 ${fn:substring(startDate,6, 7)}월 ${fn:substring(startDate,8,10)}일 ~
                ${fn:substring(endDate,0, 4)}년 ${fn:substring(endDate,6, 7)}월 ${fn:substring(endDate,8,10)}일
            </span>
        </div>
        <div id="eventImage" align="center" style="border-bottom: 0.5mm solid; border-color: #2d4186;  padding-bottom: 40px; padding-top: 40px">
            <img src="/csmovie/events/images/${event.storeFilename}" alt="eventImage" width="1140">
        </div>
        <div id="content" style="padding-top: 32px; " align="left">
            <% pageContext.setAttribute("enter", "\n"); %>
            <c:set var="content" value="${event.content}"/>
            <span style="font-size: 23px" >${fn:replace(content, enter, '<br>')}</span>
        </div>
        <br>
        <br>
        <br>


        <%--이벤트 코드 부분 시작--%>
        <c:if test="${'none' ne event_codes}">
            <c:choose>
                <%--로그인 안했을 때--%>
                <c:when test="${'none' eq member}">
                    <div align="center">
                        <a type="button" id="cuponButtonNotLogin" style="align: center">쿠폰 받기</a>
                    </div>
                </c:when>
                <%--로그인 했을 때--%>
                <c:when test="${'none' ne member}">
                    <c:set var="isMemberHaveEventCode" value='false'/>
                    <c:forEach var="event_code" items="${event_codes}">
                        <c:if test="${event_code.memberId eq member.id}">
                            <c:set var="isMemberHaveEventCode" value='true'/>
                            <c:set var="memberEventCode" value="${event_code.code}"/>
                        </c:if>
                    </c:forEach>
                    <div align="center">
                        <c:choose>
                            <%--이벤트 코드를 이미 받았으면 가지고 있는 이벤트 코드 출력--%>
                            <c:when test="${isMemberHaveEventCode eq true}">
                                <a type="button" id="cuponButton" style="align: center">쿠폰 받기</a>
                                <div class="layer">
                                    <br>
                                    <h4>쿠폰 받기 완료!</h4>
                                    <br>
                                    <p style="padding-bottom: 20px">아래의 코드를 복사하여 결제 창에서 사용해주세요.</p>
                                    <div align="center">
                                        <textarea style="width: 200px; height: 40px; background-color:rgba(0, 18, 50, 0.4); color:white; text-align: center"
                                                  id="eventCode" readonly>${memberEventCode}</textarea>&nbsp;&nbsp;&nbsp;
                                        <a type="button" id="copyButton" style="position: absolute; margin-top: 5px"
                                           onclick="copyClipboard('eventCode')">복사</a>
                                    </div>
                                    <br>
                                    <a type="button" class="closeButton"
                                        style="align: center; font-size: 15px;line-height: 20px; border-radius: 20px;">닫기</a>
                                </div>
                            </c:when>
                            <%--이벤트 코드를 받지 않았다면 아직 아무도 가지지 않은 이벤트 코드 출력--%>
                            <c:otherwise>
                                <c:set var="isLoop" value="true"/>
                                <c:set var="eventCodeFilter" value="none"/>
                                <c:forEach var="event_code" items="${event_codes}" varStatus="status">
                                    <c:if test="${event_code.memberId eq 0 && isLoop eq true}">
                                        <c:set var="eventCodeFilter" value="${event_code.code}"/>
                                        <c:set var="eventCodeId" value="${event_code.id}"/>
                                        <c:set var="isLoop" value="false"/>
                                    </c:if>
                                </c:forEach>
                                <c:choose>
                                    <%--이벤트 코드가 소진되지 않았을 때--%>
                                    <c:when test="${eventCodeFilter ne 'none'}">
                                        <a type="button" id="cuponButton" style="align: center"
                                           onclick="updateMemberIdOfEventCode(${eventCodeId}, ${member.id});">쿠폰 받기</a>
                                        <div class="layer">
                                            <br>
                                            <h4>쿠폰 받기 완료!</h4>
                                            <br>
                                            <p style="padding-bottom: 20px">아래의 코드를 복사하여 결제 창에서 사용해주세요.</p>
                                            <div align="center">
                                                <textarea style="width: 200px; height: 40px; background-color:rgba(0, 18, 50, 0.4);
                                        color:white; text-align: center" id="eventCode1" readonly>${eventCodeFilter}</textarea>&nbsp;&nbsp;&nbsp;
                                                <a type="button" id="copyButton1" style="position: absolute; margin-top: 5px"
                                                   onclick="copyClipboard('eventCode1')">복사</a>
                                            </div>
                                            <br>
                                            <a type="button" class="closeButton"
                                               style="align: center; font-size: 15px;line-height: 20px; border-radius: 20px;">닫기</a>
                                        </div>
                                    </c:when>
                                    <%--이벤트 코드가 소진됬을 때--%>
                                    <c:otherwise>
                                        <a type="button" id="cuponButton" style="align: center">쿠폰 받기</a>
                                        <div class="layer">
                                            <br>
                                            <h4>쿠폰 받기 실패</h4>
                                            <br>
                                            <p style="padding-bottom: 20px">이벤트 코드가 모두 소진되었습니다.</p>
                                            <br>
                                            <br>
                                            <a type="button" class="closeButton"
                                               style="align: center; font-size: 15px;line-height: 20px; border-radius: 20px;">닫기</a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div id="mask"></div>
                </c:when>
            </c:choose>
        </c:if>
        <%--이벤트 코드 부분 끝--%>

    </div>
</section>

<!-- ==========Event-Section========== -->
<br>
<c:import url="../main/footer.jsp"/>

<script>

    // 현재 페이지를 새로 로드하지 않고 외부의 함수를 사용하기 위해 사용함
    function updateMemberIdOfEventCode(eventCodeID, memberID){
        $.ajax({
            url: "/csmovie/events/AjaxUpdateEventCode",
            data: {
                eventCodeID: eventCodeID,
                memberID: memberID
            },
            type: "POST",
            success: function(data){
            },
            error: function(){ // 실패
                alert("Error in ajax");
            }
        })
    }

    // 클립보드에 복사
    function copyClipboard(eventCode)
    {
        var content = document.getElementById(eventCode);
        content.select();
        document.execCommand('copy');
        alert("클립보드에 복사");
    }

    // 레이어 팝업창 display none 상태로 만들기
    $(document).ready(function() {
        $(".layer").hide();
    })

    // 레이어 팝업창 열기
    function layer_open(){

        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({'width':maskWidth,'height':maskHeight});

        // 1초동안 까맣게 됐다가 80%불투명
        $('#mask').fadeTo("slow",0.8);

        $(".layer").fadeIn();

        //레이어 영역 외 바탕화면 클릭시 화면 닫기
        $("#mask").click(function (e) {
            layer_close();
        })
    }

    // 레이어 팝업창 닫기
    function layer_close(){
        $(".layer").fadeOut();
        $('#mask').fadeOut();
    }

    // 버튼 클릭시 레이어 팝업창 열기
    $("#cuponButton").click(function () {
        layer_open();
    })

    $("#cuponButtonNotLogin").click(function () {
        alert('로그인이 필요한 서비스입니다.');
    })

    //닫기 버튼 클릭시 레이어 닫기
    $(".closeButton").click(function () {
        layer_close();
    });


</script>
</body>
</html>
