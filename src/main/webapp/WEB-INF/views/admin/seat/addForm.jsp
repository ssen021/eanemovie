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
            <form method="post" action="/csmovie/admin/seats/add">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-couch"><a href="/csmovie/admin/seats/" style="text-decoration:none"> Seat</a></i>
                        <a href='#' class="btn btn-primary float-right" onclick="history.go(-1);"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <spring:bind path="seat.number">
                                <th scope="row" width="20%" style="vertical-align:middle;">Seat_Number <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" name="${status.expression }"
                                           id="${status.expression }" placeholder="좌석번호를 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="seat.scheduleId">
                                <th scope="row" width="20%" style="vertical-align:middle;">Schedule_Id <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="number" class="form-control" name="${status.expression }"
                                           id="${status.expression }" placeholder="스케줄번호를 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <!--
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Reservation
                            <td width="80%">
                                <select name="reservation_id" id="reservation_id" class="form-control">
                                    <option value="" selected>예매번호를 선택해주세요</option>
                                    <c:forEach var="reservation" items="${reservations}">
                                        <option value="${reservation.id}">${reservation.id}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        -->
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Reservation</th>
                            <td width="80%">
                                <input type="number" class="form-control" name="reservationId"
                                       id="reservationId" placeholder="예매번호를 입력해주세요">
                            </td>
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