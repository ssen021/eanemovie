<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-07-06
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <c:import url="../main/header.jsp"/>

    <title>Boleto  - Online Ticket Booking Website HTML Template</title>


</head>

<body>

<c:import url="../main/nav.jsp"/>

<!-- ==========Banner-Section========== -->
<section class="details-banner hero-area bg_img seat-plan-banner" data-background="/cinema/assets/images/banner/banner04.jpg">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-content style-two">
                <h3 class="title">${schedule.scheduleForm.movie_title}</h3>
                <div class="tags">
                    <span>${schedule.scheduleForm.cinema_name} / ${schedule.scheduleForm.theater_name} </span>
                    <span> ${schedule.screening_format}</span>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Page-Title========== -->
<section class="page-title bg-one">
    <div class="container">
        <div class="page-title-area">
            <div class="item md-order-1">
                <a href="#" class="custom-button back-button" onclick="history.back();">
                    <i class="flaticon-double-right-arrows-angles"></i>뒤로가기
                </a>
            </div>
            <div class="item date-item">

            </div>
            <div class="item">

            </div>
        </div>
    </div>
</section>
<!-- ==========Page-Title========== -->

<!-- ==========Movie-Section========== -->
<div class="movie-facility padding-bottom padding-top">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="checkout-widget checkout-contact">
                    <h5 class="title">회원 상세정보</h5>
                    <form class="checkout-contact-form">
                        <div class="form-group">
                            <span>회원명</span>
                            <input type="text" value="${member.name}" readonly>
                        </div>
                        <div class="form-group">
                            <span>이메일</span>
                            <input type="text" value="${member.email}" readonly>
                        </div>
                    </form>
                </div>
                <div class="checkout-widget checkout-contact" onsubmit="return false">
                    <h5 class="title">할인 코드 </h5>
                    <form class="checkout-contact-form">
                        <div class="form-group">
                            <input type="text" placeholder="프로모션 코드를 입력해주세요." id="eventCode" onkeydown="if(event.keyCode==13)checkCode()">
                            <span class="info"><span id="eventCodeSpan"></span></span>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="확인하기" class="custom-button" onclick="checkCode()">
                        </div>
                    </form>
                </div>
                <div class="checkout-widget checkout-card mb-0">
                    <h5 class="title">결제수단선택 </h5>
                        <ul class="payment-option">
                            <li class="active" value="1" onclick="changeActive($(this))">
                                <a href="javascript:void(0)">
                                    <img src="/cinema/assets/images/payment/card.png" alt="payment">
                                    <span>신용카드</span>
                                </a>
                            </li>
                            <li value="2" onclick="changeActive($(this))">
                                <a href="javascript:void(0)">
                                    <img src="/cinema/assets/images/payment/card.png" alt="payment">
                                    <span>체크카드</span>
                                </a>
                            </li>
                            <li value="3" onclick="changeActive($(this))">
                                <a href="javascript:void(0)">
                                    <img src="/cinema/assets/images/payment/paypal.png" alt="payment">
                                    <span>paypal</span>
                                </a>
                            </li>
                        </ul>
                        <h6 class="subtitle">카드 상세정보 </h6>
                            <div class="form-group w-100">
                                <label for="cardNumber"> 카드번호</label>
                                <input type="text" id="cardNumber" placeholder="카드번호를 입력해주세요" onchange="document.getElementById('form-cardNum').value = $('#cardNumber').val()">
                            </div>
                            <div class="form-group w-100">
                                <label for="cardCompany"> 카드사</label>
                                <input type="text" id="cardCompany" placeholder="카드사를 입력해주세요" onchange="document.getElementById('form-cardCom').value = $('#cardCompany').val()">
                            </div>
                            <div class="form-group">
                                <label for="cardDate">카드유효기간</label>
                                <input type="text" id="cardDate" placeholder="MM/YY" onchange="document.getElementById('form-cardDate').value = $('#cardDate').val()">
                            </div>
                            <div class="form-group">
                                <label for="CVC">CVC</label>
                                <input type="text" id="CVC" placeholder="CVC" onchange="document.getElementById('form-CVC').value = $('#CVC').val()">
                            </div>
                        <p class="notice">
                            결제 버튼을 클릭하면 약관에 자동동의 처리됩니다.
                        </p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="booking-summery bg-one">
                    <h4 class="title">예매 상세정보</h4>
                    <ul>
                        <li>
                            <h6 class="subtitle">${schedule.scheduleForm.movie_title}</h6>
                            <span class="info">${schedule.scheduleForm.cinema_name}/${schedule.scheduleForm.theater_name}|${schedule.screening_format}</span>
                        </li>
                        <li>
                            <c:set var="start_time" value="${schedule.start_time}"/>
                            <%
                                String start_time = (String)pageContext.getAttribute("start_time");
                                start_time = start_time.substring(0,5);
                                pageContext.setAttribute("start_time", start_time) ;
                            %>
                            <div class="info" style="margin-bottom: 10px;"><span>영화시간</span> <span>${schedule.screening_date} / ${start_time}</span></div>
                            <h6 class="subtitle"><span>어른</span><span>${adult} </span></h6>
                            <h6 class="subtitle"><span>청소년</span><span>${youth} </span></h6>
                        </li>
                        <li>
                            <h6 class="subtitle mb-0"><span>티켓 가격</span><span id="ticketPrice" value="${price}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/> 원</span></h6>
                        </li>
                    </ul>
                    <ul class="side-shape">
                        <li>
                            <h6 class="subtitle"><span>이벤트 쿠폰</span><span id="event">0 원</span></h6>
                            <span class="info"><span>이벤트명</span><span id="eventTitle"></span></span>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <span class="info"><span>금액</span><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/> 원</span></span>
                            <span class="info"><span>할인금액</span><span id="discount">0 원</span></span>
                        </li>
                    </ul>
                </div>
                <div class="proceed-area  text-center">
                    <h6 class="subtitle"><span>최종결제금액</span><span id="total"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/> 원</span></h6>
                    <a href="#0" class="custom-button back-button" onclick="dataCheck()">결제</a>
                </div>
                <form name="reservationForm" action="/csmovie/reservations/checkout/" method="POST">
                    <input type="hidden" name="member_id" id="member_id" value="${member.id}" >
                    <input type="hidden" name="schedule_id" id="scheduleId" value="${schedule.id}">

                    <input type="hidden" name="payment" id="form-payment" value="신용카드">
                    <input type="hidden" name="cardNum" id="form-cardNum" value="1234 ">
                    <input type="hidden" name="cardCom" id="form-cardCom" value="신한카드">
                    <input type="hidden" name="cardDate" id="form-cardDate" value="03/01 ">
                    <input type="hidden" name="CVC" id="form-CVC" value="444 ">
                    <input type="hidden" name="price" id="form-price" value="${price}">

                    <input type="hidden" name="adult" id="adult" value="${adult}">
                    <input type="hidden" name="youth" id="youth" value="${youth}">
                    <input type="hidden" name="seat" id="seat" value="${seat}" >

                    <input type="hidden" name="useCode" id="useCode" value=" " >
                </form>
            </div>
        </div>
    </div>
