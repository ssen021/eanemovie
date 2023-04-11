<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

        .filebox {
            width: 100%;
            margin-bottom: 20px;
        }
        .upload-display{
            width: 100%;
            margin-bottom: 10px;
        }
        .filebox input[type="file"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip:rect(0,0,0,0);
            border: 0;
        }

        .filebox label {
            display: inline-block;
            padding: .5em .75em;
            color: #999;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #fdfdfd;
            cursor: pointer;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            margin: 0;
        }

        /* named upload */
        .filebox .upload-name {
            color: #000000;
            height: 40px;
            display: inline-block;
            padding: .5em .75em;
            font-size: inherit;
            font-family: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #f5f5f5;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            -webkit-appearance: none; /* 네이티브 외형 감추기 */
            -moz-appearance: none;
            appearance: none;
        }

        /* imaged preview */
        .filebox .upload-display {
            width: 100%;
            margin-bottom: 5px;
            margin-bottom: 10px;
        }

        @media(min-width: 768px) {
            .filebox .upload-display {
                display: inline-block;
                margin-right: 5px;
                margin-bottom: 10px;
                width: 100%;
            }
        }

        .filebox .upload-thumb-wrap {
            display: inline-block;
            max-width: 150px;
            padding: 2px;
            vertical-align: middle;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .filebox .upload-display img {
            display: block;
            max-width: 100%;
            height: auto;
            max-height: 150px;
        }

        .filebox.bs3-primary label {
            color: #fff;
            background-color: #0e4abc;
            border-color: #2d4186;
        }
        .custom-textarea{
            background:transparent;
            border:1px solid #2d4186;
            padding-left:10px;
            color: #dbe2fb;
            border-radius: 10px;
            height:300px;
        }
        .custom-select{
            height: 60px;
            border-radius: 10px;
            border-color: #2d4186;
            color: #dbe2fb;
            background:transparent;
            background: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e") no-repeat right .75rem center/8px 10px;
        }
        .custom-select option{
            color: #dbe2fb;
            background:#032055;
        }
        .custom-focus:focus{
            border-color:#80bdff!important;
            outline:0!important;
            box-shadow:0 0 0 .2rem rgba(0,123,255,.25)!important;
        }
    </style>
</head>

<body>
<c:import url="../main/nav.jsp" />

<!-- ==========Banner-Section========== -->
<section class="main-page-header speaker-banner bg_img" data-background="./assets/images/banner/banner07.jpg" style="background-image: url(&quot;./assets/images/banner/banner07.jpg&quot;);">
    <div class="container">
        <div class="speaker-banner-content">
            <h2 class="title">내 정보 수정</h2>
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
                    내 정보 수정
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
            <div class="col-2"></div>
            <div class="col-lg-8">
                <div class="checkout-widget checkout-card mb-0" style="border-radius: 10px;">
                    <h5 class="title" style="margin-bottom: 15px;"><i class="fas fa-user-friends"></i> 내 정보 수정 </h5>

                    <form class="payment-card-form" method="post" action="/csmovie/members/edit" enctype="multipart/form-data">
                        <div class="form-group w-100">
                            <spring:bind path="member.name">
                                <label for="${status.expression}"> 이름</label>
                                <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}" class="custom-focus" style="border:1px solid #2d4186;" required>
                                <span style="color: red">${status.errorMessage }</span>
                            </spring:bind>
                        </div>
                        <div class="form-group w-100">
                            <spring:bind path="member.email">
                                <label for="${status.expression}"> 이메일<span style="color: #e03232"> *</span></label>
                                <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}" class="custom-focus" style="border:1px solid #2d4186;" required disabled>
                                <span style="color: red">${status.errorMessage }</span>
                            </spring:bind>
                        </div>
                        <div class="form-group w-100">
                            <spring:bind path="member.address">
                                <label for="${status.expression}"> 주소<span style="color: #e03232"> *</span></label>
                                <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}" class="custom-focus" style="border:1px solid #2d4186;" required>
                                <span style="color: red">${status.errorMessage }</span>
                            </spring:bind>
                        </div>
                        <div class="form-group w-100">
                            <spring:bind path="member.password">
                                <label for="${status.expression}"> 비밀번호 수정<span style="color: #e03232"> *수정 시 입력</span></label>
                                <input type="password" name="${status.expression}" value="" id="${status.expression}" class="custom-focus" style="border:1px solid #2d4186;">
                            </spring:bind>
                        </div>


                        <div class="form-group" style="margin-bottom: 0px;">
                            <label>이미지</label>
                        </div>
                        <div class="filebox bs3-primary preview-image">
                            <div class="upload-display">
                                <div class="upload-thumb-wrap">
                                    <img src="/csmovie/members/images/${member.image}" class="upload-thumb">
                                </div>
                            </div>

                            <c:choose>
                                <c:when test="${member.image != 'user_image.png'}">
                                    <div style="width: 100%;margin-bottom: 10px;">
                                        <input type="checkbox" name="imageDel" value="1" style="height: auto;width: auto"> 이미지 삭제
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style="width: 100%;margin-bottom: 10px;">
                                        <span style="color: #e03232">*기본 이미지는 삭제가 불가능합니다.</span>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <label for="imageForm" class="upload-name" style="border: none;width: 200px;background-color: white;color: black;" disabled="disabled">
                                이미지 수정하기
                            </label>
                            <label for="imageForm">업로드</label>
                            <input type="file" name="imageForm" id="imageForm" class="upload-hidden" accept="image/gif, image/bmp, image/png, image/jpeg" onchange="checkImage()">
                            <span style="color: red"></span>
                         </div>
                        <div class="form-group" style="width: 100%;text-align: right;">
                            <input type="submit" class="custom-button" value="수정하기" style="border-radius: 10px;">
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>
<!-- ==========Event-Section========== -->

<c:import url="../main/footer.jsp" />
<script>
    $(document).ready(function(){
        var fileTarget = $('.filebox .upload-hidden');

        fileTarget.on('change', function(){
            if(window.FileReader){
                // 파일명 추출
                var filename = $(this)[0].files[0].name;
            }

            else {
                // Old IE 파일명 추출
                var filename = $(this).val().split('/').pop().split('\\').pop();
            };

            $(this).siblings('.upload-name').text(filename);
        });

        //preview image
        var imgTarget = $('.preview-image .upload-hidden');

        imgTarget.on('change', function(){
            var parent = $(this).parent();
            parent.children('.upload-display').remove();

            if(window.FileReader){
                //image 파일만
                if (!$(this)[0].files[0].type.match(/image\//)) return;

                var reader = new FileReader();
                reader.onload = function(e){
                    var src = e.target.result;
                    parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
                }
                reader.readAsDataURL($(this)[0].files[0]);
            }

            else {
                $(this)[0].select();
                $(this)[0].blur();
                var imgSrc = document.selection.createRange().text;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

                var img = $(this).siblings('.upload-display').find('img');
                img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
            }
        });
    });
</script>
<script>
    function checkImage() {
        var imgFile = $('#input_file').val();
        var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|JPG|JPEG|PNG|GIF|BMP)$/;
        var maxSize = 5 * 1024 * 1024;
        var fileSize;

        if (imgFile != "" && imgFile != null) {
            fileSize = document.getElementById("input_file").files[0].size;

            if (!imgFile.match(fileForm)) {
                alert("이미지 파일만 업로드 가능");
                document.getElementById("input_file").value = "";
                return;
            } else if (fileSize >= maxSize) {
                alert("파일 사이즈는 5MB까지 가능");
                document.getElementById("input_file").value = "";
                return;
            }
        }
    }
</script>
</body></html>