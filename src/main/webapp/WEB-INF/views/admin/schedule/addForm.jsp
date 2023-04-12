<%@ page import="com.induk.cinema.domain.City" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Header -->
    <c:import url="../main/header.jsp" />

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Navigation -->
    <c:import url="../main/nav.jsp" />

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <form method="post" action="/csmovie/admin/schedules/add">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-calendar-week"><a href="/csmovie/admin/schedules" style="text-decoration:none"> Schedule</a></i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/schedules'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <spring:bind path="schedule.movie_id">
                                <th scope="row" width="20%" style="vertical-align:middle;">Movie <font color="red">*</font></th>
                                <td width="80%">
                                    <select class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="select2_1">
                                        <option value="" selected>영화명을 선택해주세요</option>
                                        <c:forEach var="movie" items="${movies}">
                                            <option value="${movie.id}">${movie.title}</option>
                                        </c:forEach>
                                    </select>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="schedule.theater_id">
                                <th scope="row" width="20%" style="vertical-align:middle;">Theater <font color="red">*</font></th>
                                <td width="80%">
                                    <select class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="select2_2">
                                        <option value="" selected>상영관명을 선택해주세요</option>
                                        <c:forEach var="theater" items="${theaters}">
                                            <option value="${theater.id}">${theater.theaterCinema.cinemaName}/${theater.name}</option>
                                        </c:forEach>
                                    </select>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="schedule.start_time">
                                <th scope="row" width="20%" style="vertical-align:middle;">Start_Time <font color="red">*</font></th>
                                <td width="80%">
                                    <div class="input-group clockpicker">
                                        <input type="text" class="form-control" name="${status.expression }"
                                               id="${status.expression }" placeholder="상영 시작시간을 입력해주세요">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-time"></span>
                                        </span>
                                    </div>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="schedule.end_time">
                                <th scope="row" width="20%" style="vertical-align:middle;">End_Time <font color="red">*</font></th>
                                <td width="80%">
                                    <div class="input-group clockpicker">
                                        <input type="text" class="form-control" name="${status.expression }"
                                               id="${status.expression }" placeholder="상영 종료시간을 입력해주세요">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-time"></span>
                                        </span>
                                    </div>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="schedule.screening_date">
                                <th scope="row" width="20%" style="vertical-align:middle;">Screening_Date <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" autocomplete="off" id="datePicker"
                                           class="${status.error ? "form-control field-error" : "form-control"}"
                                           name="${status.expression}" placeholder="상영일을 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="schedule.screening_format">
                                <th scope="row" width="20%" style="vertical-align:middle;">Screening_Format <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" name="${status.expression }"
                                           id="${status.expression }" placeholder="상영종류를 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="schedule.price">
                                <th scope="row" width="20%" style="vertical-align:middle;">Price <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="number" class="form-control" name="${status.expression }"
                                           id="${status.expression }" placeholder="가격을 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<c:import url="../main/footer.jsp" />
<!-- timepicker -->
<script src="/admin/js/clockpicker.js"></script>
<link href="/admin/css/clockpicker.css" rel="stylesheet" />
<link href="/admin/css/standalone.css" rel="stylesheet" />
<script type="text/javascript">
    $('.clockpicker').clockpicker();
</script>
</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

</body>

</html>