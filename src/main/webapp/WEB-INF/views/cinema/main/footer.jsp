<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-07-05
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!-- ==========Newslater-Section========== -->
<footer class="footer-section">
    <div class="newslater-section padding-bottom">
        <div class="container">
            <div style="position:relative" id="footerImageDiv">
                <a href="#" class="footerImageHref" style="width:100%">
                    <img class="footerImage" src="/cinema/assets/images/footer/widow.png" width="100%">
                </a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="footer-top">
            <div class="logo">
                <a href="index-1.html">
                    <img src="/cinema/assets/images/footer/footer-logo.png" alt="footer">
                </a>
            </div>
            <ul class="social-icons">
                <li><a href="https://www.facebook.com/megaboxon"><i class="fab fa-facebook-f"></i></a></li>
                <li><a href="https://twitter.com/megaboxon"><i class="fab fa-twitter"></i></a></li>
                <li><a href="http://instagram.com/megaboxon"><i class="fab fa-linkedin-in"></i></a></li>
                <li><a href="https://play.google.com/store/apps/details?id=com.megabox.mop"><i class="fab fa-google-play"></i></a></li>
                <li><a href="https://itunes.apple.com/kr/app/megabox/id894443858?l=ko&ls=1&mt=8"><i class="fab fa-apple"></i></a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <div class="footer-bottom-area">
                <div class="left">
                    <p style="color: #ffffff8c">
                        <i class="fas fa-users"></i> 17김재균 · 17유효범 · 17김준우 · 20김소영
                        <br><i class="fas fa-map-marker-alt"></i> 서울특별시 노원구 초안산로 12 인덕대학교 컴소과
                        &ensp; <i class="fas fa-phone"></i> 02-950-7000
                        <br>Copyright © 2020.All Rights Reserved By <a href="#0">Boleto </a>
                    </p>
                </div>
                <ul class="links">
                    <!--
                    <li>
                        <a href="#0">About</a>
                    </li>
                    <li>
                        <a href="#0">Terms Of Use</a>
                    </li>
                    <li>
                        <a href="#0">Privacy Policy</a>
                    </li>
                    <li>
                        <a href="#0">FAQ</a>
                    </li>
                    <li>
                        <a href="#0">Feedback</a>
                    </li>
                    -->
                </ul>
            </div>
        </div>
    </div>
</footer>
<!-- ==========Newslater-Section========== -->


<script src="/cinema/assets/js/jquery-3.3.1.min.js"></script>
<script src="/cinema/assets/js/modernizr-3.6.0.min.js"></script>
<script src="/cinema/assets/js/plugins.js"></script>
<script src="/cinema/assets/js/bootstrap.min.js"></script>
<script src="/cinema/assets/js/heandline.js"></script>
<script src="/cinema/assets/js/isotope.pkgd.min.js"></script>
<script src="/cinema/assets/js/magnific-popup.min.js"></script>
<script src="/cinema/assets/js/owl.carousel.min.js"></script>
<script src="/cinema/assets/js/wow.min.js"></script>
<script src="/cinema/assets/js/countdown.min.js"></script>
<script src="/cinema/assets/js/odometer.min.js"></script>
<script src="/cinema/assets/js/viewport.jquery.js"></script>
<script src="/cinema/assets/js/nice-select.js"></script>
<script src="/cinema/assets/js/contact.js"></script>
<% String urlActive1 = (request.getRequestURL().toString().contains("/schedule/listForm"))?"main_del.js":"main.js"; %>
<% String urlActive2 = (request.getRequestURL().toString().contains("/main/index"))?"main_del.js":"main.js"; %>
<% String urlActive3 = (request.getRequestURL().toString().contains("/reservation/movie-seat"))?"main_del.js":"main.js"; %>
<% String active = "";
    if(!urlActive1.equals("main.js") || !urlActive2.equals("main.js") || !urlActive3.equals("main.js")) {
        active = "main_del.js";
    } else {
        active = "main.js";
    }
%>
    <script src="/cinema/assets/js/<%=active%>"></script>

<!-- select2 css cdn -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.min.css" rel="stylesheet" />
<!-- select2 javascript cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $("#select2").select2({
            theme: "bootstrap",
            width: null
        });
    });
</script>
<script>
    $('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);    //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });
    }
</script>
<script>
    $('#couponListBtn').on('click', function(){
        if(${empty sessionScope.member}) {
            if (confirm('로그인 하러 가시겠습니까?'))
                location.href = "/csmovie/members/login?historyUrl=" + window.location.pathname;
            return;
        }
        couponListAjax(${sessionScope.member.id});
    });
    function couponListAjax(memberId) {
        var data = {
            memberId:memberId,
        }
        $.ajax({
            url: "/csmovie/members/couponListAjax",
            data: data,
            type: "POST",
            error: function () {
                alert("오류 발생");
            },
            success: function (coupons) {
                var date = new Date();
                var today = '2021-07-13'
                    //today = date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" +("0"+date.getDate()).slice(-2);

                var coupon = "";
                for(var i=0; i<coupons.length;i++){
                    coupon +=
                        "<tr>" +
                            "<td>" +coupons[i].event.title+ "</td>" +
                            "<td>" +coupons[i].code+ "</td>" +
                            "<td>" +coupons[i].issueDate+ " ~ <br>" +coupons[i].codeLimit+ "</td>";
                    if(coupons[i].codeLimit < today) coupon += "<td style='color: #ec5a5a'>기한만료</td>";
                    else if(coupons[i].issueDate > today) coupon += "<td style='color: #ec5a5a'>사용불가</td>";
                    else if(coupons[i].status == 1) coupon += "<td>사용완료</td>";
                    else coupon += "<td style='color: #7f87e8'>미사용</td>";
                    coupon +=
                            "</tr>";
                    $('#couponList').children().remove();
                    $('#couponList').html(coupon);
                }
            }
        });
    }
</script>
<script>
    $(function(){
        let footerImages = ["widow.png", "Moga.jpg", "kill.png"];
        let footerImageHrefs = ["/csmovie/events/32", "/csmovie/movies/8", "/csmovie/movies/11"];
        let rand = Math.floor(Math.random()*3);

        $('#footerImageDiv').children('.footerImageHref').attr('href', footerImageHrefs[rand]);
        $('#footerImageDiv').children('.footerImageHref').children('.footerImage').attr('src', '/cinema/assets/images/footer/' +footerImages[rand]);
    })
</script>