</div>
<!-- ==========Movie-Section========== -->

<c:import url="../main/footer.jsp"/>

</body>

<script>
    var count = 0;

    function changeActive(me) {
        $('li.active').removeClass('active');
        me.addClass('active');

        var value = $('li.active').val();
        if(value == 1) {
            document.getElementById("form-payment").value = "신용카드";
        } else if(value == 2) {
            document.getElementById("form-payment").value = "체크카드";
        } else {
            document.getElementById("form-payment").value = "paypal";
        }
    }

    function checkCode(){
        var code = "";
        if($("#eventCode").val() != ""){
            code = $("#eventCode").val();
        }
        var memberId = document.getElementById("member_id").value;

        // var date = date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" +("0"+date.getDate()).slice(-2);
        var date = "2021-07-13";

        $.ajax({
            type: "post",
            url: "/csmovie/reservations/eventCodeAjax",
            data: {
                code: code,
                memberId: memberId,
                date : date
            },
            error:function(request, error) {
                // error 발생 이유를 알려준다.
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)

            },
            success: function (eventCode) {
                console.log(eventCode);
                if(eventCode != "") {
                    if(count == 0) {
                        count = 1;
                        document.getElementById("eventCodeSpan").innerText = eventCode.event.title;
                        document.getElementById("useCode").value = eventCode.code;
                        document.getElementById("eventTitle").innerText = eventCode.event.title;
                        var discount = (document.getElementById("form-price").value * 1) * (eventCode.discountRate * 1) / 100;
                        document.getElementById("event").innerText = numberWithCommas(discount) + " 원";
                        document.getElementById("discount").innerText = numberWithCommas(discount) + " 원";
                        var total = document.getElementById("form-price").value * 1 - discount * 1;
                        document.getElementById("form-price").value = total;
                        document.getElementById("total").innerText = numberWithCommas(total) + " 원";
                    }
                } else {
                    count = 0;
                    document.getElementById("eventCodeSpan").innerText = "유효하지 않은 코드입니다.";

                    document.getElementById("useCode").value = "";
                    document.getElementById("eventTitle").innerText = "";
                    var discount = 0;
                    document.getElementById("event").innerText = numberWithCommas(discount) + " 원";
                    document.getElementById("discount").innerText = numberWithCommas(discount) + " 원";
                    var total = $('#ticketPrice').attr('value');
                    document.getElementById("form-price").value = total;
                    document.getElementById("total").innerText = numberWithCommas(total) + " 원";
                }
            }
        });
    }

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function dataCheck() {
        var cardNum = document.getElementById('form-cardNum').value;
        var cardCom = document.getElementById('form-cardCom').value;
        var cardDate = document.getElementById('form-cardDate').value;
        var CVC = document.getElementById('form-CVC').value;
        var price = document.getElementById('form-price').value;

        if(cardNum == " " || isNaN(cardNum)) {
                   alert("카드 번호를 확인해주세요.");
                   return 0;
        } else if(cardCom == " " || !isNaN(cardCom)) {
                   alert("카드사를 확인해주세요.");
                   return 0;
        } else if(cardDate == " " || !isNaN(cardDate)) {
                   alert("카드유효기간을 확인해주세요.");
                   return 0;
        } else if(CVC == " " || isNaN(CVC)) {
                   alert("CVC를 확인해주세요.");
                   return 0;
        } else {
                   javascript:document.reservationForm.submit();
        }
    }

    <%--    <input type="hidden" name="payment" id="form-payment" value=" ">--%>
    <%--    <input type="hidden" name="cardNum" id="form-cardNum" value=" ">--%>
    <%--    <input type="hidden" name="cardCom" id="form-cardCom" value=" ">--%>
    <%--    <input type="hidden" name="cardDate" id="form-cardDate" value=" ">--%>
    <%--    <input type="hidden" name="CVC" id="form-CVC" value=" ">--%>
    <%--    <input type="hidden" name="price" id="form-price" value="${price}">--%>

</script>

</html>